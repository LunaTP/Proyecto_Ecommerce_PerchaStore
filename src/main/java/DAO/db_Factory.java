package DAO;

public class db_Factory {

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;
	public static final int ORACLE = 3;
	
	public static db_Factory getDbFactory(int tipo) {
		switch(tipo) {
			case MYSQL:
				return new db_MySQLFactory();
			default:
				return null;
		}
	}
}

