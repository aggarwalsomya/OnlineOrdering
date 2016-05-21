package com.cmpe275.OnlineOrdering;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Notify implements Runnable {

	private String email, body;

	@Autowired
	private MailSender mailOtp;

	public Notify(String email, String body) {
		this.email = email;
		this.body = body;
	}

	@Override
	public void run() {

		SimpleMailMessage verifyMail = new SimpleMailMessage();
		verifyMail.setFrom("group5.275@gmail.com");
		verifyMail.setTo(email);
		verifyMail.setSubject("Online Ordering Notification");
		verifyMail.setText(body);
		mailOtp.send(verifyMail);
		System.out.println("mail sent!");

	}

}
