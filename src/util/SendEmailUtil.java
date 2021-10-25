package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.Email;

public class SendEmailUtil {
	
	public static void sendEmail(Email email) {
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session mailSession = Session.getDefaultInstance(properties, null);
			
		
		try {
			Message message = new MimeMessage(mailSession);
		
			message.setFrom(new InternetAddress(email.getFrom()));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getTo()));
			message.setSubject(email.getSubject());
			message.setContent(email.getContent(), "text/html; charset=utf-8");
			
			Transport transport = mailSession.getTransport("smtp");
			transport.connect("smtp.gmail.com", email.getFrom(), email.getFromPassword());
			
			transport.sendMessage(message,  message.getAllRecipients());
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("SendEmailClass :" + e.getMessage());
		}
	}
}
