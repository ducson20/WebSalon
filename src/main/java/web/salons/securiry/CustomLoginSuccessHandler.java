package web.salons.securiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import web.salons.model.Client;
import web.salons.service.UserService;
import web.salons.service.UserServiceImpl;

@Component
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	private UserService clientService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		System.err.println("onAuthenticationSuccess");
		
		SalonUserDetials userDetail = (SalonUserDetials) authentication.getPrincipal();
		Client user = userDetail.getUser();
		if(user.getFailedAttempt() > 0) {
			clientService.resetFailedAttempts(user.getUserEmail());
		}
		if (user.isOTPRequired()) {
			clientService.clearOTP(user);
        }
//		Set root url
//		UrlPathHelper helper = new UrlPathHelper();
//		String contextPath = helper.getContextPath(request);
		response.sendRedirect("/");
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
