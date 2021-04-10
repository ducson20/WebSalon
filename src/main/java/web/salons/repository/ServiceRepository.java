package web.salons.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Services;

@Repository
public interface ServiceRepository extends JpaRepository<Services, String> {

	@Query("SELECT s FROM Services s WHERE s.serviceId = ?1")
	public Services findByServiceID(String serviceID);

	@Query("SELECT s FROM Services s WHERE s.serviceId = ?1")
	public List<Services> findMainImageByServiceID(String ServiceID);

}
