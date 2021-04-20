package web.salons.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.salons.model.Employee;
import web.salons.model.Salon;
import web.salons.service.EmployeeService;
import web.salons.service.SalonService;
import web.salons.service.ServiceeService;

@Controller
@RequestMapping("admin")
public class StaffAdminController {

	@Autowired
	public EmployeeService employeeService;

	@Autowired
	public ServiceeService serviceeService;

	@Autowired
	public SalonService salonService;

	private String message = "";

	@RequestMapping(value = "/new/staff", method = RequestMethod.GET)
	public String createEmployeeGET(ModelMap model) {
		List<Salon> listSalons = null;
		try {

			listSalons = salonService.findAll();

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("listSalons", listSalons);
		return "admin/formStaff";
	}

	@RequestMapping(value = "/new/staff", method = RequestMethod.POST)
	public String createEmployeePOST(ModelMap model, @RequestParam(value = "fullName") String fullName,
			@RequestParam(value = "timeStart") String timeStart, @RequestParam(value = "timeEnd") String timeEnd,
			@RequestParam(value = "salonid") Integer salonID, @RequestParam(value = "halfADay") String halfADay,
			@RequestParam(value = "shift") String shift) throws ParseException {

		String tsl = LocalDate.now().atTime(LocalTime.parse(timeStart))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String ted = LocalDate.now().atTime(LocalTime.parse(timeEnd))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		Date timeStartFor = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tsl);
		Date timeEndFor = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ted);

		String timeOfEmp = getTimeToWordOfEmp(timeStartFor, timeEndFor);
		Employee emp = new Employee(fullName, timeOfEmp, timeStartFor, timeEndFor, halfADay, shift);
		Salon s = new Salon(salonID);
		try {
			emp.getSalons().add(s);
			s.getEmployees().add(emp);
			employeeService.save(emp);
		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "NEW EMPLOYEE SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "redirect:/admin/staffs";
	}

	@RequestMapping(value = "/staff/edit", method = RequestMethod.GET)
	public String editStaff(ModelMap model, @RequestParam(value = "staff-id") Integer staffID) {
		SimpleDateFormat formater = new SimpleDateFormat("HH:mm");
		;
		List<Salon> listSalons = null;
		Employee staff = null;
		String lSalonNameByStaff = null;
		String timeStart = "";
		String timeEnd = "";
		try {
			listSalons = salonService.findAll();
			staff = employeeService.findEmployeeByEmpID(staffID);
			lSalonNameByStaff = staff.getSalons().toString().replace("[", "").replace("]", "");

		} catch (Exception e) {
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			e.printStackTrace();
			return "errorPage";
		}
		message = "GET ALL SUCCES";
		System.err.println(message);
		model.addAttribute("listSalons", listSalons);
		timeStart = formater.format(staff.getTimeStart());
		model.addAttribute("timeStart", timeStart);
		timeEnd = formater.format(staff.getTimeEnd());
		model.addAttribute("timeEnd", timeEnd);
		model.addAttribute("staff", staff);
		model.addAttribute("lSalonNameByStaff", lSalonNameByStaff);
		return "admin/formStaff";
	}

	@RequestMapping(value = "staff/delete", method = RequestMethod.GET)
	public String deleteStaff(ModelMap model, @RequestParam(value = "staff-id") Integer staffID) {
		try {
			employeeService.deleteById(staffID);
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
		return "redirect:/admin/staffs";
	}

	@RequestMapping(value = "/staffs", method = RequestMethod.GET)
	public String listStaffByPage(ModelMap model, @RequestParam(value = "page", required = false) Integer currentPage,
			@RequestParam(value = "keyword", required = false) String keyword) {
		String message = "";
		Page<Employee> page = null;
		List<Employee> listStaffs = null;
		long totalItems = 0;
		long totalPages = 0;
		if (currentPage == null) {
			currentPage = 1;
		}
		try {
			listStaffs = employeeService.findAll();
			model.addAttribute("listStaffs", listStaffs);
			page = employeeService.listAll(currentPage, keyword);
			totalItems = page.getTotalElements();
			totalPages = page.getTotalPages();
			listStaffs = page.getContent();

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
		model.addAttribute("listStaffs", listStaffs);
		model.addAttribute("keyword", keyword);
		return "admin/formStaffDetail";

	}

	public static String getTimeToWordOfEmp(Date startDate, Date endDate) {
		List<String> timeOfEmp = new ArrayList<>();
		DateFormat dateFormat = new SimpleDateFormat("HH:mm");

		Calendar startCalendar = new GregorianCalendar();
		startCalendar.setTime(startDate);
		startCalendar.set(Calendar.MILLISECOND, 0);
		startCalendar.set(Calendar.SECOND, 0);
		int sm = startCalendar.get(Calendar.MINUTE);
		startCalendar.set(Calendar.MINUTE, sm);
		int sh = startCalendar.get(Calendar.HOUR);
		startCalendar.set(Calendar.HOUR, sh);

		Calendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(endDate);
		endCalendar.set(Calendar.MILLISECOND, 0);
		endCalendar.set(Calendar.SECOND, 0);
		int em = endCalendar.get(Calendar.MINUTE) + 30;
		endCalendar.set(Calendar.MINUTE, em);
		int eh = endCalendar.get(Calendar.HOUR);
		endCalendar.set(Calendar.HOUR, eh);
//		System.err.println(endCalendar.getTime());
		Date date;
		for (date = startCalendar.getTime(); startCalendar.before(endCalendar); startCalendar.add(Calendar.MINUTE,
				30), date = startCalendar.getTime()) {
			timeOfEmp.add(dateFormat.format(date));
		}
		String result = String.join(",", timeOfEmp);
//		System.err.println(result);
		return result;
	}
}
