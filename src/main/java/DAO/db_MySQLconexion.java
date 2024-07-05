package DAO;
import java.sql.Connection;

public class db_MySQLconexion {
	
	private db_MySQLFactory ObjMySQL;
	
	public Connection getConexion() {
		ObjMySQL = new db_MySQLFactory();
		return ObjMySQL.Cn;
	}
	
}
