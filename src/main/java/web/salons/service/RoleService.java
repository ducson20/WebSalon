package web.salons.service;

import java.util.List;

import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;

import web.salons.model.Client;
import web.salons.model.Role;

public interface RoleService {
	Role findRoleByRoleName(String roleName);
	
	void createRoleFor(Client account, String roleNames);
	
}
