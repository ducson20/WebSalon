package web.salons.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.UserRole;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

	@Query("SELECT ur.roles.roleName FROM UserRole ur WHERE ur.clients.userEmail = ?1")
	List<String> getRoleName(String userEmail);

	@Query("SELECT ur FROM UserRole ur WHERE ur.userRoleId  = ?1")
	UserRole findUserRoleByID(Integer userRoleID);

	Boolean existsByClients(String email);

}
