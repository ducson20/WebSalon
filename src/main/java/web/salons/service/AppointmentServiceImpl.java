package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.salons.model.Appointment;
import web.salons.repository.AppointmentRepository;

@Service
public class AppointmentServiceImpl implements AppointmentService{

	@Autowired
	private AppointmentRepository appointmentRepository;

	@Override
	public Appointment save(Appointment entity) {
		return appointmentRepository.save(entity);
	}

	@Override
	public List<Appointment> findAppointmentByEmployeeID(int employeeID) {
		return appointmentRepository.findAppointmentByEmployeeID(employeeID);
	}
	
	@Override
	public List<String> findAppointmentTimeBooked(String dateBooked) {
		return appointmentRepository.findAppointmentTimeBooked(dateBooked);
	}

	@Override
	public List<String> findAppointmentTimeBookedByEmployeeID(int employeeID, String dateBooked) {
		return appointmentRepository.findAppointmentTimeBookedByEmployeeID(employeeID, dateBooked);
	}

	
	
	
}
