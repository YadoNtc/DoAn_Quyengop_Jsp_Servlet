package util;

import java.util.Properties;

import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Stateless
public class SendingEmailUtil {
	private String userEmail;
	private String myHash;
	
	public SendingEmailUtil(String userEmail, String myHash) {
		this.userEmail = userEmail;
		this.myHash = myHash;
	}
	
	
	public void sendMail() {
		//System.out.println("Gửi mail đến: " + event.getTo());
		String email = "testvia0205@gmail.com";
		String pass = "checkedVia05022011#";
		
		//Properties properties = new Properties();
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		//properties.put("mail.smtp.starttls.enable", "true");
		
		/*Session mailSession = Session.getDefaultInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, pass);
			}
		});
		*/
		Session mailSession = Session.getDefaultInstance(properties, null);
		mailSession.setDebug(true);
			
	
		try {
			Message message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress(email));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			message.setSubject("Link kích hoạt tài khoản");			
			message.setText("Để kích hoạt tài khoản của bạn. Vui lòng click vào đường dẫn sau:: " + "http://localhost:8081/com.doan.quyengop/ActiveAccount?"
					+ "email=" + userEmail + "&key=" + myHash);
			Transport transport = mailSession.getTransport("smtp");
			transport.connect("smtp.gmail.com", email, pass);
			transport.sendMessage(message, message.getAllRecipients());
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("SendingEmail :" + e.getMessage());
		}
		
	}
	
}
