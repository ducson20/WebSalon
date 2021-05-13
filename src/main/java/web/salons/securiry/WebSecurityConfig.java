package web.salons.securiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.web.AuthorizationRequestRepository;
import org.springframework.security.oauth2.client.web.HttpSessionOAuth2AuthorizationRequestRepository;
import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.web.util.UrlPathHelper;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private DataSource dataSource;
	
	@Bean
	public UserDetailsService userDetailService() {
		return new UserDetailServiceImpl();
	}
	
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
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setPasswordEncoder(passwordEncoder());
		authProvider.setUserDetailsService(userDetailService());
		return authProvider;
	}

	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		try {
		
//		http.csrf().disable();

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
		
		http
//		.csrf().disable()
		.authorizeRequests()
		.and()
		.addFilterBefore(customBeforeAuthenticationFilter, CustomBeforeAuthenticationFilter.class)
			.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/mapActionLogin")
				.usernameParameter("txtUserEmail")
				.passwordParameter("txtPassword")
//				.defaultSuccessUrl("/")
//				.failureUrl("/login?error")
				.successHandler(customLoginSuccessHandler)
				.failureHandler(customLoginFailureHandler)
//				.successHandler(new AuthenticationSuccessHandler() {
//				@Override
//				public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//						Authentication authentication) throws IOException, ServletException {
//					String name = authentication.getName();
//					System.err.println("Logged is user: " + name);
////					Set root url
////					UrlPathHelper helper = new UrlPathHelper();
////					String contextPath = helper.getContextPath(request);
//					response.sendRedirect("/");
//				}
//			})
//				.failureHandler(new AuthenticationFailureHandler() {
//					
//					@Override
//					public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
//							AuthenticationException exception) throws IOException, ServletException {
//						System.err.println("login failure!!...");
//						System.err.println(exception);
//						response.sendRedirect("/login?error=true");
//					}
//				})	

				
		.and()
			.oauth2Login()
				.loginPage("/login")
				.defaultSuccessUrl("/loginSuccess")
				.failureUrl("/login?error")
				.authorizationEndpoint()
				.baseUri("/oauth2/authorize-client")
				.authorizationRequestRepository(authorizationRequestRepository());
				
		
		http.logout()
		.logoutUrl("/logout")
		.logoutSuccessUrl("/login?logout=true")
//		.logoutSuccessHandler(new LogoutSuccessHandler() {
			
//			@Override
//			public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
//					throws IOException, ServletException {
//				response.sendRedirect("/login?logout=true");
//			}
//		})
		.invalidateHttpSession(true).deleteCookies("JSESSIONID")
		.and()
		.rememberMe().tokenRepository(persistentTokenRepository())
		.tokenValiditySeconds(1209600);
;
		

//		.and().rememberMe().key("asdfghjklqwertyuio_1234567890").tokenValiditySeconds(7 * 24 * 60 * 60);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 private PersistentTokenRepository persistentTokenRepository() {
		 JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		 tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}

	@Autowired
	private CustomBeforeAuthenticationFilter customBeforeAuthenticationFilter;
     
	@Autowired
	private CustomLoginFailureHandler customLoginFailureHandler;
	
	@Autowired
	private CustomLoginSuccessHandler customLoginSuccessHandler;
	
	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
	@Override
	 public AuthenticationManager authenticationManagerBean() throws Exception {
	        return super.authenticationManagerBean();
	}
	
}
