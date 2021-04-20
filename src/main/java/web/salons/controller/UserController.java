package web.salons.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ResolvableType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.salons.model.Client;
import web.salons.securiry.EncrytedPasswordUtils;
import web.salons.securiry.WebUtils;
import web.salons.service.ClientService;
import web.salons.service.RoleService;
import web.salons.service.SendMailProcess;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class UserController {

	@Autowired
	private ClientService clientService;

	@Autowired
	private RoleService roleService;

	@Autowired
	SendMailProcess sendMail;

	@RequestMapping(value = "/login")
	public String login(ModelMap model, Principal principal,
			@RequestParam(value = "error", defaultValue = "false") boolean loginError) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			try {
				if (loginError) {
					model.addAttribute("error", "ERROR");
				}
			} catch (Exception e) {
			}

			return "login";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model , Principal principal, HttpServletRequest req) {

		if (principal != null) {
			User loginedUser = (User) ((Authentication) principal).getPrincipal();
			String userInfo = WebUtils.toString(loginedUser);
			model.addAttribute("userInfo", userInfo);
			String message = "Hi " + principal.getName() //
					+ "<br> You do not have permission to access this page!";
			model.addAttribute("message", message);
		}
		return "403Page";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		List<Client> listsAccount = clientService.findAll();
		model.addAttribute("listsAccount", listsAccount);
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerProcess(@ModelAttribute(name = "newAccount") Client acc, ModelMap model,
			HttpServletRequest req) {
		String randomNumber = UUID.randomUUID().toString();
		acc.setHashSendMail(EncrytedPasswordUtils.encrytePassword(randomNumber));
		acc.setPassword(EncrytedPasswordUtils.encrytePassword(acc.getPassword()));
		clientService.save(acc);
//		List<String> roles = new ArrayList<String>();
//		roles.add("ROLE_USER");
		String role = "ROLE_USER";
		roleService.createRoleFor(clientService.findUserClient(acc.getUserEmail()), role);
		model.addAttribute("message", "REGISTER_SUCCESS");
		return "login";
	}

	@RequestMapping(value = "/forgetpassword", method = RequestMethod.GET)
	public String forgetPasswordGet() {
		return "forgetPassword";
	}

	@RequestMapping(value = "/forgetpassword", method = RequestMethod.POST)
	public ModelAndView forgetPasswordPost(@RequestParam(name = "email") String email, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("pageError");
		mav.getModelMap().addAttribute("message", "WRONG");
		Client acc = null;
		try {
			acc = clientService.findUserClient(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			String randomNumber = UUID.randomUUID().toString();

			acc.setHashSendMail(EncrytedPasswordUtils.encrytePassword(randomNumber));
			clientService.save(acc);
			String link = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
					+ req.getContextPath() + "/forgetpasswordprocess?token1=" + acc.getUserEmail() + "&token2="
					+ acc.getHashSendMail();
			sendMail.sendResetEmail(acc.getUserEmail(), link);

			mav.getModelMap().addAttribute("message", "FORGET_SUCCESS");
			mav.setViewName("forgetPassword");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/forgetpasswordprocess", method = RequestMethod.GET)
	public String forgetPasswordProcessGet(HttpServletRequest req, ModelMap model) {
		String token1 = "";
		String token2 = "";
		String mess = "WRONG";
		Client acc = null;
		try {
			token1 = req.getParameter("token1");
			token2 = req.getParameter("token2");
			acc = clientService.findUserClient(token1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (acc != null) {

			if (token2.equals(acc.getHashSendMail())) {

				model.addAttribute("userFullName", acc.getFirstName() + " " + acc.getLastName());
				model.addAttribute("userEmail", token1);
				model.addAttribute("hashCode", token2);

				mess = "SUCCESS";
				model.addAttribute("message", mess);
				return "forgetPasswordProcess";
			}
		}
		model.addAttribute("message", mess);
		return "errorPage";
	}

	@RequestMapping(value = "/forgetpasswordprocess", method = RequestMethod.POST)
	public String forgetPasswordProcessPost(HttpServletRequest req, ModelMap model) {
		String mess = "WRONG";
		try {
			String email = req.getParameter("txtUserEmail");
			String hashCode = req.getParameter("txtHashCode");
			String newPassword = req.getParameter("userPassword");
			Client acc = clientService.findUserClient(email);
			if (acc != null) {
				if (hashCode.equals(acc.getHashSendMail())) {
					acc.setPassword(EncrytedPasswordUtils.encrytePassword(newPassword));

					clientService.save(acc);
					mess = "CHANGE_PASSWORD_SUCCESS";
					model.addAttribute("message", mess);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "errorPage";
	}
}
