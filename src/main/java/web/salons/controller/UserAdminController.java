package web.salons.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.salons.model.Client;
import web.salons.model.Role;
import web.salons.service.UserService;
import web.salons.service.RoleService;

@Controller
@RequestMapping("admin")
public class UserAdminController {

	@Autowired
	private UserService clientService;

	@Autowired
	private RoleService roleService;

	private String message = "";

	@RequestMapping(value = "/usermanager", method = RequestMethod.GET)
	public String usermamager(ModelMap model, @RequestParam(value = "userid") Integer userID) {
		Client user = null;
		try {
			user = clientService.findUserByID(userID);
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/userAdminDetail";
	}

	@RequestMapping(value = "/setroleadmin", method = RequestMethod.POST)
	public String setRoleAdmin(ModelMap model, @RequestParam(value = "userid") Integer userID) {
		Client user = null;
		Role role = null;
		Set<Role> roles = new HashSet<>();

		try {
			user = clientService.findUserByID(userID);
			role = roleService.findRoleByID(2);
			roles.add(role);
			user.setRoles(roles);
			clientService.save(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		message = "SET ROLE ADMIN SUCCESSFULLY";
		model.addAttribute("message", message);
		return "redirect:/admin/usermanager?userid=" + userID;
	}

	@RequestMapping(value = "/removeroleadmin", method = RequestMethod.POST)
	public String removeRoleAdmin(ModelMap model, @RequestParam(value = "userid") Integer userID) {
		Client user = null;
		Role role = null;
		Set<Role> roles = new HashSet<>();
		try {
			user = clientService.findUserByID(userID);
			role = roleService.findRoleByID(1);
			roles.add(role);
			user.setRoles(roles);
			clientService.save(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		message = "REMOVE ROLE ADMIN SUCCESS";
		model.addAttribute("message", message);
		return "redirect:/admin/usermanager?userid=" + userID;
	}

	@RequestMapping(value = "/userdetails", method = RequestMethod.GET)
	public String userDetail(ModelMap model, @RequestParam(value = "page", required = false) Integer currentPage) {
		int pageSize = 5;
		Page<Client> page = null;
		// list of items on this page
		List<Client> listUsers = null;
		// current page number
		if (currentPage == null) {
			currentPage = 1;
		}
		try {
			page = clientService.findUserPaging(currentPage, pageSize);
			listUsers = page.getContent();
			model.addAttribute("currentPage", currentPage);
			// total number of pages
			model.addAttribute("totalPages", page.getTotalPages());
			model.addAttribute("next", currentPage < page.getTotalPages());
			// total number of items
			model.addAttribute("totalItems", page.getTotalElements());
			model.addAttribute("listUsers", listUsers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/listUserAdmin";

	}
}
