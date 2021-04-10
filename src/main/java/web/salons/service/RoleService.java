package web.salons.service;

import java.util.List;


import web.salons.model.Client;
import web.salons.model.Role;

public interface RoleService {
	Role findRoleByRoleName(String roleName);
	
	void createRoleFor(Client account, List<String> roleNames);
}
