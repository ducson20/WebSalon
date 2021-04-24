package web.salons.repository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Client;

@Repository
public interface UserRepository extends JpaRepository<Client, Long>{
	
//	@Query("SELECT u FROM Client u WHERE CONCAT(u.userId, u.userEmail, u.firstName, u.lastName) LIKE %?1%")
//	public Page<Client> findAll(String keyword, Pageable pageable);
//	
	
	@Query("SELECT u FROM Client u WHERE u.userId = ?1")
	public Client findUserByID(int userID);
	
	@Query("SELECT c FROM Client c WHERE c.userEmail = ?1")
	Client findUserByEmail(String userEmail);
	
	Boolean existsByUserEmail(String email);
	
	@Query("UPDATE Client u SET u.enabled = ?1 WHERE u.userId = ?2")
	@Transactional
	@Modifying
	public void updateEnabledStatus(boolean enable, Integer userID);
	
	@Query("SELECT u FROM Client u WHERE u.hashSendMail = ?1 AND u.userEmail = ?2")
	public Client findByVerificationCode(String code, String userEmail);
	
	@Query("UPDATE Client u SET u.failedAttempt = ?1 WHERE u.userEmail = ?2")
	@Transactional
	@Modifying
	public void updateFailedAttempt(int failedAttenpt, String userEmail);
}
