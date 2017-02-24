package szu.hong.web.util;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import szu.hong.web.factory.EmailAccount;

import java.util.Date;
import java.util.Properties;

/*
 * 提供发送邮件方法的类
 * */
public class SendEmail {
	public static void sendMessage(String to,String subject,String content){
		String from=EmailAccount.getName();
		String password=EmailAccount.getPassword();
		Properties props=new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.auth", "true");
		String host=null;
		if(from.contains("@qq.com")){
			host="smtp.qq.com";
		}else if(from.contains("@163.com")){
			host="smtp.163.com";
		}
		props.setProperty("mail.host",host);
		Session session=Session.getDefaultInstance(props);
		MimeMessage message=createMimeMessage(session, from, to, subject, content);
		try {
			Transport transport=session.getTransport();
			transport.connect(from,password);
			transport.sendMessage(message,message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static MimeMessage createMimeMessage(Session session,String from,String to,String subject,String content){
		MimeMessage message=new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(from));
			message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject,"utf-8");
			message.setContent(content,"text/html;charset=UTF-8;");
			message.setSentDate(new Date());
			message.saveChanges();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	} 
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}

}
