package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.salons.model.Employee;
import web.salons.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public Employee save(Employee entity) {
		return employeeRepository.save(entity);
	}

	@Override
	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}

	@Override
	public String findByTimeOfEmpID(int ID) {		
		return employeeRepository.findByTimeOfEmpID(ID);
	}

	@Override
	public List<String> findTimeOfEmpBySalonID(int salonId) {
		return employeeRepository.findTimeOfEmpBySalonID(salonId);
	}

	@Override
	public List<Employee> findfullNameEmpBySalonID(int salonID) {
		return employeeRepository.findfullNameEmpBySalonID(salonID);
	}

	

	
	
	
	
	
}
