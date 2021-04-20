package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import web.salons.model.Salon;
import web.salons.model.ServiceDetail;
import web.salons.repository.SalonRepository;

@Service
public class SalonServiceImpl implements SalonService {

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
	public String findTimeOfSalonByAddress(int salonID) {
		return salonRepository.findTimeOfSalonByAddress(salonID);
	}

	@Override
	public List<String> findTimeOfSalon() {
		return salonRepository.findTimeOfSalon();
	}

	@Override
	public List<String[]> countSalonByCity() {
		return salonRepository.countSalonByCity();
	}

	@Override
	public List<Salon> findSalonByCity(String city) {
		return salonRepository.findSalonByCity(city);
	}

	@Override
	public List<Salon> findSalonByWard(String ward) {
		return salonRepository.findSalonByWard(ward);
	}

	@Override
	public Page<Salon> listAll(int pageNumber, String keyword) {
		Pageable pageable = PageRequest.of(pageNumber - 1, 5);
		if (keyword != null) {
			return salonRepository.findAll(keyword, pageable);
		}
		return salonRepository.findAll(pageable);
	}

	@Override
	public Salon findSalonBySalonID(int salonID) {
		return salonRepository.findSalonBySalonID(salonID);
	}

	@Override
	public void deleteById(Integer id) {
		salonRepository.deleteById(id);
	}
	
	
	

}
