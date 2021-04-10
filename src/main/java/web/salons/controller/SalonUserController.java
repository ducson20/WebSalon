package web.salons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.salons.model.Salon;
import web.salons.service.SalonService;

@Controller
public class SalonUserController {

	@Autowired
	private SalonService salonService;

	private String message = "";
	
	@RequestMapping(value = "/addressSalon")
	public String address() {
		return "addressSalon";
	}
	
	@RequestMapping(value = "address/{city}", method = RequestMethod.GET)
	public String listAddressByCity(ModelMap model, @PathVariable(value = "city") String city) {
		List<Salon> listAddress = null;
		try {
			
			listAddress = salonService.findSalonByCity(city);
			
		} catch (Exception e) {
			e.printStackTrace();
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			return "errorPage";
		}
		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("listAddress", listAddress);
		return "listAddress";
	}
}
