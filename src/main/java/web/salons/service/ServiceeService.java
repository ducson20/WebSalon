package web.salons.service;

import java.util.List;

import web.salons.model.Services;

public interface ServiceeService {

	List<Services> findAll();

	Services save(Services entity);

	Services findByServiceID(String serviceID);
	
	List<Services> findMainImageByServiceID(String ServiceID);
}
