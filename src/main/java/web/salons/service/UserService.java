package web.salons.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.data.domain.Page;

import web.salons.model.AuthenticationProvider;
import web.salons.model.Client;

public interface UserService {
	
	public static final int MAX_FAILED_ATTEMPT = 3;
	public static final long LOCK_TIME_DURATION = 5  * 60 * 1000; //  10 minitu

	Client findUserClient(String userEmail);
	
	Client findUserByID(int userID);
	
	Boolean existsByUserEmail(String email);

	List<Client> findAll();

	Client registerUser(Client user);
	
	boolean isCheckUnique(String email);
	
	boolean verify(String verificationCode, String userEmail);
	
	void updateEnabledStatus(boolean enable, Integer userID);
		
	Client save(Client entity);

	void registerNewClientAfterOAuthLoginSuccess(String email, String name);

	void updateExitClientAfterOAuthLoginSuccess(Client client, String name, AuthenticationProvider uthProvider);

	void updateExitClientAfterOAuthLoginSuccessHasRole(Client client, AuthenticationProvider uthProvider);
	
	void updateFailedAttempt(int failedAttenpt, String userEmail);

	void increaseFailedAttempt(Client user);

	void lock(Client user);
	
	boolean unLock(Client user);
	
	void resetFailedAttempts(String userEmail);

	void generateOneTimePassword(Client user) throws UnsupportedEncodingException, MessagingException;
	
	void sendOTPEmail(Client user, String OTP) throws MessagingException, UnsupportedEncodingException;
	
	void clearOTP(Client user);
	
	Page<Client> findUserPaging(int pageNo, int pageSize);

}
