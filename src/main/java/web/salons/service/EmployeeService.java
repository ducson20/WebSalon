package web.salons.service;

import java.util.List;


import web.salons.model.Employee;

public interface EmployeeService {

	List<Employee> findAll();

	Employee save(Employee entity);

	String findByTimeOfEmpID(int ID);
	
	List<String> findTimeOfEmpBySalonID(int salonID);
	
	List<Employee> findfullNameEmpBySalonID(int salonID);
}
