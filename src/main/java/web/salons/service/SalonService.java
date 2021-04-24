package web.salons.service;

import java.util.List;

import org.springframework.data.domain.Page;

import web.salons.model.Salon;

public interface SalonService {

	List<Salon> findAll();
	
	Salon save(Salon entity);
	
	void deleteById(Integer id);
	
	Salon findSalonBySalonID(int salonID);
	
	String findTimeOfSalonByAddress(int salonID);

	List<String> findTimeOfSalon();
	
	List<Salon> findSalonByCity(String city);

	List<Salon> findSalonByWard(String ward);

	List<String[]> countSalonByCity();
	
	Page<Salon> listAll(int pageNumber, String keyword);

	

}
