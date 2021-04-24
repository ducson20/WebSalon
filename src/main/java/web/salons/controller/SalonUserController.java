package web.salons.controller;

import java.util.List;
import java.text.Normalizer;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.salons.service.SalonService;

@Controller
public class SalonUserController {

	@Autowired
	private SalonService salonService;

	@RequestMapping(value = "/address-salon/{city}", method = RequestMethod.GET)
	public String handleGet(Model model, RedirectAttributes redirectAttrs, @PathVariable("city") String city) {
		List<String[]> listCountSalon = null;
		String address = "";
		try {
			listCountSalon = salonService.countSalonByCity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.err.println(city);
		switch (city) {
		case "dn":
			for (String[] o : listCountSalon) {
				if (deAccent(o[0]).equals("Đa Nang")) {
					address = o[0] + " " + "(" + o[1] + ")";
				} 
			}
			break;
		case "hn":
			for (String[] o : listCountSalon) {
				if (deAccent(o[0]).equals("Ha Noi")) {
					address = o[0] + " " + "(" + o[1] + ")";
				}
			}
			break;
		case "hcm":
			for (String[] o : listCountSalon) {
				if (deAccent(o[0]).equals("Ho Chi Minh")) {
					address = o[0] + " " + "(" + o[1] + ")";
				}
			}
			break;
		case "other-city":
			address = "Province-City";
			break;
		}

		model.addAttribute("address", address);
		return "addressSalon";
	}

	public String deAccent(String str) {
		String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(nfdNormalizedString).replaceAll("");
	}

}
