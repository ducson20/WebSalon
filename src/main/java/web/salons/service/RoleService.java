package web.salons.service;

import web.salons.model.Role;

public interface RoleService {
	Role findRoleByRoleName(String roleName);
	
	Role findRoleByID(int roleID);
	
}
