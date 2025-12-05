package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import Service.UserLoginService;





@WebServlet(name = "LoginServlet", urlPatterns = { "/Login", "/login" })
public class LoginServlet extends HttpServlet {

    private UserLoginService loginService;

    @Override
    public void init() throws ServletException {
        loginService = new UserLoginService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = loginService.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect(request.getContextPath() + "/Welcom.jsp");

        } else {
            request.setAttribute("loginError", "Invalid username or password.");
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }
}
