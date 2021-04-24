package web.salons.service;

import java.util.List;

import web.salons.model.Appointment;

public interface AppointmentService {

	Appointment findAppointmentByID(int appointmentID);
	
	Appointment save(Appointment entity);
	
	List<Appointment> findAppointmentByEmployeeID(int employeeID);
	
	List<String> findAppointmentTimeBooked(String dateBooked);

	List<String> findAppointmentTimeBookedByEmployeeID(int employeeID, String dateBooked);
}
