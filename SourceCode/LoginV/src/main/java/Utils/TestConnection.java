package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {

    private static boolean checkConnection(){
        Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(DataSetting.url, DataSetting.username, DataSetting.password);
			System.out.println("Connection Successfully");
		} catch (Exception e) {
			System.out.println("DB Connection error: " + e.getMessage());
			e.printStackTrace();
		}
		return conn != null;
    }
    public static void main(String[] args) {
       
        if (!checkConnection())
            System.out.println("Connection Failed!");

    }
}
