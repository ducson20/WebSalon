package web.salons.service;

import java.util.List;

import web.salons.model.Salon;

public interface SalonService {

	Salon save(Salon entity);
	
	String findTimeOfSalonByAddress(int salonID);

	List<Salon> findAll();
	
	List<String> findTimeOfSalon();
	
	List<Salon> findSalonByCity(String city);
	
	long countSalonBySalonID(String city);
}
