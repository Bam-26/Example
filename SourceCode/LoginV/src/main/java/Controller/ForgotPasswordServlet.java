package Controller;


import DAO.UserDAO; 
import Service.PasswordResetService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ForgetPassword")
public class ForgotPasswordServlet extends HttpServlet {
    
    private PasswordResetService resetService = new PasswordResetService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter your email address");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            return;
        }
        
       
        String baseUrl = request.getScheme() + "://" + 
                        request.getServerName() + ":" + 
                        request.getServerPort() + 
                        request.getContextPath();
        
        
        boolean sent = resetService.requestPasswordReset(email, baseUrl);
        
        if (sent) {
            request.setAttribute("successMessage", 
                "PIN reset link has been sent to your email. Please check your inbox.");
        } else {
            request.setAttribute("errorMessage", 
                "Failed to send Email. Please make sure the email is correct.");
        }
        
        request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
    }
}