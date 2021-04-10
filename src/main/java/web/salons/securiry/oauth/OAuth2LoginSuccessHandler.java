package web.salons.securiry.oauth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;
import web.salons.service.ClientService;

@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	private ClientService clientService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		ClientOAuth2User oAuth2User = (ClientOAuth2User) authentication.getPrincipal();
		String email = oAuth2User.getEmail();
		Client client = clientService.findUserClient(email);
		String name = oAuth2User.getFullName();
		
		System.err.println(client);
		 
		if (client == null) {
			clientService.registerNewClientAfterOAuthLoginSuccess(email, name, AuthenticationProvider.facebook);

		} else {
			clientService.updateExitClientAfterOAthLoginSuccess(client, name, AuthenticationProvider.facebook);

		}
		super.onAuthenticationSuccess(request, response, authentication);

	}


	
}
