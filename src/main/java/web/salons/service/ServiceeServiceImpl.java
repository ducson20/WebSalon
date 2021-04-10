package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.salons.model.Services;
import web.salons.repository.ServiceRepository;

@Service
public class ServiceeServiceImpl implements ServiceeService{
	
	@Autowired
	private ServiceRepository serviceRepository;

	@Override
	public Services save(Services entity) {
		return serviceRepository.save(entity);
	}

	@Override
	public List<Services> findAll() {
		return serviceRepository.findAll();
	}

	@Override
	public Services findByServiceID(String serviceID) {
		return serviceRepository.findByServiceID(serviceID);
	}

	@Override
	public List<Services> findMainImageByServiceID(String ServiceID) {
		return serviceRepository.findMainImageByServiceID(ServiceID);
	}

}
