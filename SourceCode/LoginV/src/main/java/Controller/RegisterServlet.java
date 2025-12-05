package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;
import Service.UserRegisterService;
import Utils.InputCleaner;



@WebServlet(name = "RegisterServlet", urlPatterns = { "/Register", "/register" })
public class RegisterServlet extends HttpServlet {

    private UserRegisterService registerService;

    @Override
    public void init() {
        registerService = new UserRegisterService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("registerError", "Passwords do not match.");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(InputCleaner.clean(email));
        
        newUser.setFullName(InputCleaner.clean(fullName));

        boolean success = registerService.register(newUser, InputCleaner.clean(password));

        if (!success) {
            request.setAttribute("registerError", "Username or email already exists.");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        request.getSession().setAttribute("registerSuccess", "Account created successfully!");
        response.sendRedirect(request.getContextPath() + "/Welcom.jsp");
    }
}
