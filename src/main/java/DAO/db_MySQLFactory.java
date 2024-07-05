package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class db_MySQLFactory extends db_Factory{

	private String Driver = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost/usuarios2023";
	private String Usuario = "root";
	private String Password = "";
	
	public Connection Cn;
	
	public db_MySQLFactory() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL,Usuario,Password);
		} catch(Exception e) {
			System.out.println("Error de conexión :" + e.getMessage());
		}
	}
}
