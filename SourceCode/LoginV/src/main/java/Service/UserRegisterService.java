package Service;

import DAO.UserDAO;
import Model.User;
import Utils.PasswordHasher;

public class UserRegisterService {

    private UserDAO userDAO;

    public UserRegisterService() {
        this.userDAO = new UserDAO();
    }

    public boolean register(User user, String rawPassword) {

        if (userDAO.getUserByUsername(user.getUsername()) != null )
            return false;

        String hashedPassword = PasswordHasher.hash(rawPassword);

        
        user.setPasswordHash(hashedPassword);

        return userDAO.createUser(user);
    }
}
