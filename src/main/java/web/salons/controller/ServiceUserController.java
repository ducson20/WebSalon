package web.salons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.salons.model.ImageService;
import web.salons.model.ServiceDetail;
import web.salons.service.ImageServiceeService;
import web.salons.service.ServiceDetailSerivce;

@Controller
public class ServiceUserController {

	@Autowired
	private ServiceDetailSerivce serviceDetailSerivce;

	@Autowired
	private ImageServiceeService imageServiceeService;

	private String message = "";

	@RequestMapping(value = "services/{id}", method = RequestMethod.GET)
	public String listServiceDetailByService(ModelMap model, @PathVariable(value = "id") String serviceID) {

		List<ServiceDetail> listServiceDetail = null;

		try {
			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID(serviceID);
			model.addAttribute("listServiceDetail", listServiceDetail);

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "listServiceDetail";
	}

	@RequestMapping(value = "/service-detail/{id}", method = RequestMethod.GET)
	public String serviceName(ModelMap model, @PathVariable(value = "id") Integer serviceDetailID) {
		ServiceDetail listServiceDetail = null;
		List<ImageService> listImageServiceDetail = null;

		try {
			listServiceDetail = serviceDetailSerivce.findServiceDetailBy(serviceDetailID);
			model.addAttribute("listServiceDetail", listServiceDetail);

			listImageServiceDetail = imageServiceeService.findImageServiceByServiceDetailId(serviceDetailID);
			model.addAttribute("listImageServiceDetail", listImageServiceDetail);
			model.addAttribute("firstImageOfServiceDetail", listImageServiceDetail.toArray());

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "serviceDetail";
	}

	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public String services() {

		return "services";
	}

	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery() {

		return "gallery";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {

		return "contact";
	}

	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public String aboutUS() {

		return "aboutUs";
	}
}
