package web.salons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import web.salons.model.Role;
import web.salons.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public Role findRoleByRoleName(String roleName) {
		return roleRepository.findRoleByRoleName(roleName);
	}
	
	@Override
	public Role findRoleByID(int roleID) {
		return roleRepository.findRoleByID(roleID);
	}

}
