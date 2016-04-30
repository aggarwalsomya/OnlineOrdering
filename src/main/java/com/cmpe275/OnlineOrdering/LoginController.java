package com.cmpe275.OnlineOrdering;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private MailSender mailOtp;

	@Autowired
	private LoginService loginSvc;

	// first home login page which user sees
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getData(HttpServletRequest request, Model model) {
		System.out.println("entered user home");
		
		

		return "Login";
	}
	
	//to check if user is valid
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(HttpServletRequest request) {
		
		return "redirect:/" ;
	}
	
	//register page shown to user
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(HttpServletRequest request) {
		System.out.println("entered register home");
		return "registration";
	}
	
	//verify otp and register
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String registerUser(HttpServletRequest request) {
		System.out.println("entered registration into db");
		return "Redirect:/" ;
	}

	// generate verification code
	public String generateCode() {

		StringBuffer code = new StringBuffer("");
		Random randomGenerator = new Random();
		for (int i = 0; i <= 3; ++i) {
			int randomInt = randomGenerator.nextInt(10);
			code.append(Integer.toString(randomInt));
		}
		return code.toString();
	}

	// send code to the user email using SMTP.
	private void sendCode(String code, String email) {

		StringBuffer message = new StringBuffer("Your verification code: ");
		message.append(code);
		SimpleMailMessage verifyMail = new SimpleMailMessage();
		verifyMail.setFrom("group5.275@gmail.com");
		verifyMail.setTo(email);
		verifyMail
				.setSubject("Online Ordering Registration - Verification Code");
		verifyMail.setText(message.toString());
		mailOtp.send(verifyMail);
		System.out.println("mail sent!");
		
	}

	/**
	 * It will generate the Random Id, if the id exists, it will generate a new
	 * one.
	 * 
	 * @return the unique id
	 */
	private int getNextNonExistingNumber() {
		Random rn = new Random();
		rn.setSeed(System.currentTimeMillis());
		while (true) {
			int rand_id = rn.nextInt(Integer.SIZE - 1) % 10000;
			if (!loginSvc.existsById(rand_id)) {
				return rand_id;
			}
		}
	}

	// send generate code, mail the user, and store the temperory code in DB.
	@RequestMapping(value = "/verifyMail", method = RequestMethod.POST)
	public void verifyMail(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("entered otp! " + request.getParameter("email"));
		String code = generateCode();
		String email = request.getParameter("email");
		sendCode(code, email);
		TempUser t = new TempUser();

		t.setEmail(email);
		t.setCode(code);
		if (loginSvc.tuserExists(email)) {
			loginSvc.updateTuser(t);
		} else {
			t.setId(getNextNonExistingNumber());
			loginSvc.addTuser(t);
		}
	}
}
