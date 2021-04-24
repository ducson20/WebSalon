package web.salons.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import net.bytebuddy.utility.RandomString;
import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;
import web.salons.model.Role;
import web.salons.repository.RoleRepository;
import web.salons.repository.UserRepository;
import web.salons.securiry.EncrytedPasswordUtils;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public Client save(Client entity) {
		return userRepository.save(entity);
	}

	@Override
	public List<Client> findAll() {
		return userRepository.findAll();
	}
	
	@Override
	public Client findUserByID(int userID) {
		return userRepository.findUserByID(userID);
	}

	@Override
	public Client findUserClient(String userEmail) {
		return userRepository.findUserByEmail(userEmail);
	}

	@Override
	public Boolean existsByUserEmail(String email) {
		return userRepository.existsByUserEmail(email);
	}
	
	@Override
	public Client registerUser(Client user) {
		Role roleUser = roleRepository.findRoleByID(1);
//		String randomNumber = UUID.randomUUID().toString();
//		user.setHashSendMail(EncrytedPasswordUtils.encrytePassword(randomNumber));
		String randomNumber = RandomString.make(64);
		user.setHashSendMail(randomNumber);
		user.setPassword(EncrytedPasswordUtils.encrytePassword(user.getPassword()));
		user.setAuth_provider(AuthenticationProvider.local);
		user.setCreatedAt(new Date());
		user.setEnabled(false);
		user.setAccountNonLocked(true);
		user.addRole(roleUser);
		userRepository.save(user);
		return user;
	}

	@Override
	public boolean verify(String verificationCode, String userEmail) {
		Client user = userRepository.findByVerificationCode(verificationCode, userEmail);
		if (user == null || user.isEnabled()) {
			return false;
		} else {
			user.setHashSendMail(null);
			user.setEnabled(true);
			userRepository.save(user);

			return true;
		}
	}

	@Override
	public void updateEnabledStatus(boolean enable, Integer userID) {

	}

	@Override
	public void registerNewClientAfterOAuthLoginSuccess(String email, String name) {
		Client client = new Client();
		String randomNumber = RandomString.make(64);
		client.setUserEmail(email);
		client.setFirstName(name);
		client.setEnabled(true);
		client.setHashSendMail(randomNumber);
		client.setCreatedAt(new Date());
		userRepository.save(client);
	}

	@Override
	public void updateExitClientAfterOAuthLoginSuccess(Client client, String name,
			AuthenticationProvider authProvider) {
		client.setLastName(name);
		client.setAuth_provider(authProvider);
		userRepository.save(client);
	}

	@Override
	public void updateExitClientAfterOAuthLoginSuccessHasRole(Client client, AuthenticationProvider uthProvider) {
		client.setAuth_provider(uthProvider);
		userRepository.save(client);
	}

	@Override
	public void updateFailedAttempt(int failedAttenpt, String userEmail) {
		userRepository.updateFailedAttempt(failedAttenpt, userEmail);
	}

	@Override
	public void increaseFailedAttempt(Client user) {
		int newFailedAttempt = user.getFailedAttempt() + 1;
		userRepository.updateFailedAttempt(newFailedAttempt, user.getUserEmail());
	}

	@Override
	public void lock(Client user) {
		user.setAccountNonLocked(false);
		user.setLockTime(new Date());
		userRepository.save(user);
	}

	@Override
	public boolean unLock(Client user) {
		long lockTimeInMillis = user.getLockTime().getTime();
		long currentTimeInMillis = System.currentTimeMillis();
		long timeUnLock = lockTimeInMillis + LOCK_TIME_DURATION;
		if (timeUnLock < currentTimeInMillis) {
			user.setAccountNonLocked(true);
			user.setLockTime(null);
			user.setFailedAttempt(0);

			userRepository.save(user);
			return true;
		}
		return false;
	}

	@Override
	public void resetFailedAttempts(String userEmail) {
		userRepository.updateFailedAttempt(0, userEmail);

	}

	@Override
	public void generateOneTimePassword(Client user) throws UnsupportedEncodingException, MessagingException {
		String OTP = RandomString.make(8);
		System.out.println("OTP: " + OTP);

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedOTP = passwordEncoder.encode(OTP);

		user.setOneTimePassword(encodedOTP);
		user.setOtpRequestedTime(new Date());

		userRepository.save(user);

		sendOTPEmail(user, OTP);
	}

	@Override
	public void sendOTPEmail(Client user, String OTP) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("contact@shopme.com", "Shopme Support");
		helper.setTo(user.getUserEmail());

		String subject = "Here's your One Time Password (OTP) - Expire in 5 minutes!";

		String content = "<p>Hello " + user.getFirstName() + " " + user.getLastName() + "</p>"
				+ "<p>For security reason, you're required to use the following " + "One Time Password to login:</p>"
				+ "<p><b>" + OTP + "</b></p>" + "<br>" + "<p>Note: this OTP is set to expire in 5 minutes.</p>";

		helper.setSubject(subject);

		helper.setText(content, true);

		mailSender.send(message);

		System.err.println("Email was sent");

	}

	@Override
	public void clearOTP(Client user) {
		user.setOneTimePassword(null);
		user.setOtpRequestedTime(null);

		userRepository.save(user);
		System.err.println("Cleared OTP");

	}
	
	@Override
	public Page<Client> findUserPaging(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return userRepository.findAll(pageable);
	}

}
