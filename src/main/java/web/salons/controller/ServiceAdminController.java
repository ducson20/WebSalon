package web.salons.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.salons.model.ImageService;
import web.salons.model.ServiceDetail;
import web.salons.model.Services;
import web.salons.service.ImageServiceeService;
import web.salons.service.ServiceDetailSerivce;
import web.salons.service.ServiceeService;

@Controller
@RequestMapping("admin")
public class ServiceAdminController {

	private final String INSERT_SQL = "INSERT INTO services_details(serviceID, title, descripttion, content, price, timeToComplete, sale, mainImage) values(:serviceID, :title, :descripttion, :content, :price, :timeToComplete, :sale, :mainImage)";

	@Autowired
	private ServiceeService serviceeService;

	@Autowired
	private ServiceDetailSerivce serviceDetailSerivce;

	@Autowired
	private ImageServiceeService imageServiceeService;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	private Environment env;

	private String message = "";

	@RequestMapping(value = "/new/servicedetail", method = RequestMethod.GET)
	public String createServiceDetailGet(ModelMap model) {
		String maxSizeImg = env.getProperty("spring.servlet.multipart.max-file-size");
		System.err.println(maxSizeImg);
		List<Services> listServices = null;
		try {

			listServices = serviceeService.findAll();
			model.addAttribute("listServices", listServices);

		} catch (Exception e) {
			e.printStackTrace();
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			return "errorPage";
		}

		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "admin/formServices";
	}

	@RequestMapping(value = "/new/servicedetail", method = RequestMethod.POST)
	public String createServiceDetailPost(ModelMap model,
			@RequestParam(value = "primaryImage") MultipartFile mainMultipartFile,
			@RequestParam(value = "extraImage") MultipartFile[] extraMultipartFiles,
			@RequestParam(value = "title") String title, @RequestParam(value = "content") String content,
			@RequestParam(value = "description") String description, @RequestParam(value = "price") Double price,
			@RequestParam(value = "sale", required = false, defaultValue = "0") Double sale,
			@RequestParam(value = "timeToComplete") String timeToComplete,
			@RequestParam(value = "service") Services serviceID,
			@RequestParam(value = "serviceDetailId", required = false) Integer serviceDetailID) throws IOException {

		InputStream inputStream1 = null;
		InputStream[] inputStream2 = null;
		Path path1 = null;
		Path path2 = null;
		int serviceDetailHolderID = 0;
		String fileName1 = title + "_main.png";
		String[] fileName2 = null;
		if (serviceDetailSerivce.findServiceDetailBy(serviceDetailID) != null) {
			System.err.println("Edit service detail");
			path1 = Paths.get("src/main/webapp/main-img/service/" + serviceDetailID + "/" + title + "/");
			path2 = Paths
					.get("src/main/webapp/main-img/service/" + serviceDetailID + "/" + title + "/detail-img-service/");
			if (path1 != null) {
				Files.createDirectories(path1);
				ServiceDetail serviceDetail = new ServiceDetail(serviceDetailID, serviceID, title, description, content,
						price, timeToComplete, sale,
						"main-img/service/" + serviceDetailID + "/" + title + "/" + fileName1);
				try {
					serviceDetailSerivce.save(serviceDetail);
				} catch (Exception e) {
					message = "SOMETHING WRONG";
					System.err.println(message);
					model.addAttribute("message", message);
					e.printStackTrace();
					return "errorPage";
				}
				inputStream1 = mainMultipartFile.getInputStream();
				inputStream2 = new InputStream[extraMultipartFiles.length];

				for (int i = 0; i < extraMultipartFiles.length; i++) {
					inputStream2[i] = extraMultipartFiles[i].getInputStream();
				}

				if (path1 != null && path2 != null) {
					Files.createDirectories(path2);
					fileName2 = new String[extraMultipartFiles.length];

					if (!(mainMultipartFile.getOriginalFilename().equals("")
							|| mainMultipartFile.getOriginalFilename().equals(null))) {
						Files.copy(inputStream1, path1.resolve(fileName1), StandardCopyOption.REPLACE_EXISTING);
					}

					for (int i = 0; i < extraMultipartFiles.length; i++) {

						if (!(extraMultipartFiles[i].getOriginalFilename().equals("")
								|| extraMultipartFiles[0].getOriginalFilename().equals(null))) {
							fileName2[i] = serviceDetailID + "(" + (i + 1) + ").png";
							Files.copy(inputStream2[i], path2.resolve(fileName2[i]),
									StandardCopyOption.REPLACE_EXISTING);
							imageServiceeService.insertImgServiceDetail(serviceDetailID, "main-img/service/"
									+ serviceDetailID + "/" + title + "/detail-img-service/" + fileName2[i]);
						}
					}
				}
			}
			message = "UPDATE SUCCESS";
			System.err.println(message);
			model.addAttribute("message", message);
			return "redirect:/admin/servicedetails";

		} else {
			System.err.println("New service detail");

			ServiceDetail serviceDetail = new ServiceDetail(serviceID, title, description, content, price,
					timeToComplete, sale);
			try {
				serviceDetailHolderID = insertServiceDetail(serviceDetail).getServiceDetailId();
			} catch (Exception e) {
				message = "SOMETHING WRONG";
				System.err.println(message);
				model.addAttribute("message", message);
				e.printStackTrace();
				return "errorPage";
			}
			path1 = Paths.get("src/main/webapp/main-img/service/" + serviceDetailHolderID + "/" + title + "/");
			if (path1 != null) {
				Files.createDirectories(path1);
				try {
					serviceDetail = serviceDetailSerivce.findServiceDetailBy(serviceDetailHolderID);
				} catch (Exception ex) {
					message = "SOMETHING WRONG";
					System.err.println(message);
					model.addAttribute("message", message);
					ex.printStackTrace();
					return "errorPage";
				}
				serviceDetail.setMainImage("main-img/service/" + serviceDetailHolderID + "/" + title + "/" + fileName1);
				serviceDetailSerivce.save(serviceDetail);
				inputStream1 = mainMultipartFile.getInputStream();
				inputStream2 = new InputStream[extraMultipartFiles.length];
				for (int i = 0; i < extraMultipartFiles.length; i++) {
					inputStream2[i] = extraMultipartFiles[i].getInputStream();
				}
				path2 = Paths.get("src/main/webapp/main-img/service/" + serviceDetailHolderID + "/" + title
						+ "/detail-img-service/");
				if (path2 != null) {
					Files.createDirectories(path2);
					fileName2 = new String[extraMultipartFiles.length];

					if (!(mainMultipartFile.getOriginalFilename().equals("")
							|| mainMultipartFile.getOriginalFilename().equals(null))) {
						Files.copy(inputStream1, path1.resolve(fileName1), StandardCopyOption.REPLACE_EXISTING);
					}
					for (int i = 0; i < extraMultipartFiles.length; i++) {
						if (!(extraMultipartFiles[i].getOriginalFilename().equals("")
								|| extraMultipartFiles[0].getOriginalFilename().equals(null))) {
							fileName2[i] = serviceDetailHolderID + "(" + (i + 1) + ").png";
							Files.copy(inputStream2[i], path2.resolve(fileName2[i]),
									StandardCopyOption.REPLACE_EXISTING);
							imageServiceeService.insertImgServiceDetail(serviceDetailHolderID, "main-img/service/"
									+ serviceDetailHolderID + "/" + title + "/detail-img-service/" + fileName2[i]);
						}
					}
				}

				message = "INSERT SUCCESS";
				model.addAttribute("message", message);
				System.err.println(message);
			}
			return "redirect:/admin/servicedetails";
		}
	}

	@RequestMapping(value = "/servicedetail/edit", method = RequestMethod.GET)
	public String editServiceDetail(ModelMap model, @RequestParam(value = "servicedetailid") Integer serviceDetailID) {

		ServiceDetail serviceDetail = null;
		List<Services> listServices = null;
		List<ImageService> listImageServiceDetail = null;
		String mainImage = "";
		try {

			listServices = serviceeService.findAll();

			serviceDetail = serviceDetailSerivce.findServiceDetailBy(serviceDetailID);

			serviceDetail.getMainImage();

			listImageServiceDetail = imageServiceeService.findImageServiceByServiceDetailId(serviceDetailID);

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "GET ALL SUCCES";
		System.err.println(message);
		model.addAttribute("listServices", listServices);
		model.addAttribute("serviceDetail", serviceDetail);
		model.addAttribute("mainImage", mainImage);
		model.addAttribute("listImageServiceDetail", listImageServiceDetail);
		return "admin/formServices";
	}

	@RequestMapping(value = "servicedetail/delete", method = RequestMethod.GET)
	public String deleteServiceDetail(ModelMap model,
			@RequestParam(value = "servicedetailid") Integer serviceDetailID) {
		List<ImageService> listImgService = null;
		try {
			listImgService = imageServiceeService.findImageServiceByServiceDetailId(serviceDetailID);
			imageServiceeService.deleteAll(listImgService);
			serviceDetailSerivce.deleteById(serviceDetailID);

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "DELETE SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "redirect:/admin/servicedetails";
	}

	@RequestMapping(value = "/servicedetails", method = RequestMethod.GET)
	public String listServiceDetailByPage(ModelMap model,
			@RequestParam(value = "page", required = false) Integer currentPage,
			@RequestParam(value = "keyword", required = false) String keyword) {
		String message = "";
		Page<ServiceDetail> page = null;
		List<ServiceDetail> listServiceDetails = null;
		List<Services> listServices = null;
		long totalItems = 0;
		long totalPages = 0;
		if (currentPage == null) {
			currentPage = 1;
		}
		try {
			listServices = serviceeService.findAll();
			model.addAttribute("listServices", listServices);
			page = serviceDetailSerivce.listAll(currentPage, keyword);
			totalItems = page.getTotalElements();
			totalPages = page.getTotalPages();
			listServiceDetails = page.getContent();

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems", totalItems);
		model.addAttribute("listServiceDetails", listServiceDetails);
		model.addAttribute("keyword", keyword);
		return "admin/formServiceDetail";

	}

	public ServiceDetail insertServiceDetail(final ServiceDetail serviceDetail) {
		KeyHolder holder = new GeneratedKeyHolder();
		SqlParameterSource parameters = new MapSqlParameterSource()
				.addValue("serviceID", serviceDetail.getServices().getServiceId())
				.addValue("title", serviceDetail.getTitle()).addValue("descripttion", serviceDetail.getDescripttion())
				.addValue("content", serviceDetail.getContent()).addValue("price", serviceDetail.getPrice())
				.addValue("timeToComplete", serviceDetail.getTimeToComplete()).addValue("sale", serviceDetail.getSale())
				.addValue("mainImage", serviceDetail.getMainImage());
		namedParameterJdbcTemplate.update(INSERT_SQL, parameters, holder);
		serviceDetail.setServiceDetailId(holder.getKey().intValue());
		return serviceDetail;
	}
}
