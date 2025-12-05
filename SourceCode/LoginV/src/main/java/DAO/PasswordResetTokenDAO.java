package DAO;

import Utils.DatabaseUtil;
import java.sql.*;


public class PasswordResetTokenDAO {
    
    public boolean saveToken(int userId, String token) {

        deleteOldTokens(userId);
        
        String sql = "INSERT INTO password_reset_tokens (userId, token) VALUES (?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	

            pstmt.setInt(1, userId);
            pstmt.setString(2, token);

            
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    

    public Integer validateToken(String token) {
        String sql = "SELECT userId FROM password_reset_tokens " +
                     "WHERE token = ? AND used = FALSE AND expiry_date > NOW()";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, token);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("userId");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    

    public boolean markTokenAsUsed(String token) {
        String sql = "UPDATE password_reset_tokens SET used = TRUE WHERE token = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, token);
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    

    private void deleteOldTokens(int userId) {
        String sql = "DELETE FROM password_reset_tokens WHERE userId = ? AND used = FALSE";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}