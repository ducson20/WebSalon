package web.salons.service;

import java.util.List;

import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;

public interface ClientService {
	
	Client findUserClient(String userEmail);
	
	Boolean existsByUserEmail(String email);

	List<Client> findAll();

	Client save(Client entity);

	void registerNewClientAfterOAuthLoginSuccess(String email, String name, AuthenticationProvider facebook);

	void updateExitClientAfterOAthLoginSuccess(Client client, String name, AuthenticationProvider uthProvider);


}
