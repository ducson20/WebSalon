//package web.salons.service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import web.salons.model.Client;
//
//@Service
//public class UserDetailsServiceImpl implements UserDetailsService {
//
//	@Autowired
//	public ClientService clientService;
//
//	@Autowired
//	public UserRoleService userRoleService;
//
//	@Override
//	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
//		Client appUser = this.clientService.findUserClient(userEmail);
//		if (appUser == null) {
//			throw new UsernameNotFoundException("User " + userEmail + " was not found in the database");
//		}
////		List<String> roleNames = this.userRoleService.getRoleName(userEmail);
//
//		List<GrantedAuthority> grantList = new ArrayList<>();
////
////		if (roleNames != null) {
////			for (String role : roleNames) {
////				GrantedAuthority authotiry = new SimpleGrantedAuthority(role);
////				grantList.add(authotiry);
////			}
////		}
//		UserDetails userDetail = (UserDetails) new User(appUser.getUserEmail(), appUser.getPassword(), grantList);
//		return userDetail;
//	}
//
//}
