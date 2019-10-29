package com.industrialmaster.carsale.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {

	static String url = "jdbc:mysql://localhost:3306/carsale";
	static String driver = "com.mysql.jdbc.Driver";
	
	static Connection con = null;
	
	public static Connection getCon() throws Exception {
		if(con==null) {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "root","");
		}
		return con;
	}
	
}
