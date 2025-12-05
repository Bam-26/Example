package Utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {


    
    public static boolean sendResetEmail(String toEmail, String resetLink) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", EmailSetting.SMTP_HOST);
        props.put("mail.smtp.port", EmailSetting.SMTP_PORT);
        props.put("mail.smtp.ssl.trust", EmailSetting.SMTP_HOST);
        
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailSetting.EMAIL_FROM, EmailSetting.EMAIL_PASSWORD);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EmailSetting.EMAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Password Reset Request");
            
            String htmlContent = "<!DOCTYPE html>"
                    + "<html><body style='font-family: Arial, sans-serif;'>"
                    + "<div style='max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px;'>"
                    + "<h2 style='color: #333; text-align: center;'>Password Reset Request</h2>"
                    + "<p style='font-size: 16px;'>Hello,</p>"
                    + "<p style='font-size: 16px;'>You requested to reset your password. Click the button below to proceed:</p>"
                    + "<div style='text-align: center; margin: 30px 0;'>"
                    + "<a href='" + resetLink + "' style='display: inline-block; padding: 12px 30px; "
                    + "background-color: #007bff; color: white; text-decoration: none; "
                    + "border-radius: 5px; font-size: 16px; font-weight: bold;'>Reset Password</a>"
                    + "</div>"
                    + "<p style='font-size: 14px; color: #666;'>⚠️ This link will expire in 1 hour.</p>"
                    + "<p style='font-size: 14px; color: #666;'>If you didn't request this, please ignore this email.</p>"
                    + "<hr style='margin: 20px 0; border: none; border-top: 1px solid #eee;'>"
                    + "<p style='font-size: 12px; color: #999; text-align: center;'>© 2024 Your App. All rights reserved.</p>"
                    + "</div></body></html>";
            
            message.setContent(htmlContent, "text/html; charset=utf-8");
            
            Transport.send(message);
            System.out.println("Email sent successfully to: " + toEmail);
            return true;
            
        } catch (MessagingException e) {
            System.err.println("Failed to send email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}