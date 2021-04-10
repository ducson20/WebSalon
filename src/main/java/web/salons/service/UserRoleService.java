package web.salons.service;

import java.util.List;

import org.springframework.data.domain.Page;

import web.salons.model.UserRole;

public interface UserRoleService {
	
	List<String> getRoleName(String userEmail);

	UserRole save(UserRole entity);

	UserRole findUserRoleByID(Integer userRoleID);

	Page<UserRole> findUserRolePaging(int pageNo, int pageSize);
}
