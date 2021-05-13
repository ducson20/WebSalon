package web.salons.service;

import java.util.List;

import org.springframework.data.domain.Page;

import web.salons.model.ServiceDetail;

public interface ServiceDetailSerivce {

	ServiceDetail save(ServiceDetail entity);

	List<ServiceDetail> findAll();

	List<ServiceDetail> findServiceDetailByServiceID(String serviceID);

	Page<ServiceDetail> listAll(int pageNumber, String sortField, String sortDir, String keyword);

	ServiceDetail findServiceDetailBy(Integer serviceDetailID);

	void deleteById(Integer id);

	Long countServiceDetailByServiceID(String serviceID);

}
