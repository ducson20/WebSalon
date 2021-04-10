package web.salons.repository;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.ServiceDetail;

@Repository
public interface ServiceDetailRepository extends JpaRepository<ServiceDetail, Integer>{
	
	@Query("SELECT sd FROM ServiceDetail sd WHERE sd.services.serviceId = ?1 ORDER BY sd.title ASC")
	List<ServiceDetail> findServiceDetailByServiceID(String serviceID);
	
	@Query("SELECT sd FROM ServiceDetail sd WHERE sd.services.serviceId LIKE %?1")
	Page<ServiceDetail> findAll(String keyword, Pageable pageable);
	
	@Query("SELECT sd FROM ServiceDetail sd WHERE sd.serviceDetailId = ?1")
	ServiceDetail findServiceDetailBy(Integer serviceDetailID);
	
	@Query("SELECT COUNT(sd) FROM ServiceDetail sd WHERE sd.services.serviceId = ?1")
	Long countServiceDetailByServiceID(String serviceID);

}
