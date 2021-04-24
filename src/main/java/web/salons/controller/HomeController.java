package web.salons.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/test")
	public String test() {
		return "listServiceDetail";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model) {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
}
