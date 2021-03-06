package web.salons.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import web.salons.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	@Query("SELECT e FROM Employee e WHERE e.employeeId = ?1")
	Employee findEmployeeByEmpID(int salonID);
	
	@Query("SELECT e FROM Employee e WHERE e.fullName LIKE %?1")
	Page<Employee> findAll(String keyword, Pageable pageable);
	
	@Query("SELECT e.timeOfEmp FROM Employee e WHERE e.employeeId = ?1")
	String findByTimeOfEmpID(int ID);

	@Query(value = "SELECT e.timeOfEmp FROM salons_employees se " + "JOIN employees e ON e.employeeID = se.employeeID "
			+ "JOIN salons s ON s.salonID = se.salonID WHERE se.salonID = ?1", nativeQuery = true)
	List<String> findTimeOfEmpBySalonID(int salonID);

	@Query(value = "SELECT * FROM salons_employees se " + "JOIN employees e ON e.employeeID = se.employeeID "
			+ "JOIN salons s ON s.salonID = se.salonID WHERE se.salonID = ?1", nativeQuery = true)
	List<Employee> findfullNameEmpBySalonID(int salonID);
}
