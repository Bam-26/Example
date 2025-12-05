package Service;

import DAO.UserDAO;
import Model.User;
import Utils.PasswordHasher;

public class UserLoginService {

    private UserDAO userDAO;

    public UserLoginService() {
        this.userDAO = new UserDAO();
    }

    public User login(String username, String password) {
        User user = userDAO.getUserByUsername(username);

        if (user != null && PasswordHasher.check(password, user.getPasswordHash()))
            return user;

        return null;
    }
}
