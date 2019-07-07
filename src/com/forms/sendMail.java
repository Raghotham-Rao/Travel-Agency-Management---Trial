package com.forms;
import java.util.*; 
import javax.mail.*; 
import javax.mail.internet.*; 
import javax.activation.*; 
import javax.mail.Session; 
import javax.mail.Transport;

public class sendMail {

		public static void send(String emailid) 
		{	 
			// email ID of Recipient. 
			String recipient = emailid; 

			// email ID of Sender. 
			String sender = "mayberaghotham@gmail.com"; 

			// using host as localhost 
			String host = "127.0.0.1"; 

			// Getting system properties 
			Properties properties = System.getProperties(); 

			// Setting up mail server 
			properties.setProperty("mail.smtp.host", host); 
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", 587);

			// creating session object to get properties 
			Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("mayberaghotham37@gmail.com","jersey#37");
				}
			}); 

			try
			{ 
				// MimeMessage object. 
				MimeMessage message = new MimeMessage(session); 

				// Set From Field: adding senders email to from field. 
				message.setFrom(new InternetAddress(sender)); 

				// Set To Field: adding recipient's email to from field. 
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 

				// Set Subject: subject of the email 
				message.setSubject("Succesfully Signed up to itsnametoursandtravels"); 

				// set body of the email. 
				message.setText("Welcome!!!\n"
						+ "Happy to be at your service\n"
						+ "check out all the destinations we have to offer to you!!!"
						+ "\n\n\n\n\n\n Thank you!!!"); 

				// Send email. 
				Transport.send(message); 
				System.out.println("Mail successfully sent"); 
			} 
			catch (MessagingException mex) 
			{ 
				mex.printStackTrace(); 
			} 
		} 
		
		public static void sendreceipt(String emailid) 
		{	 
			// email ID of Recipient. 
			String recipient = emailid; 

			// email ID of Sender. 
			String sender = "mayberaghotham@gmail.com"; 

			// using host as localhost 
			String host = "127.0.0.1"; 

			// Getting system properties 
			Properties properties = System.getProperties(); 

			// Setting up mail server 
			properties.setProperty("mail.smtp.host", host); 
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", 587);

			// creating session object to get properties 
			Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("mayberaghotham37@gmail.com","jersey#37");
				}
			}); 

			try
			{ 
				// MimeMessage object. 
				MimeMessage message = new MimeMessage(session); 

				// Set From Field: adding senders email to from field. 
				message.setFrom(new InternetAddress(sender)); 

				// Set To Field: adding recipient's email to from field. 
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 

				// Set Subject: subject of the email 
				message.setSubject("Trip Registered"); 

				// set body of the email. 
				message.setText("Successfully registered"); 

				// Send email. 
				Transport.send(message); 
				System.out.println("Mail successfully sent"); 
			} 
			catch (MessagingException mex) 
			{ 
				mex.printStackTrace(); 
			} 
		} 

	}
