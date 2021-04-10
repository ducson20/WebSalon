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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.salons.model.Salon;
import web.salons.service.SalonService;

@Controller
@RequestMapping("admin")
public class SalonAdminController {

	@Autowired
	private SalonService salonService;

	private String message = "";

	@RequestMapping(value = "/new/salon", method = RequestMethod.GET)
	public String createSalonGet() {
		return "admin/formSalon";
	}

	@RequestMapping(value = "/new/salon", method = RequestMethod.POST)
	public String createSalonPost(ModelMap model, @RequestParam(value = "salonName") String salonName,
			@RequestParam(value = "address") String address, @RequestParam(value = "city") String city,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "timeStart") String timeStart,
			@RequestParam(value = "timeEnd") String timeEnd) throws ParseException {
		String tsl = LocalDate.now().atTime(LocalTime.parse(timeStart))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String ted = LocalDate.now().atTime(LocalTime.parse(timeEnd))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		Date timeStartFor = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tsl);
		Date timeEndFor = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ted);

		String timeOfSalon = getTimeToWordOfSalon(timeStartFor, timeEndFor);
		try {
			salonService.save(new Salon(salonName, address, city, timeStartFor, timeEndFor, timeOfSalon, phone));
		} catch (Exception e) {
			e.printStackTrace();
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			return "errorPage";
		}
		message = "INSERT SALON SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "redirect:/admin/new/salon";
	}

	public static String getTimeToWordOfSalon(Date startDate, Date endDate) {
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
		int em = endCalendar.get(Calendar.MINUTE) + 15;
//		System.err.println(em);
		endCalendar.set(Calendar.MINUTE, em);
		int eh = endCalendar.get(Calendar.HOUR);
		endCalendar.set(Calendar.HOUR, eh);
//		System.err.println(endCalendar.get(Calendar.HOUR));
//		System.err.println(endCalendar.get(Calendar.MINUTE));
		Date date;
		for (date = startCalendar.getTime(); startCalendar.before(endCalendar); startCalendar.add(Calendar.MINUTE,
				15), date = startCalendar.getTime()) {
			timeOfEmp.add(dateFormat.format(date));
		}
		String result = String.join(",", timeOfEmp);
//		System.err.println(result);
		return result;
	}
}
