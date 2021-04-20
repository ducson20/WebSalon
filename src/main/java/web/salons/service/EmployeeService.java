package web.salons.service;

import java.util.List;

import org.springframework.data.domain.Page;

import web.salons.model.Employee;

public interface EmployeeService {

	Employee findEmployeeByEmpID(int salonID);

	Page<Employee> listAll(int pageNumber, String keyword);
	
	List<Employee> findAll();
	
	Employee save(Employee entity);
	
	void deleteById(Integer id);

	String findByTimeOfEmpID(int ID);

	List<String> findTimeOfEmpBySalonID(int salonID);

	List<Employee> findfullNameEmpBySalonID(int salonID);

}
