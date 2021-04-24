package web.salons.securiry;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import web.salons.model.Client;
import web.salons.model.Role;

public class SalonUserDetials implements UserDetails {
	
	private Client user;
	
	public SalonUserDetials(Client user) {
		super();
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<Role> roles = user.getRoles();
		List<SimpleGrantedAuthority> authories = new ArrayList<>();
		for(Role role : roles) {
			authories.add(new SimpleGrantedAuthority(role.getRoleName()));
		}
		return authories;
	}

	@Override
	public String getPassword() {
		if (user.isOTPRequired()) {
			System.err.println("Password OTP");
			return user.getOneTimePassword();
		}
		System.err.println("Password default");
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return this.user.getFirstName() + " " + this.user.getLastName();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return user.isAccountNonLocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return user.isEnabled();
	}
	
	public String getUserEmail() {
		return this.user.getUserEmail();
	}
	
	public Client getUser() {
		return this.user;
	}
	
	public Integer getUserId() {
		return this.user.getUserId();
	}
	
	

}
