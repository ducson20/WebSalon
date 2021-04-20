package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;
import web.salons.repository.ClientRepository;

@Service
public class ClientServiceImpl implements ClientService{

	@Autowired
	private ClientRepository clientRepository;

	@Override
	public Client findUserClient(String userEmail) {
		return clientRepository.findUserClient(userEmail);
	}

	
	@Override
	public Client save(Client entity) {
		return clientRepository.save(entity);
	}


	@Override
	public List<Client> findAll() {
		return clientRepository.findAll();
	}


	@Override
	public void registerNewClientAfterOAuthLoginSuccess(String email, String name) {
		Client client = new Client();
		client.setUserEmail(email);
		client.setFirstName(name);
		clientRepository.save(client);
	}


	@Override
	public void updateExitClientAfterOAuthLoginSuccess(Client client, String name, AuthenticationProvider authProvider ) {
		client.setLastName(name);
		client.setAuthProvider(authProvider);
		clientRepository.save(client);
	}
	
	@Override
	public void updateExitClientAfterOAuthLoginSuccessHasRole(Client client, AuthenticationProvider uthProvider) {
		client.setAuthProvider(uthProvider);
		clientRepository.save(client);
	}


	@Override
	public Boolean existsByUserEmail(String email) {
		return clientRepository.existsByUserEmail(email);
	}

	
}
