package web.salons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.salons.model.UserRole;
import web.salons.service.RoleService;
import web.salons.service.UserRoleService;

@Controller
@RequestMapping("admin")
public class UserAdminController {

	@Autowired
	private UserRoleService userRoleService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/usermanager", method = RequestMethod.GET)
	public String usermamager(ModelMap model, @RequestParam(value = "userid") Integer userID) {
		String message = "SOMETHING WRONG";
		UserRole user = null;
		try {
			user = userRoleService.findUserRoleByID(userID);
			model.addAttribute("user", user);
			return "admin/userAdminDetail";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", message);
		return "errorPage";
	}

	@RequestMapping(value = "/setroleadmin", method = RequestMethod.POST)
	public String setRoleAdmin(ModelMap model, @RequestParam(value = "userid") Integer userID) {
		String message = "SOMETHING WRONG";
		UserRole user = null;
		try {
			user = userRoleService.findUserRoleByID(userID);
			user.setRoles(roleService.findRoleByRoleName("ROLE_ADMIN"));
			userRoleService.save(user);
			message = "SET ROLE SUCCESS";
			model.addAttribute("message", message);
			return "redirect:/admin/usermanager?userid=" + userID;
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", message);
		return "errorPage";
	}

	@RequestMapping(value = "/removeroleadmin", method = RequestMethod.POST)
	public String removeRoleAdmin(ModelMap model, @RequestParam(value = "userid") Integer userID) {
		String message = "SOMETHING WRONG";
		UserRole user = null;
		try {

			user = userRoleService.findUserRoleByID(userID);
			user.setRoles(roleService.findRoleByRoleName("ROLE_USER"));
			userRoleService.save(user);
			message = "REMOVE ROLE SUCCESS";
			model.addAttribute("message", message);
			return "redirect:/admin/usermanager?userid=" + userID;
		} catch (

		Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", message);
		return "errorPage";
	}

	@RequestMapping(value = "/userdetails", method = RequestMethod.GET)
	public String userDetail(ModelMap model, @RequestParam(value = "page", required = false) Integer currentPage) {
		String message = "SOMETHING WRONG";
		int pageSize = 5;
		Page<UserRole> page = null;
		// list of items on this page
		List<UserRole> listUserRole = null;
		// current page number
		if (currentPage == null) {
			currentPage = 1;
		}
		try {
			page = userRoleService.findUserRolePaging(currentPage, pageSize);
			listUserRole = page.getContent();
			model.addAttribute("currentPage", currentPage);
			// total number of pages
			model.addAttribute("totalPages", page.getTotalPages());
			model.addAttribute("next", currentPage < page.getTotalPages());
			// total number of items
			model.addAttribute("totalItems", page.getTotalElements());
			model.addAttribute("listUserRole", listUserRole);
			return "admin/listUserAdmin";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", message);
		return "errorPage";

	}
}
