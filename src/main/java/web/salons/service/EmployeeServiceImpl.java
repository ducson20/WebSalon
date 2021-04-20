package web.salons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import web.salons.model.Employee;
import web.salons.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public Employee findEmployeeByEmpID(int salonID) {
		return employeeRepository.findEmployeeByEmpID(salonID);
	}

	@Override
	public Page<Employee> listAll(int pageNumber, String keyword) {
		Pageable pageable = PageRequest.of(pageNumber - 1, 5);
		if (keyword != null) {
			return employeeRepository.findAll(keyword, pageable);
		}
		return employeeRepository.findAll(pageable);
	}

	@Override
	public void deleteById(Integer id) {
		employeeRepository.deleteById(id);
	}

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
