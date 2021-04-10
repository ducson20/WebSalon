package web.salons.securiry.oauth;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;
import web.salons.service.ClientService;

@Controller
public class LoginOAuth2Controller {

	private static final String authorizationRequestBaseUri = "oauth2/authorize-client";
	Map<String, String> oauth2AuthenticationUrls = new HashMap<>();

	@Autowired
	private OAuth2AuthorizedClientService authorizedClientService;

	@Autowired
	private ClientService clientService;

	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String getLoginInfo(Model model, Client account, AuthenticationProvider authProvider,
			OAuth2AuthenticationToken authentication, HttpSession session) {

		OAuth2AuthorizedClient client = authorizedClientService
				.loadAuthorizedClient(authentication.getAuthorizedClientRegistrationId(), authentication.getName());
		System.err.println(client.getPrincipalName());
		String userInfoEndpointUri = client.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUri();
		if (!StringUtils.isEmpty(userInfoEndpointUri)) {
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + client.getAccessToken().getTokenValue());

			HttpEntity<String> entity = new HttpEntity<String>("", headers);
			ResponseEntity<Map> response = restTemplate.exchange(userInfoEndpointUri, HttpMethod.GET, entity,
					Map.class);
			Map userAttributes = response.getBody();
			System.err.println(userAttributes);
			String email = (String) userAttributes.get("email");
			String name = (String) userAttributes.get("name");

			try {
				account = clientService.findUserClient(email);
				if (account == null) {
					if (userAttributes.get("id") == null) {
						clientService.registerNewClientAfterOAuthLoginSuccess(email, name,
								AuthenticationProvider.google);
					}
					else {
						clientService.registerNewClientAfterOAuthLoginSuccess(email, name,
								AuthenticationProvider.facebook);
					}
				} else {
					if (userAttributes.get("id") == null) {
						clientService.updateExitClientAfterOAthLoginSuccess(account, name,
								AuthenticationProvider.google);
					} else {
						clientService.updateExitClientAfterOAthLoginSuccess(account, name,
								AuthenticationProvider.facebook);
					}
				}
				session.setAttribute("name", name);
				session.setMaxInactiveInterval(24 * 60 * 60);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "index";
	}
}
