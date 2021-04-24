package web.salons.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
import org.springframework.data.domain.Page;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.salons.model.Salon;
import web.salons.service.SalonService;

@Controller
@RequestMapping("admin")
public class SalonAdminController {

	private final String INSERT_SQL = "INSERT INTO salons(salonName, roadAndNumber, timeStart, timeEnd, timeOfSalon, phone, ward, city, imageSalon) values(:salonName, :roadAndNumber, :timeStart, :timeEnd, :timeOfSalon, :phone, :ward, :city, :imageSalon)";

	@Autowired
	private SalonService salonService;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private String message = "";

	@RequestMapping(value = "/new/salon", method = RequestMethod.GET)
	public String createSalonGet() {
		return "admin/formSalon";
	}

	@RequestMapping(value = "/new/salon", method = RequestMethod.POST)
	public String createSalonPost(Model model, @RequestParam(value = "primaryImage") MultipartFile mainMultipartFile,
			@RequestParam(value = "salonName") String salonName, @RequestParam(value = "roadAndNumber") String address,
			@RequestParam(value = "city") String city, @RequestParam(value = "phone") String phone,
			@RequestParam(value = "timeStart") String timeStart, @RequestParam(value = "timeEnd") String timeEnd,
			@RequestParam(value = "ward") String ward,
			@RequestParam(value = "salonID", required = false) Integer salonID) throws ParseException, IOException {

		InputStream inputStream = null;
		Path path = null;
		int salonHolderID = 0;
		String timeOfSalon = "";
		String fileName = salonName + "_main.png";
		String tsl = LocalDate.now().atTime(LocalTime.parse(timeStart))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String ted = LocalDate.now().atTime(LocalTime.parse(timeEnd))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Date timeStartFor = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tsl);
		Date timeEndFor = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ted);
		timeOfSalon = getTimeToWordOfSalon(timeStartFor, timeEndFor);
		if (salonID != null) {
			path = Paths.get("src/main/webapp/main-img/salon/" + salonID + "/" + salonName + "/");
			Salon salon = new Salon(salonID, salonName, address, timeStartFor, timeEndFor, timeOfSalon, phone, city,
					ward, "main-img/salon/" + salonID + "/" + salonName + "/" + fileName);
			if (path != null) {
				Files.createDirectories(path);
				salonService.save(salon);
				inputStream = mainMultipartFile.getInputStream();
				if (!(mainMultipartFile.getOriginalFilename().equals("")
						|| mainMultipartFile.getOriginalFilename().equals(null))) {
					Files.copy(inputStream, path.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
				}
			}
			message = "UPDATE SALON SUCCESSFULLY";
			model.addAttribute("message", message);
		} else {
			Salon salon = new Salon(salonName, address, timeStartFor, timeEndFor, timeOfSalon, phone, city, ward);
			try {
				salonHolderID = insertSalon(salon).getSalonId();
			} catch (Exception e) {
				e.printStackTrace();
			}
			path = Paths.get("src/main/webapp/main-img/salon/" + salonHolderID + "/" + salonName + "/");
			if (path != null) {
				Files.createDirectories(path);
				try {
					salon = salonService.findSalonBySalonID(salonHolderID);
				} catch (Exception e) {
					e.printStackTrace();
				}
				salon.setImageSalon("main-img/salon/" + salonHolderID + "/" + salonName + "/" + fileName);
				salonService.save(salon);
				inputStream = mainMultipartFile.getInputStream();
				if (!(mainMultipartFile.getOriginalFilename().equals("")
						|| mainMultipartFile.getOriginalFilename().equals(null))) {
					Files.copy(inputStream, path.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
				}
			}
			message = "INSERT SALON SUCCESSFULLY";
			model.addAttribute("message", message);
		}

		return "redirect:/admin/salons";
	}

	@RequestMapping(value = "/salon/edit", method = RequestMethod.GET)
	public String editServiceDetail(Model model, @RequestParam(value = "salon-id") Integer salonID) {
		
		List<Salon> listSalons = null;
		Salon salon = null;
		try {
			listSalons = salonService.findAll();
			salon = salonService.findSalonBySalonID(salonID);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		model.addAttribute("listSalons", listSalons);
		model.addAttribute("salon", salon);
		return "admin/formSalon";
	}

	@RequestMapping(value = "salon/delete", method = RequestMethod.GET)
	public String deleteServiceDetail(ModelMap model, @RequestParam(value = "salon-id") Integer salonID) {
		try {
			salonService.deleteById(salonID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		message = "DELETE SALON SUCCESSFULLY";
		model.addAttribute("message", message);
		return "redirect:/admin/salons";
	}

	@RequestMapping(value = "/salons", method = RequestMethod.GET)
	public String listSalonByPage(Model model, @RequestParam(value = "page", required = false) Integer currentPage,
			@RequestParam(value = "keyword", required = false) String keyword) {
		String message = "";
		Page<Salon> page = null;
		List<Salon> listSalons = null;
		long totalItems = 0;
		long totalPages = 0;
		if (currentPage == null) {
			currentPage = 1;
		}
		try {
			listSalons = salonService.findAll();
			model.addAttribute("listSalons", listSalons);
			page = salonService.listAll(currentPage, keyword);
			totalItems = page.getTotalElements();
			totalPages = page.getTotalPages();
			listSalons = page.getContent();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems", totalItems);
		model.addAttribute("listSalons", listSalons);
		model.addAttribute("keyword", keyword);
		return "admin/formSalonDetail";

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

	public Salon insertSalon(final Salon salon) {
		KeyHolder holder = new GeneratedKeyHolder();
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("salonName", salon.getSalonName())
				.addValue("roadAndNumber", salon.getRoadAndNumber()).addValue("timeStart", salon.getTimeStart())
				.addValue("timeEnd", salon.getTimeEnd()).addValue("timeOfSalon", salon.getTimeOfSalon())
				.addValue("phone", salon.getPhone()).addValue("ward", salon.getWard()).addValue("city", salon.getCity())
				.addValue("imageSalon", salon.getImageSalon());
		namedParameterJdbcTemplate.update(INSERT_SQL, parameters, holder);
		salon.setSalonId(holder.getKey().intValue());
		return salon;
	}
}
