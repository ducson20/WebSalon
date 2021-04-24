package web.salons.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Salon;

@Repository
public interface SalonRepository extends JpaRepository<Salon, Integer>{
	
	@Query("SELECT s FROM Salon s WHERE s.salonId = ?1")
	Salon findSalonBySalonID(Integer salonID);
	
	@Query("SELECT s.timeOfSalon FROM Salon s WHERE s.salonId = ?1")
	String findTimeOfSalonByAddress(Integer salonID);
	
	@Query("SELECT s.timeOfSalon FROM Salon s")
	List<String> findTimeOfSalon();
	
	@Query("SELECT s FROM Salon s WHERE s.city = ?1")
	List<Salon> findSalonByCity(String city);
	
	@Query("SELECT s FROM Salon s WHERE s.ward = ?1")
	List<Salon> findSalonByWard(String ward);
	
	@Query("SELECT s.city, COUNT(s) FROM Salon AS s GROUP BY s.city ORDER BY s.city ASC")
	List<String[]> countSalonByCity();
	
	@Query("SELECT s FROM Salon s WHERE s.salonName LIKE %?1")
	Page<Salon> findAll(String keyword, Pageable pageable);
		
}
