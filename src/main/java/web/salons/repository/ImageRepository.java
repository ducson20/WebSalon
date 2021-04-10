package web.salons.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import web.salons.model.ImageService;

@Repository
public interface ImageRepository extends JpaRepository<ImageService, Integer>{

	
	@Query("SELECT i FROM ImageService i WHERE i.servicesDetails.serviceDetailId = ?1")
	List<ImageService> findImageServiceByServiceDetailId(int serviceDetailID);
	
//	@Query(value = "SELECT * FROM services s "
//			+ "INNER JOIN services_details sd ON s.serviceID = sd.serviceID", nativeQuery = true)
//	public List<Object> findMainImage();
		
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO imageServices (serviceDetailID, linkImage) VALUES (:serviceDetailID, :linkImage)", nativeQuery = true)
	void insertImgServiceDetail(@Param("serviceDetailID") Integer serviceDetailID, @Param("linkImage") String linkImage);
	
	
}
