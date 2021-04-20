package web.salons.securiry1;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import web.salons.model.Client;
import web.salons.model.Role;
import web.salons.model.UserRole;

public class SalonUserDetails implements UserDetails {
	
	private static final long serialVersionUID = 1L;
	private Client user;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<UserRole> roles = user.getUsersRoleses();
		List<SimpleGrantedAuthority> authories = new ArrayList<>();
		for(UserRole role : roles) {
			
		}
		return null;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
