package web.salons.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.bytebuddy.utility.RandomString;
import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;
import web.salons.model.Role;
import web.salons.securiry.EncrytedPasswordUtils;
import web.salons.securiry.WebUtils;
import web.salons.service.UserService;
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
	private UserService clientService;


	@Autowired
	private SendMailProcess sendMail;

	private String message = "";

	@RequestMapping(value = "/login")
	public String login(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			return "login";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal, HttpServletRequest req) {

		if (principal != null) {
			User loginedUser = (User) ((Authentication) principal).getPrincipal();
			String userInfo = WebUtils.toString(loginedUser);
			model.addAttribute("userInfo", userInfo);
			String message = "Hi " + principal.getName() //
					+ "<br> You do not have permission to access this page!";
			model.addAttribute("message", message);
		}
		return "notice/403Page";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		return "register/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerProcess(Model model, @ModelAttribute(name = "newAccount") Client user,
			HttpServletRequest request) {
		try {
			user = clientService.registerUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (user != null) {
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/verify?email=" + user.getUserEmail() + "&code="
					+ user.getHashSendMail();
			sendMail.sendConfirmMail(user.getUserEmail(), url);
		}
		message = "REGISTER ACCOUNT SUCCESSFULLY";
		model.addAttribute("userEmail", user.getUserEmail());
		model.addAttribute("message", message);
		return "notice/noticePage";
	}

	@RequestMapping(value = "/verify", method = RequestMethod.GET)
	public String verifyUser(Model model, @Param("code") String code, @Param("email") String email) {
		if (clientService.verify(code, email)) {
			message = "VERIFY ACCOUNT SUCCESSFULLY";
			model.addAttribute("userEmail", email);
			model.addAttribute("message", message);
			return "notice/noticePage";
		} else {
			return "/";
		}
	}

	@RequestMapping(value = "/forgetpassword", method = RequestMethod.GET)
	public String forgetPasswordGet() {
		return "forget-password/forgetPassword";
	}

	@RequestMapping(value = "/forgetpassword", method = RequestMethod.POST)
	public String forgetPasswordPost(Model model, @RequestParam(name = "email") String email, HttpServletRequest request) {

		Client user = null;
		String randomNumber = RandomString.make(64);
		try {
			user = clientService.findUserClient(email);
			System.err.println(user.getUserEmail());
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (email.equals(user.getUserEmail())) {
				user.setHashSendMail(randomNumber);
				clientService.save(user);
				String link = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ request.getContextPath() + "/forgetpasswordprocess?email=" + user.getUserEmail() + "&code="
						+ user.getHashSendMail();
				sendMail.sendResetEmail(user.getUserEmail(), link);
			} else {
				message = "SOMETHING WRONG";
				model.addAttribute("message", message);
				return "notice/noticePage";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		message = "SEND MAIL TO FORGET PASSWORD SUCCESSFULLY";
		model.addAttribute("userEmail", user.getUserEmail());
		model.addAttribute("message", message);
		return "notice/noticePage";
	}

	@RequestMapping(value = "/forgetpasswordprocess", method = RequestMethod.GET)
	public String forgetPasswordProcessGet(Model model, @Param("email") String email, @Param("code") String code,
			HttpServletRequest request) {
		Client user = null;
		try {
			user = clientService.findUserClient(email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user != null) {
			if (email.equals(user.getUserEmail()) && code.equals(user.getHashSendMail())) {
				model.addAttribute("userFullName", user.getFirstName() + " " + user.getLastName());
				model.addAttribute("userEmail", email);
				model.addAttribute("hashCode", code);
			}
		}
		return "forget-password/forgetPasswordProcess";
	}

	@RequestMapping(value = "/forgetpasswordprocess", method = RequestMethod.POST)
	public String forgetPasswordProcessPost(@RequestParam(value = "txtUserEmail") String email,
			@RequestParam(value = "txtHashCode") String hashCode,
			@RequestParam(value = "userPassword") String newPassword, Model model, HttpServletRequest request) {
		Client user = null;
		try {
			user = clientService.findUserClient(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (user != null) {
			if (email.equals(user.getUserEmail()) && hashCode.equals(user.getHashSendMail())) {
				user.setPassword(web.salons.securiry.EncrytedPasswordUtils.encrytePassword(newPassword));
				clientService.save(user);
			}
		}
		message = "CHANGE PASSWORD ACCOUNT SUCCESSFULLY";
		model.addAttribute("userEmail", user.getUserEmail());
		model.addAttribute("message", message);
		return "notice/noticePage";
	}
}
