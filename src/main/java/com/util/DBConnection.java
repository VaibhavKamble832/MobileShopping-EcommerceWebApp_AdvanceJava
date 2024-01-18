package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnect() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/e_commerce_app";
			con = DriverManager.getConnection(url, "root", "");
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return con;
	}
}
