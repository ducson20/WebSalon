package web.salons.controller;

import java.security.Principal;
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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import web.salons.model.Appointment;
import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;
import web.salons.model.Employee;
import web.salons.model.Salon;
import web.salons.model.ServiceDetail;
import web.salons.model.Services;
import web.salons.securiry.oauth.ClientOAuth2User;
import web.salons.service.AppointmentService;
import web.salons.service.ClientService;
import web.salons.service.SalonService;
import web.salons.service.ServiceDetailSerivce;
import web.salons.service.ServiceeService;

@Controller
public class AppointmentController {
//	employee, salon, tbConvert, false, dbConvert, phone, listServices

	private final String INSERT_SQL = "INSERT INTO appointments(employeeID, salonID, timeBooked, canceled, dateBooked, phone, listServices) values(:employeeID, :salonID, :timeBooked, :canceled, :dateBooked, :phone, :listServices)";

	@Autowired
	private ServiceeService serviceeService;

	@Autowired
	private ServiceDetailSerivce serviceDetailSerivce;

	@Autowired
	private SalonService salonService;

	@Autowired
	private ClientService clientService;

	@Autowired
	private AppointmentService appointmentService;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	private OAuth2AuthorizedClientService authorizedClientService;

	private String message = "";

	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String bookingGet(ModelMap model, OAuth2AuthenticationToken authentication, Principal principal) {

		List<Services> listService = null;
		List<ServiceDetail> listServiceDetail = null;
		List<Salon> listAddressOfSalon = null;

		OAuth2AuthorizedClient client = authorizedClientService
				.loadAuthorizedClient(authentication.getAuthorizedClientRegistrationId(), authentication.getName());
		String userInfoEndpointUri = client.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUri();
		if (!StringUtils.isEmpty(userInfoEndpointUri)) {
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + client.getAccessToken().getTokenValue());

			HttpEntity<String> entity = new HttpEntity<String>("", headers);
			ResponseEntity<Map> response = restTemplate.exchange(userInfoEndpointUri, HttpMethod.GET, entity,
					Map.class);
			Map userAttributes = response.getBody();

			String email = (String) userAttributes.get("email");
			String name = (String) userAttributes.get("name");

			if (userAttributes.get("id") != null) {
				System.err.println(userAttributes.get("id"));
			} else {
				System.err.println("google");
			}
		}
		try {

			listService = serviceeService.findAll();

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("H");
			System.err.println(listServiceDetail);
			model.addAttribute("listServiceDetailH", listServiceDetail);

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("HD");

			listServiceDetail = serviceDetailSerivce.findServiceDetailByServiceID("CH");

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
		System.err.println("abc");

		model.addAttribute("listServiceDetailHD", listServiceDetail);
		model.addAttribute("listServiceDetailCH", listServiceDetail);
		model.addAttribute("listServiceDetailOT", listServiceDetail);
		model.addAttribute("listAddressOfSalon", listAddressOfSalon);
		return "appointment";
	}

	@RequestMapping(value = "/booking", method = RequestMethod.POST)
	public String bookingPost(ModelMap model, RedirectAttributes redirectAttributes, Authentication authentication,
			Principal principal, @RequestParam(value = "salon") Salon salon,
			@RequestParam(value = "employee", required = false) Employee employee,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "listServices") String listServices,
			@RequestParam(value = "timeBooked") String timeBooked,
			@RequestParam(value = "dateBooked") String dateBooked, @RequestParam Map<String, String> allParams) {
//		ClientOAuth2User oAuth2User = (ClientOAuth2User) authentication.getPrincipal();
		User loginedUser = (User) ((Authentication) principal).getPrincipal();
		System.err.println(loginedUser.getUsername());

		Client client = null;
		String tb = LocalDate.now().atTime(LocalTime.parse(timeBooked))
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Appointment appointment = null;
		int appointmentID = 0;
		try {
			Date tbConvert = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tb);
			Date dbConvert = new SimpleDateFormat("MM/dd/yyyy").parse(dateBooked);
//			if(oAuth2User.getEmail()!="") {
//				client = clientService.findUserClient(oAuth2User.getEmail());
//				appointment = new Appointment(client,employee, salon, tbConvert, false, dbConvert, phone, listServices);
//			}
//			if(authSecurityUser.getUsername()!=null) {
//			}
			appointment = new Appointment(employee, salon, tbConvert, false, dbConvert, phone, listServices);
			appointmentID = insertAppointment(appointment).getAppointmentId();

		} catch (ParseException e) {
			e.printStackTrace();
			message = "SOMETHING WRONG";
			System.err.println(message);
			model.addAttribute("message", message);
			return "errorPage";
		}
		redirectAttributes.addFlashAttribute("appointmentID", appointmentID);
		message = "YOU BOOKED SUCCESS";
		System.err.println(message);
		model.addAttribute("message", message);
		return "redirect:/booking/success";
	}

	@RequestMapping(value = "/booking/success", method = RequestMethod.GET)
	public String bookingSuccess(Model model) {
		SimpleDateFormat formater = null;
		String timeBooked = "";
		String dateBooked = "";
		Integer appointmentID = (Integer) model.asMap().get("appointmentID");

		System.err.println("Appointment ID: " + appointmentID);
		Appointment appointment = null;
		try {
			if (appointmentID == null) {
				return "/";
			} else {
				appointment = appointmentService.findAppointmentByID(appointmentID);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		formater = new SimpleDateFormat("HH:mm");
		timeBooked = formater.format(appointment.getTimeBooked());
		formater = new SimpleDateFormat("dd/MM/yyyy");
		dateBooked = formater.format(appointment.getDateBooked());
		System.err.println(dateBooked);
		model.addAttribute("timeBooked", timeBooked);
		model.addAttribute("dateBooked", dateBooked);
		model.addAttribute("appointment", appointment);
		model.addAttribute("appointmentID", appointmentID);
		return "successBooking";
	}

	@RequestMapping(value = "my-appointment", method = RequestMethod.GET)
	public String myAppointment(Authentication authentication, Principal principal) {
		ClientOAuth2User oAuth2User = (ClientOAuth2User) authentication.getPrincipal();
		System.err.println(oAuth2User.getEmail());
		return "myAppointment";
	}

	public static String getDate(Calendar cal) {
		return "" + cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR);
	}

	public Appointment insertAppointment(final Appointment appointment) {
		KeyHolder holder = new GeneratedKeyHolder();
		SqlParameterSource parameters = new MapSqlParameterSource()
				.addValue("employeeID", appointment.getEmployees().getEmployeeId())
				.addValue("salonID", appointment.getSalons().getSalonId())
				.addValue("timeBooked", appointment.getTimeBooked()).addValue("canceled", appointment.getCanceled())
				.addValue("dateBooked", appointment.getDateBooked()).addValue("phone", appointment.getPhone())
				.addValue("listServices", appointment.getListServices());
		namedParameterJdbcTemplate.update(INSERT_SQL, parameters, holder);
		appointment.setAppointmentId(holder.getKey().intValue());
		return appointment;
	}

}
