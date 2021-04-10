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
	public void registerNewClientAfterOAuthLoginSuccess(String email, String name, AuthenticationProvider authProvider) {
		Client client = new Client();
		client.setUserEmail(email);
		client.setFirstName(name);
//		client.setEnable(true);
//		client.setCreatedTime(new Date());
		client.setAuthProvider(authProvider);
		clientRepository.save(client);
	}


	@Override
	public void updateExitClientAfterOAthLoginSuccess(Client client, String name, AuthenticationProvider authProvider ) {
		client.setFirstName(name);
		client.setAuthProvider(authProvider);
		clientRepository.save(client);
	}


	@Override
	public Boolean existsByUserEmail(String email) {
		return clientRepository.existsByUserEmail(email);
	}

	
	

	
}
