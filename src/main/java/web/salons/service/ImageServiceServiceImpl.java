package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.salons.model.ImageService;

import web.salons.repository.ImageRepository;

@Service
public class ImageServiceServiceImpl implements ImageServiceeService{
	
	@Autowired
	private ImageRepository imageRepository;

	@Override
	public ImageService save(ImageService entity) {
		return imageRepository.save(entity);
	}
	
	@Override
	public void deleteById(Integer id) {
		imageRepository.deleteById(id);
	}


	@Override
	public void deleteAll(List<ImageService> entities) {
		imageRepository.deleteAll(entities);
	}

	@Override
	public void insertImgServiceDetail(Integer serviceDetailID, String linkImage) {
		imageRepository.insertImgServiceDetail(serviceDetailID, linkImage);		
	}

	@Override
	public List<ImageService> findImageServiceByServiceDetailId(int serviceDetailID) {
		return imageRepository.findImageServiceByServiceDetailId(serviceDetailID);
	}


	
}
