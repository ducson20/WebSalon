package web.salons.model;
// Generated Feb 22, 2021 12:43:00 AM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * UsersRoles generated by hbm2java
 */
@Entity
@Table(name = "users_roles", schema = "dbo", catalog = "SalonNails")
public class UserRole implements java.io.Serializable {

	private int userRoleId;
	private Client clients;
	private Role roles;

	public UserRole() {
	}

	public UserRole(int userRoleId) {
		this.userRoleId = userRoleId;
	}

	public UserRole(int userRoleId, Client clients, Role roles) {
		this.userRoleId = userRoleId;
		this.clients = clients;
		this.roles = roles;
	}

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userRoleID", unique = true, nullable = false)
	public int getUserRoleId() {
		return this.userRoleId;
	}

	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userEmail")
	public Client getClients() {
		return this.clients;
	}

	public void setClients(Client clients) {
		this.clients = clients;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roleID")
	public Role getRoles() {
		return this.roles;
	}

	public void setRoles(Role roles) {
		this.roles = roles;
	}

}
