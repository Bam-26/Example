package Controller;

import Service.PasswordResetService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ResetPassword")
public class ResetPasswordServlet extends HttpServlet {
    
    private PasswordResetService resetService = new PasswordResetService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String token = request.getParameter("token");
        
        if (token == null || token.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Invalid reset link");
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);

            return;
        }
        
        request.setAttribute("token", token);
        request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        

        if (token == null || newPassword == null || confirmPassword == null) {
            request.setAttribute("errorMessage", "All fields are required");
            request.setAttribute("token", token);
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match");
            request.setAttribute("token", token);
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
            return;
        }
        

        boolean success = resetService.resetPassword(token, newPassword);
        
        if (success) {
            request.setAttribute("successMessage", 
                "Password reset successful! You can now login with your new password.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", 
                "Failed to reset password. The link may have expired or already been used.");
            request.setAttribute("token", token);
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }
}