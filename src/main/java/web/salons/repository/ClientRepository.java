package web.salons.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, String>{
	
	@Query("SELECT c FROM Client c WHERE c.userEmail = ?1")
	Client findUserClient(String userEmail);
	
	Boolean existsByUserEmail(String email);
	
}
