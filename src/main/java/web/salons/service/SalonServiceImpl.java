package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.salons.model.Salon;
import web.salons.repository.SalonRepository;

@Service
public class SalonServiceImpl implements SalonService{
	
	@Autowired
	private SalonRepository salonRepository;

	@Override
	public Salon save(Salon entity) {
		return salonRepository.save(entity);
	}
	
	@Override
	public List<Salon> findAll() {
		return salonRepository.findAll();
	}
	
	@Override
	public List<Salon> findSalonByCity(String city) {
		return salonRepository.findSalonByCity(city);
	}

	@Override
	public String findTimeOfSalonByAddress(int salonID) {
		return salonRepository.findTimeOfSalonByAddress(salonID);
	}

	@Override
	public List<String> findTimeOfSalon() {
		return salonRepository.findTimeOfSalon();
	}

	@Override
	public long countSalonBySalonID(String city) {
		return salonRepository.countSalonBySalonID(city);
	}

	
	
}
