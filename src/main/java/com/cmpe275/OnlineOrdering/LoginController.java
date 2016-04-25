package com.cmpe275.OnlineOrdering;

import javax.servlet.http.HttpServletRequest;

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
	
	//send email to the new user.
	@RequestMapping(value = "/{someID}", method = RequestMethod.GET)
	public String verifyMail(@PathVariable(value = "someID") String email, Model model) {
		System.out.println("entered otp! " + email );
		SimpleMailMessage verifyMail = new SimpleMailMessage();
		verifyMail.setFrom("group5.275@gmail.com");
		verifyMail.setTo(email+".com");
		verifyMail.setSubject("test");
		verifyMail.setText("test");
		mailOtp.send(verifyMail);
		System.out.println("mail sent!");
		return "";
	}
}
