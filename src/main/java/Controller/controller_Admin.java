package Controller;

import Model.Administrador;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DAO.db_MySQLconexion;

public class controller_Admin {

	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	private ArrayList<Administrador> Lista;
	private db_MySQLconexion ObjMySQL;
	
	public controller_Admin() {
		try {
			ObjMySQL = new db_MySQLconexion();
			Cn = ObjMySQL.getConexion();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public ArrayList<Administrador> Listar(){
		String SQL = "select * from administrador;";
		Lista = new ArrayList<Administrador>();
		
		try {
			Cmd = Cn.createStatement();
			Rs = Cmd.executeQuery(SQL);
			while(Rs.next()) {
				Lista.add(new Administrador(Rs.getString("Id"),
						Rs.getString("Apellidos"),
						Rs.getString("Nombres"),
						Rs.getString("Sexo").charAt(0),
						Rs.getString("Tipo"),
						Rs.getString("Contrasena")
						));
			}
			Rs.close();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		return Lista;
	}

	
	
	
	
	public Administrador Buscar(String Id) {
		String SQL = "SELECT * FROM Administrador WHERE Id=?";
		Administrador ObjC = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, Id);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjC = new Administrador(Rs.getString("Id"),
							Rs.getString("Apellidos"),
							Rs.getString("Nombres"),
							Rs.getString("Sexo").charAt(0),
							Rs.getString("Tipo"),
							Rs.getString("Contrasena"));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return ObjC;
	}

	
	
	
	
	
	public void Insertar(Administrador ObjC) {
		String SQL = "insert into Administrador (Apellidos,Nombres,Sexo,Contrasena) values(?,?,?,?)";
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, ObjC.getApellidos());
				Stmt.setString(2, ObjC.getNombres());
				Stmt.setString(3, ObjC.getSexo() + "");
				Stmt.setString(4, ObjC.getContrasena());
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}	
	}

	


	
	public void Modificar(Administrador ObjC) {
		String SQL = "update Administrador set Apellidos=?,Nombres=?,Sexo=?,Tipo=?,Contrasena=? where Id=?";
		try {
				Stmt = Cn.prepareCall(SQL);				
				Stmt.setString(1, ObjC.getApellidos());
				Stmt.setString(2, ObjC.getNombres());
				Stmt.setString(3, ObjC.getSexo() + "");
				Stmt.setString(4, ObjC.getTipo());
				Stmt.setString(5, ObjC.getContrasena());
				Stmt.setString(6, ObjC.getId());
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
	}

	
	
	
	
	public void Suprimir(String Id) {
		String SQL = "delete from Administrador where Id=?";
		try {
				Stmt = Cn.prepareCall(SQL);				
				Stmt.setString(1, Id);
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}	
	}
	
	
	
	
	
	
	public Administrador autentiticarUsuario(String nombreUsuario, String contrasena) {
        String SQL = "SELECT * FROM Administrador WHERE Nombres=? AND Contrasena=?";
        Administrador admin = null;
        try {
            Stmt = Cn.prepareCall(SQL);
            Stmt.setString(1, nombreUsuario);
            Stmt.setString(2, contrasena);
            Rs = Stmt.executeQuery();

            if (Rs.next()) {
            	admin =  new Administrador(
                        Rs.getString("Id"),
                        Rs.getString("Apellidos"),
                        Rs.getString("Nombres"),
                        Rs.getString("Sexo").charAt(0),
                        Rs.getString("Tipo"),
                        Rs.getString("Contrasena")
            			);
            }
            Rs.close();
        } catch (Exception e) {
            System.out.println("ERROR:" + e.getMessage());
        }
        return admin;
	}
}
