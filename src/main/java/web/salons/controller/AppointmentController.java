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
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.salons.model.Appointment;
import web.salons.model.Employee;
import web.salons.model.Salon;
import web.salons.model.ServiceDetail;
import web.salons.model.Services;
import web.salons.service.AppointmentService;
import web.salons.service.SalonService;
import web.salons.service.ServiceDetailSerivce;
import web.salons.service.ServiceeService;

@Controller
public class AppointmentController {

	@Autowired
	private ServiceeService serviceeService;

	@Autowired
	private ServiceDetailSerivce serviceDetailSerivce;

	@Autowired
	private SalonService salonService;

	@Autowired
	private AppointmentService appointmentService;

	private String message = "";

	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String bookingGet(ModelMap model) {

		List<Services> listService = null;
		List<ServiceDetail> listServiceDetail = null;
		List<Salon> listAddressOfSalon = null;

		try {
			
			listService = serviceeService.findAll();

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("H");

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("HD");

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("HC");

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("OT");

			listAddressOfSalon = salonService.findAll();

		} catch (Exception e) {
			e.printStackTrace();
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			return "errorPage";
		}

		List<String> listDate = new ArrayList<String>();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

		Calendar start = Calendar.getInstance();
		start.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date dateStart = start.getTime();

		Calendar end = Calendar.getInstance();
		end.setTimeZone(TimeZone.getTimeZone("GMT"));
		end.add(Calendar.DATE, 2);
		Date dateEnd = end.getTime();

		Calendar calendar = new GregorianCalendar();
		calendar.setTime(dateStart);
		Calendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(dateEnd);

		while (calendar.before(endCalendar)) {
			Date result = calendar.getTime();
			listDate.add(dateFormat.format(result));
			calendar.add(Calendar.DATE, 1);
		}
		System.err.println(listDate);
		model.addAttribute("listDate", listDate);

		message = "GET ALL SUCCESS";
		System.err.println(message);
		model.addAttribute("listService", listService);
		model.addAttribute("listServiceDetailH", listServiceDetail);
		model.addAttribute("listServiceDetailHD", listServiceDetail);
		model.addAttribute("listServiceDetailHC", listServiceDetail);
		model.addAttribute("listServiceDetailOT", listServiceDetail);
		model.addAttribute("listAddressOfSalon", listAddressOfSalon);
		return "appointment";
	}

	@RequestMapping(value = "/booking", method = RequestMethod.POST)
	public String bookingPost(ModelMap model, @RequestParam(value = "salon") Salon salon,
			@RequestParam(value = "employee", required = false) Employee employee,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "listServices") String listServices,
			@RequestParam(value = "timeBooked") String timeBooked,
			@RequestParam(value = "dateBooked") String dateBooked, @RequestParam Map<String, String> allParams) {
		String tb = LocalDate.now().atTime(LocalTime.parse(timeBooked))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		try {
			Date tbConvert = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tb);
			Date dbConvert = new SimpleDateFormat("MM/dd/yyyy").parse(dateBooked);

			appointmentService.save(new Appointment(employee, salon, tbConvert, false, dbConvert, phone, listServices));

		} catch (ParseException e) {
			e.printStackTrace();
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			return "errorPage";
		}
		message = "YOU BOOKED SUCCESS";
		System.err.println(message);
		model.addAttribute(message, message);
		return "redirect:booking";
	}

	public static String getDate(Calendar cal) {
		return "" + cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR);
	}
}
