package web.salons;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;


@SpringBootApplication
@EnableAsync
public class SalonsWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SalonsWebApplication.class, args);
	}

}
