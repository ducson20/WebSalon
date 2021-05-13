package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import web.salons.model.ServiceDetail;
import web.salons.repository.ServiceDetailRepository;

@Service
public class ServiceDetailImpl implements ServiceDetailSerivce {

	@Autowired
	private ServiceDetailRepository serviceDetailRepository;

	@Override
	public ServiceDetail save(ServiceDetail entity) {
		return serviceDetailRepository.save(entity);
	}

	@Override
	public List<ServiceDetail> findAll() {
		return serviceDetailRepository.findAll();
	}

	@Override
	public void deleteById(Integer id) {
		serviceDetailRepository.deleteById(id);
	}

	public void delete(ServiceDetail entity) {
		serviceDetailRepository.delete(entity);
	}

	@Override
	public List<ServiceDetail> findServiceDetailByServiceID(String serviceID) {
		return serviceDetailRepository.findServiceDetailByServiceID(serviceID);
	}

	@Override
	public Page<ServiceDetail> listAll(int pageNumber, String sortField, String sortDir, String keyword) {
		Sort sort = Sort.by(sortField);

		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		Pageable pageable = PageRequest.of(pageNumber - 1, 5, sort);
		if (keyword != null) {
			return serviceDetailRepository.findAll(keyword, pageable);
		}
		return serviceDetailRepository.findAll(pageable);
	}

	@Override
	public ServiceDetail findServiceDetailBy(Integer serviceDetailID) {
		return serviceDetailRepository.findServiceDetailBy(serviceDetailID);
	}

	@Override
	public Long countServiceDetailByServiceID(String serviceID) {
		return serviceDetailRepository.countServiceDetailByServiceID(serviceID);
	}

}
