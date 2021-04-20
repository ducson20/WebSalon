package web.salons.securiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.reactive.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.token.KeyBasedPersistenceTokenService;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.endpoint.NimbusAuthorizationCodeTokenResponseClient;
import org.springframework.security.oauth2.client.endpoint.OAuth2AccessTokenResponseClient;
import org.springframework.security.oauth2.client.endpoint.OAuth2AuthorizationCodeGrantRequest;

import org.springframework.security.oauth2.client.web.AuthorizationRequestRepository;
import org.springframework.security.oauth2.client.web.HttpSessionOAuth2AuthorizationRequestRepository;
import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;

import web.salons.securiry.oauth.ClientOAuth2UserService;
import web.salons.securiry.oauth.OAuth2LoginSuccessHandler;
import web.salons.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter { // (Kế thừa bảo mật web)

	@Autowired
	private UserDetailsServiceImpl userDetails;

	@Autowired
	private ClientOAuth2UserService oAuth2UserService;

	@Autowired
	private OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	@Bean
	public AuthorizationRequestRepository<OAuth2AuthorizationRequest> authorizationRequestRepository() {

		return new HttpSessionOAuth2AuthorizationRequestRepository();
	}

	@Bean
	public OAuth2AccessTokenResponseClient<OAuth2AuthorizationCodeGrantRequest> accessTokenResponseClient() {

		return new NimbusAuthorizationCodeTokenResponseClient();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		// Authentication Manager Builder: Trình tạo quản lý xác thực
		// Sét đặt dịch vụ để tìm kiếm User trong Database.
		// Và sét đặt PasswordEncoder.
		auth.userDetailsService(userDetails).passwordEncoder(passwordEncoder());

	}

	@Override
	protected void configure(HttpSecurity http) {
		try {
			http.csrf().disable();

			// Các trang không yêu cầu login
			http.authorizeRequests().antMatchers("/resources/**", "/", "/login", "/register",
					"/oauth2/**", "services", "gallery", "contact", "aboutUS", "/booking").permitAll();

			// Trang /userInfo yêu cầu phải login với vai trò ROLE_USER hoặc ROLE_ADMIN.
			// Nếu chưa login, nó sẽ redirect tới trang /login.
			http.authorizeRequests().antMatchers("/user/**")
					.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

			// Trang chỉ dành cho ADMIN
			http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");

			// Khi người dùng đã login, với vai trò XX.
			// Nhưng truy cập vào trang yêu cầu vai trò YY,
			// Ngoại lệ AccessDeniedException sẽ ném ra.
			http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

			// Cấu hình cho Login Form.

			http.authorizeRequests().and()
					.formLogin().loginProcessingUrl("/mapActionLogin").loginPage("/login").defaultSuccessUrl("/")
					.failureUrl("/login?error=true").usernameParameter("txtUserEmail").passwordParameter("txtPassword")
					.and().oauth2Login().loginPage("/login").defaultSuccessUrl("/loginSuccess")
					.failureUrl("/login?error=true").authorizationEndpoint().baseUri("/oauth2/authorize-client")
					.authorizationRequestRepository(authorizationRequestRepository());
//			.and()
//			.oauth2Login()
//					.loginPage("/login")
//					.failureUrl("/login?error=true")
//					.userInfoEndpoint()
//					.userService(oAuth2UserService)
//					.and()
//					.successHandler(oAuth2LoginSuccessHandler);

			http.logout().logoutSuccessUrl("/login").invalidateHttpSession(true).deleteCookies("JSESSIONID")
			.and().rememberMe().key("asdfghjklqwertyuio_1234567890").tokenValiditySeconds(7 * 24 * 60 * 60);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// This bean is load the user specific data when form login is used.

		// Cấu hình cho Logout Page.
//				.and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");

	}

	@Override
	public UserDetailsService userDetailsService() {
		return userDetails;
	}

}