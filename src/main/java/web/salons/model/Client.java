package web.salons.model;
// Generated Feb 22, 2021 12:43:00 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Clients generated by hbm2java
 */
@Entity
@Table(name = "clients", schema = "dbo", catalog = "SalonNails")
public class Client implements java.io.Serializable {

	private String userEmail;
	private String firstName;
	private String lastName;
	private String gender;
	private String password;
	private String hashSendMail;
	private String phone;
	private String imageUrl;
	private Set<Appointment> appointmentses = new HashSet<Appointment>(0);
	private Set<UserRole> usersRoleses = new HashSet<UserRole>(0);
	@Enumerated(EnumType.STRING)
	@Column(name="auth_provider")
	private AuthenticationProvider authProvider;

	public Client() {

	}

	public Client(String userEmail, String firstName, String lastName, String password, String phone) {
		super();
		this.userEmail = userEmail;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.phone = phone;
	}

	@Id
	@Column(name = "userEmail", unique = true, nullable = false, length = 50)
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "firstName", nullable = true, length = 50)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "lastName", nullable = true, length = 50)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "gender", nullable = true, length = 20)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "password", nullable = true)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "hashSendMail", length = 128)
	public String getHashSendMail() {
		return hashSendMail;
	}

	public void setHashSendMail(String hashSendMail) {
		this.hashSendMail = hashSendMail;
	}

	@Column(name = "phone", nullable = true, length = 50)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "clients")
	public Set<Appointment> getAppointmentses() {
		return this.appointmentses;
	}

	public void setAppointmentses(Set<Appointment> appointmentses) {
		this.appointmentses = appointmentses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "clients")
	public Set<UserRole> getUsersRoleses() {
		return this.usersRoleses;
	}

	public void setUsersRoleses(Set<UserRole> usersRoleses) {
		this.usersRoleses = usersRoleses;
	}

	public AuthenticationProvider getAuthProvider() {
		return authProvider;
	}

	public void setAuthProvider(AuthenticationProvider authProvider) {
		this.authProvider = authProvider;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
	
	

}
