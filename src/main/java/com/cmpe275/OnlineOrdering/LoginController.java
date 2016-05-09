package com.cmpe275.OnlineOrdering;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getData(HttpServletRequest request, Model model) {
		System.out.println("entered user home");
		HttpSession session = request.getSession(false);
		if (session != null) {
			return "AlreadyLogged";
		}
		return "Login";
	}

	// to check if user is valid
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(HttpServletRequest request, Model model) {
		Password p = new Password();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(isAdmin(email, password)) {
			return "AdminHome";
		}
		UserCredentials uc = loginSvc.getUser(email);

		if (uc == null) {
			model.addAttribute("msg",
					"User is not registered. Register with us now!");
			return "usernotfound";
		} else {
			try {
				if (p.check(password, uc.getPassword())) {
				} else {
					model.addAttribute("msg", "Invalid Password. Try again!");
					return "usernotfound";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("userID", uc.getId());
		session.setAttribute("username", uc.getFullname());
		session.setAttribute("useremail", uc.getEmail());
		model.addAttribute("user", uc.getFullname());
		return "UserHome";

	}

	private boolean isAdmin(String email, String password) {
		// TODO Auto-generated method stub
		if (email.equals("admin") && password.equals("admin"))return true;
		return false;
	}

	// register page shown to user
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(HttpServletRequest request) {
		System.out.println("entered register home");
		return "registration";
	}

	// user logging out
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		System.out.println("entered register home");
		HttpSession session = request.getSession(false);
		if (session != null) {
			String name = (String) session.getAttribute("username");
			model.addAttribute("user", name);
		} else {
			model.addAttribute("user", "you have already logged out!");
		}
		session.invalidate();
		return "logout";
	}

	// verify otp and register
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String registerUser(HttpServletRequest request, Model model)
			throws Exception {
		Password p = new Password();
		System.out.println("entered registration into db");
		String email = request.getParameter("email");
		String codeAssigned = loginSvc.getTuser(email).getCode();
		String code = request.getParameter("verCode");
		if (existingUser(email)) {
			model.addAttribute("msg",
					"This email has already been registered. Please proceed to login!");
			TempUser t = loginSvc.getTuser(email);
			loginSvc.delTuser(t);
		} else {
			if (codeAssigned.equals(code)) {
				model.addAttribute(
						"msg",
						"You have registered successfully.Please proceed to login by clicking the login button!");
				UserCredentials user = new UserCredentials();
				user.setEmail(email);
				user.setAddress(request.getParameter("address"));
				user.setFullname(request.getParameter("fullname"));

				// Storing the hash of the password in the database
				String userPassword = request.getParameter("password");
				String hashPassword = p.getPasswordHash(userPassword);
				user.setPassword(hashPassword);

				user.setPhone(request.getParameter("phone"));
				user.setId(getNextNonExistingNumber());
				loginSvc.adduser(user);
				TempUser t = loginSvc.getTuser(email);
				loginSvc.delTuser(t);

			} else {
				model.addAttribute(
						"msg",
						"the verification code you have entered is wrong! Please click register button to register again.");

			}
		}
		return "AfterRegisterClick";
	}

	private boolean existingUser(String email) {
		// TODO Auto-generated method stub
		UserCredentials uc = loginSvc.getUser(email);
		if (uc == null)
			return false;
		return true;
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
	 * It will generate the Random Id, if the id exists for temp user, it will
	 * generate a new one.
	 * 
	 * @return the unique id
	 */
	private int getNextNonExistingNumberTuser() {
		Random rn = new Random();
		rn.setSeed(System.currentTimeMillis());
		while (true) {
			int rand_id = rn.nextInt(Integer.SIZE - 1) % 10000;
			if (!loginSvc.existsByIdTuser(rand_id)) {
				return rand_id;
			}
		}
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

	// send sms to mobile
	private void sendSms(String code, String smsEmail) {

		StringBuffer message = new StringBuffer("Your verification code: ");
		message.append(code);
		SimpleMailMessage verifyMail = new SimpleMailMessage();
		verifyMail.setFrom("group5.275@gmail.com");
		verifyMail.setTo(smsEmail);

		verifyMail.setText(message.toString());
		mailOtp.send(verifyMail);
		System.out.println("sms sent!");

	}

	// send generate code, mail the user, and store the temperory code in DB.
	@RequestMapping(value = "/verifyMail", method = RequestMethod.POST)
	public void verifyMail(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("entered otp! " + request.getParameter("phone"));
		String code = generateCode();
		String email = request.getParameter("email");

		String carrierMail = getEmail(request.getParameter("carrier"));

		sendCode(code, email);
		if (!carrierMail.isEmpty()) {

			sendSms(code, request.getParameter("phone") + carrierMail);
		}
		TempUser t = loginSvc.getTuser(email);

		if (t == null) {
			t = new TempUser();
			t.setCode(code);
			t.setEmail(email);
			t.setId(getNextNonExistingNumberTuser());
			loginSvc.addTuser(t);
		} else {
			t.setCode(code);
			loginSvc.updateTuser(t);
		}

	}

	private String getEmail(String carrier) {
		// TODO Auto-generated method stub
		String email = "";
		if (carrier.equals("ve")) {
			email = "@vtext.com";
		} else if (carrier.equals("at")) {
			email = "@txt.att.net";
		} else if (carrier.equals("tm")) {
			email = "@tmomail.net";
		}
		return email;
	}
}
