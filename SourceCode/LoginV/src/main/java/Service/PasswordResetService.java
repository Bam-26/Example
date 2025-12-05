package Service;

import DAO.UserDAO;
import DAO.PasswordResetTokenDAO;
import Model.User;
import Utils.EmailUtil;
import Utils.PasswordHasher;

import java.util.UUID;

public class PasswordResetService {
    
    private UserDAO userDAO = new UserDAO();
    private PasswordResetTokenDAO tokenDAO = new PasswordResetTokenDAO();
    

    
    public boolean requestPasswordReset(String email, String baseUrl) {

        User user = userDAO.getUserByEmail(email);
        if (user == null) {
            System.out.println("User not found with email: " + email);
            return false;
        }
        

        String token = UUID.randomUUID().toString();
        


        boolean saved = tokenDAO.saveToken(user.getUserId(), token);
        if (!saved) {
            System.out.println("Failed to save token");
            return false;
        }
        

        String resetLink = baseUrl + "/ResetPassword?token=" + token;
        
        boolean sent = EmailUtil.sendResetEmail(email, resetLink);
        
        if (sent) {
            System.out.println("Reset email sent to: " + email);
        } else {
            System.out.println("Failed to send email to: " + email);
        }
        
        return sent;
    }
    

    public boolean resetPassword(String token, String newPassword) {

        Integer userId = tokenDAO.validateToken(token);
        if (userId == null) {
            System.out.println("Invalid or expired token");
            return false;
        }
        

        String hashedPassword = PasswordHasher.hash(newPassword);
        

        boolean updated = userDAO.updatePassword(userId, hashedPassword);
        
        if (updated) {

            tokenDAO.markTokenAsUsed(token);
            System.out.println("Password reset successful for user ID: " + userId);
        } else {
            System.out.println("Failed to update password");
        }
        
        return updated;
    }
}