package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import web.salons.model.Client;
import web.salons.model.Role;
import web.salons.model.UserRole;
import web.salons.repository.RoleRepository;
import web.salons.repository.UserRoleRepository;

@Service
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserRoleRepository userRoleRepository;

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public Boolean existsByClients(String email) {
		return userRoleRepository.existsByClients(email);
	}
	
	@Override
	public List<String> getRoleName(String userEmail) {
		return userRoleRepository.getRoleName(userEmail);
	}

	@Override
	public UserRole save(UserRole entity) {
		return userRoleRepository.save(entity);
	}

	@Override
	public UserRole findUserRoleByID(Integer userRoleID) {
		return userRoleRepository.findUserRoleByID(userRoleID);
	}

	@Override
	public Page<UserRole> findUserRolePaging(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return userRoleRepository.findAll(pageable);
	}

	

//	@Override
//	public UserRole registerRoleClientAfterOAuthLoginSuccess(Client account, List<String> roleNames) {
//		for(String roleName : roleNames)
//		Role role = roleRepository.findRoleByRoleName(roleName);
//		UserRole userRole = new UserRole();
//		userRole.setClients(client);
//		userRole.setRoles(roleName);
//		return userRoleRepository.save(userRole);
//	}

}
