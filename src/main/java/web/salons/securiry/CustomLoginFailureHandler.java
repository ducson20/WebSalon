package web.salons.securiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import web.salons.model.Client;
import web.salons.service.UserService;
import web.salons.service.UserServiceImpl;

@Component
public class CustomLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Autowired
	private UserService  clientService;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.err.println("onAuthenticationFailure");

		String email = request.getParameter("txtUserEmail");
		String password = request.getParameter("txtPassword");
		Client user = clientService.findUserClient(email);
		exception = new LockedException("Invalid email or password");
		String failureRedirectURL = "";
		if (user != null) {
			failureRedirectURL = "/login?error=true&email="+ email;
			System.out.println("Email is exit: " + user.getPassword());
			System.out.println("Password is exit: " + password);
			if((!user.isAccountNonLocked() && user.getFailedAttempt() == clientService.MAX_FAILED_ATTEMPT -1)) {
//				clientService.lock(user);
				failureRedirectURL = "/login?lock=true&email="+ email;
				exception = new LockedException("Your account has been locked due to 3 failed attempts. It will be unlocked after 5 minutes.");
				System.err.println(exception);
			}
			if (user.isEnabled() && user.isAccountNonLocked()) {
				if (user.getFailedAttempt() < clientService.MAX_FAILED_ATTEMPT - 1) {
					clientService.increaseFailedAttempt(user);
				}else {
					clientService.lock(user);
					exception = new LockedException("Your account has been locked due to 3 failed attempts. It will be unlocked after 5 minutes.");
//					System.err.println(exception);
				}
			}else if (!user.isAccountNonLocked()) {
				if(clientService.unLock(user)) {
					failureRedirectURL = "/login?unLock=true&email="+ email;
					exception = new LockedException("You account has been unlocked. Please try to login again.");
//					System.err.println(exception);
				}
				
			}
			if(exception.getMessage().contains("OTP")) {
				failureRedirectURL = "/login?otp=true&email="+ email;
			}else {
	            if (user.isOTPRequired()) {
	            	failureRedirectURL = "/login?otp=true&email=" + email;
	            }
	        }
		} else {
			failureRedirectURL = "/login?error=true&email="+ email;
		}
		
	
		super.setDefaultFailureUrl(failureRedirectURL);
		super.onAuthenticationFailure(request, response, exception);
	}


}
