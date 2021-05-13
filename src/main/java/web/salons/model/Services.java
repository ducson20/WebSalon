package web.salons.model;
// Generated Feb 22, 2021 12:43:00 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Services generated by hbm2java
 */
@Entity
@Table(name = "services")
public class Services implements java.io.Serializable {
	
	@Id
	@Column(name = "serviceID", unique = true, nullable = false, length = 50)
	private String serviceId;
	
	@Column(name = "serviceName", nullable = false, length = 100)
	private String serviceName;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "services")
	private Set<ServiceDetail> servicesDetailses = new HashSet<ServiceDetail>(0);
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "services")
	private Set<Appointment> appointmentses = new HashSet<Appointment>(0);

	
	public Services() {
	}

	public Services(String serviceId, String serviceName) {
		this.serviceId = serviceId;
		this.serviceName = serviceName;
	}

	public String getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getServiceName() {
		return this.serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public Set<ServiceDetail> getServicesDetailses() {
		return this.servicesDetailses;
	}

	public void setServicesDetailses(Set<ServiceDetail> servicesDetailses) {
		this.servicesDetailses = servicesDetailses;
	}
	
	public Set<Appointment> getAppointmentses() {
		return this.appointmentses;
	}

	public void setAppointmentses(Set<Appointment> appointmentses) {
		this.appointmentses = appointmentses;
	}

}
