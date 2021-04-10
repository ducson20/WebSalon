package web.salons.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Salon;

@Repository
public interface SalonRepository extends JpaRepository<Salon, Integer>{
	
	@Query("SELECT s.timeOfSalon FROM Salon s WHERE s.salonId = ?1")
	String findTimeOfSalonByAddress(int salonID);
	
	@Query("SELECT s.timeOfSalon FROM Salon s")
	List<String> findTimeOfSalon();
	
	@Query("SELECT s FROM Salon s WHERE s.city = ?1")
	List<Salon> findSalonByCity(String city);
	
	@Query("SELECT COUNT(s) FROM Salon s WHERE s.city = ?1")
	long countSalonBySalonID(String city);
}
