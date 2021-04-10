package web.salons.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, String>{
	
	@Query("SELECT r FROM Role r WHERE r.roleName = ?1")
	public Role findRoleByRoleName(String roleName);
}
