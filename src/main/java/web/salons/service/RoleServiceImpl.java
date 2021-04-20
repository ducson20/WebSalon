package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.stereotype.Service;

import web.salons.model.Client;
import web.salons.model.Role;
import web.salons.model.UserRole;
import web.salons.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRoleService userRoleService;

	@Override
	public Role findRoleByRoleName(String roleName) {
		return roleRepository.findRoleByRoleName(roleName);
	}

	@Override
	public void createRoleFor(Client account, String roleName) {
		Role role = roleRepository.findRoleByRoleName(roleName);
		UserRole userRole = new UserRole();
		userRole.setRoles(role);
		userRole.setClients(account);
		;
		userRoleService.save(userRole);

	}

}
