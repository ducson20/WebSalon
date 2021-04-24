package web.salons.securiry;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import web.salons.model.Client;
import web.salons.service.UserService;
import web.salons.service.UserServiceImpl;

@Component
public class CustomBeforeAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	@Autowired
	private UserServiceImpl clientService;

//	public CustomBeforeAuthenticationFilter(AuthenticationManager authenticationManager) {
//		super.setUsernameParameter("txtUserEmail");
//		super.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/mapActionLogin", "POST"));
//	}
	public CustomBeforeAuthenticationFilter() {
		super.setUsernameParameter("txtUserEmail");
		super.setPasswordParameter("txtPassword");
		super.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/mapActionLogin", "POST"));
	}

	@Autowired
	@Override
	public void setAuthenticationManager(AuthenticationManager authenticationManager) {
		super.setAuthenticationManager(authenticationManager);
	}

	@Autowired
	@Override
	public void setAuthenticationFailureHandler(AuthenticationFailureHandler failureHandler) {
		super.setAuthenticationFailureHandler(failureHandler);
	}

	@Autowired
	@Override
	public void setAuthenticationSuccessHandler(AuthenticationSuccessHandler successHandler) {
		super.setAuthenticationSuccessHandler(successHandler);
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		System.err.println("attemptAuthentication");

		String email = request.getParameter("txtUserEmail");
		Client user = clientService.findUserClient(email);
		System.out.println(user.getFirstName());
		System.out.println("Attempt Authentication email: " + email);
		if (user != null) {

			String recaptchaFormResponse = request.getParameter("g-recaptcha-response");
			ReCaptchaV3Handler handler = new ReCaptchaV3Handler();

			// generate OTP and send email
			try {
				float spamScore = handler.verify(recaptchaFormResponse);

				if (spamScore < 0.5) {
					if (user.isOTPRequired()) {
						return super.attemptAuthentication(request, response);
					}
					clientService.generateOneTimePassword(user);
					throw new InsufficientAuthenticationException("OTP");
				}
			} catch (InvalidReCaptchaTokenException | MessagingException | UnsupportedEncodingException ex) {
				try {
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ex.getMessage());
				} catch (Exception e) {
					e.printStackTrace();
				}
				throw new AuthenticationServiceException("Error while sending OTP email.");
			}
		}

		return super.attemptAuthentication(request, response);
	}

}
