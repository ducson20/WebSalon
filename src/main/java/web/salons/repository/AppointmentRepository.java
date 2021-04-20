package web.salons.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Appointment;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Integer> {

	@Query("SELECT a FROM Appointment a WHERE a.appointmentId = ?1")
	Appointment findAppointmentByID(int appointmentID);

	@Query("SELECT a FROM Appointment a WHERE employeeId = ?1")
	List<Appointment> findAppointmentByEmployeeID(int employeeID);

	@Query(value = "SELECT a.timeBooked FROM appointments a WHERE a.dateBooked = ?1", nativeQuery = true)
	List<String> findAppointmentTimeBooked(String dateBooked);

	@Query(value = "SELECT a.timeBooked FROM appointments a WHERE employeeID = ?1 AND dateBooked =?2", nativeQuery = true)
	List<String> findAppointmentTimeBookedByEmployeeID(int employeeID, String dateBooked);

}
