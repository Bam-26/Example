package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {

		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(DataSetting.url, DataSetting.username, DataSetting.password);
			System.out.println("Connection Successfully");
		} catch (Exception e) {
			System.out.println("DB Connection error: " + e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}
}
