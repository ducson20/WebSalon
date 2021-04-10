package web.salons.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import web.salons.model.ImageService;

public interface ImageServiceeService {
	
	ImageService save(ImageService entity);
	
	List<ImageService> findImageServiceByServiceDetailId(int serviceDetailID);
	
//	List<ImageService> findImageServiceByServiceDetailId(int serviceDetailID);
	
	void insertImgServiceDetail(@Param("serviceDetailID") Integer serviceDetailID, @Param("linkImage") String linkImage);

	
}
