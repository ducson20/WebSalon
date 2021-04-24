package web.salons.securiry;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class ReCaptchaV3Handler {
	private String recaptchaSecret = "6LfoTbMaAAAAALvAFLAJ_p5dEo1IQ7qDJpM3icxm";
	private String recaptchaServerURL = "https://www.google.com/recaptcha/api/siteverify";

	public float verify(String recaptchaFormResponse) throws InvalidReCaptchaTokenException {
		System.out.println("ReCaptchaV3 Handler called.");
		System.out.println("g-recaptcha-response: " + recaptchaFormResponse);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
		map.add("secret", recaptchaSecret);
		map.add("response", recaptchaFormResponse);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);

		RestTemplate restTemplate = new RestTemplate();
//        ResponseEntity<String> response = restTemplate.exchange(recaptchaServerURL, HttpMethod.POST, request, String.class);
		ReCaptchatResponse response = restTemplate.postForObject("https://www.google.com/recaptcha/api/siteverify", request, ReCaptchatResponse.class);
//		System.err.println("ReCaptcha response: \n");
		
//		System.err.println("Success: " + response.isSuccess());
//		System.err.println("Action: " + response.getAction());
//		System.err.println("Hostname: " + response.getHostname());
//		System.err.println("Score: " + response.getScore());
//		System.err.println("Challenge Timestamp: " + response.getChallenge_ts());
		if(response.getErrorCodes() != null) {
			System.err.println("Error code: ");
			for(String errorCode: response.getErrorCodes()) {
				System.err.println("\t" + errorCode);
			}
		}
		
		if(!response.isSuccess()) {
			throw new InvalidReCaptchaTokenException("Invalid ReCaptcha Token. Please check site key");
		}
		return response.getScore();
	}
}
