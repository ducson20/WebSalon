package web.salons.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import web.salons.model.Appointment;
import web.salons.model.Client;
import web.salons.model.Employee;
import web.salons.model.Salon;
import web.salons.model.ServiceDetail;
import web.salons.service.AppointmentService;
import web.salons.service.ClientService;
import web.salons.service.EmployeeService;
import web.salons.service.SalonService;
import web.salons.service.ServiceDetailSerivce;

@RestController
public class RESTController {

	@Autowired
	private SalonService salonService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private AppointmentService appointmentService;

	@Autowired
	private ClientService clientService;

	@Autowired
	private ServiceDetailSerivce serviceDetailSerivce;

	private String message = "";

	@RequestMapping(value = "/listTimeOfEmp", method = RequestMethod.GET)
	public String listTimeOfEmp(@RequestParam("employeeid") int employeeID) {
		String timeEmp = null;
		try {
			timeEmp = employeeService.findByTimeOfEmpID(employeeID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeEmp;
	}

	@RequestMapping(value = "/listTimeOfSalonBySalon", method = RequestMethod.GET)
	public String listTimeOfSalonBySalon(ModelMap model, @RequestParam(value = "salonid") int salonID) {
		String timeOfSalon = null;
		try {
			timeOfSalon = salonService.findTimeOfSalonByAddress(salonID);
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		return timeOfSalon;
	}

	@RequestMapping(value = "/listfullNameEmpBySalon", method = RequestMethod.GET, produces = "application/json")
	public List<Employee> listfullNameEmpBySalon(ModelMap model, @RequestParam(value = "salonid") int salonID) {

		List<Employee> fullNameEmp = null;
		try {
			fullNameEmp = employeeService.findfullNameEmpBySalonID(salonID);
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}
		return fullNameEmp;
	}

	@RequestMapping(value = "/listTimeOfEmployeeSalonApp", method = RequestMethod.GET, produces = "application/json")
	public List<Object> listTimeOfEmployeeSalonApp(ModelMap model, @RequestParam(value = "salonid") int salonID,
			@RequestParam(value = "employeeid") int employeeID,
			@RequestParam("datebooked") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date dateBooked) {
		List<Object> listObject = new ArrayList<Object>();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat dateformart = new SimpleDateFormat(pattern);
		String date = dateformart.format(dateBooked);

		String timeOfEmpByEmpID = null;
		List<String> timeBookedByEmpID = null;
		List<String> timeOfEmpBySalonID = null;
		String timeOfSalonBySalonID = null;
		List<String> timeBookedApp = null;
		try {
			timeOfEmpByEmpID = employeeService.findByTimeOfEmpID(employeeID);
			timeBookedByEmpID = appointmentService.findAppointmentTimeBookedByEmployeeID(employeeID, date);
			timeOfEmpBySalonID = employeeService.findTimeOfEmpBySalonID(salonID);
			timeOfSalonBySalonID = salonService.findTimeOfSalonByAddress(salonID);
			timeBookedApp = appointmentService.findAppointmentTimeBooked(date);
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}
		listObject.add(timeOfEmpByEmpID);
		listObject.add(timeBookedByEmpID);
		listObject.add(timeOfEmpBySalonID);
		listObject.add(timeOfSalonBySalonID);
		listObject.add(timeBookedApp);
		return listObject;
	}

	@RequestMapping(value = "/listTimeOfEmployeeSalonApp1", method = RequestMethod.GET, produces = "application/json")
	public List<Object> listTimeOfEmployeeSalonApp1(ModelMap model, @RequestParam(value = "salonid") int salonID,
			@RequestParam("datebooked") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date dateBooked) {
		List<Object> listObject = new ArrayList<Object>();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat dateformart = new SimpleDateFormat(pattern);
		String date = dateformart.format(dateBooked);
		List<String> timeOfEmpBySalonID = null;
		List<String> timeBookedApp = null;
		String timeOfSalonBySalonID = null;
		try {
			timeOfEmpBySalonID = employeeService.findTimeOfEmpBySalonID(salonID);
			timeBookedApp = appointmentService.findAppointmentTimeBooked(date);
			timeOfSalonBySalonID = salonService.findTimeOfSalonByAddress(salonID);
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}
		listObject.add(timeOfEmpBySalonID);
		listObject.add(timeBookedApp);
		listObject.add(timeOfSalonBySalonID);
		return listObject;
	}

	@RequestMapping(value = "/loaduserfullname", method = RequestMethod.GET)
	public String loadFullName(ModelMap model, Principal principal, HttpSession session) {
		String loginName = "";
		if (principal != null) {
			User loginedUser = null;
			try {
				loginedUser = (User) ((Authentication) principal).getPrincipal();
				Client acc = clientService.findUserClient(loginedUser.getUsername());
				session.setAttribute("fullName", acc.getLastName());
				session.setMaxInactiveInterval(24 * 60 * 60);

				loginName = clientService.findUserClient(loginedUser.getUsername()).getLastName();
				return loginName;
			} catch (Exception e) {
				message = "SOMETHING WRONG";
				System.err.println(message);
				model.addAttribute("message", message);
				e.printStackTrace();
			}
		}
		return null;
	}
//
//	@PostMapping(value = "/checkexitsemail")
//	public String checkExitEmail(@RequestParam String userEmail) {
//		if (appUser.checkExitsEmail(userEmail)) {
//			return "OK";
//		} else {
//			return "NOTOK";
//		}
//
//	}

//	@RequestMapping(value = "/loadAddressByCity", method = RequestMethod.GET)
//	public List<Salon> loadAddressByCity(ModelMap model, @RequestParam(value = "cityid") String city) {
//		List<Salon> listAddressByCity = null;
//		try {
//
//			listAddressByCity = salonService.findSalonByCityID(city);
//
//		} catch (Exception e) {
//			message = "SOMETHING WRONG";
//			System.err.println(message);
//			model.addAttribute("message", message);
//			e.printStackTrace();
//		}
//		return listAddressByCity;
//	}

	@RequestMapping(value = "/loadAddressByCity", method = RequestMethod.GET)
	public List<Salon> loadAddressByCityy(ModelMap model, @RequestParam(value = "city") String city) {
		List<Salon> listAddressByCity = null;
		try {

			listAddressByCity = salonService.findSalonByCity(city);
			
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}
		return listAddressByCity;
	}

	@RequestMapping(value = "/loadAddressByWard", method = RequestMethod.GET)
	public List<Salon> loadAddressByWard(ModelMap model, @RequestParam(value = "ward") String wardID) {
		List<Salon> listAddressByWard = null;
		try {

			listAddressByWard = salonService.findSalonByWard(wardID);

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}

		return listAddressByWard;
	}

	@RequestMapping(value = "checkExitTitle", method = RequestMethod.GET)
	public List<ServiceDetail> checkExitTitle(ModelMap model) {
		List<ServiceDetail> listServiceDetail = null;
		try {
			listServiceDetail = serviceDetailSerivce.findAll();
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}

		return listServiceDetail;
	}
	
	@RequestMapping(value = "countCity", method = RequestMethod.GET)
	public List<String[]> countCity(ModelMap model) {
		List<String[]> countCity = null;
		try {
			countCity = salonService.countSalonByCity();
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
		}

		return countCity;
	}

	@RequestMapping(value = "convertListServiceOfAppointment", method = RequestMethod.GET)
	public String convertListServiceOfAppointment(@RequestParam(value = "appointment-id") int appointmentID) {
		Appointment app = null;
		String listService = "";
		try {
			app = appointmentService.findAppointmentByID(appointmentID);
			listService = app.getListServices();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listService;
	}
}
