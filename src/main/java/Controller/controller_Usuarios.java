package Controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DAO.db_MySQLconexion;
import Model.Usuarios;

public class controller_Usuarios {

	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	
	private ArrayList<Usuarios> Lista;
	private db_MySQLconexion ObjMySQL;
	
	public controller_Usuarios() {
		try {
			ObjMySQL = new db_MySQLconexion();
			Cn = ObjMySQL.getConexion();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}	
	}
	
	
	
	
	public ArrayList<Usuarios> Listar(){
		String SQL = "CALL ListarUsuarios()";
		Lista = new ArrayList<Usuarios>();
		try {
				Cmd = Cn.createStatement();
				Rs = Cmd.executeQuery(SQL);
				while(Rs.next()) {
					Lista.add(new Usuarios(Rs.getString("Id"),
								Rs.getString("Apellidos"),
								Rs.getString("Nombres"),
								Rs.getInt("Edad"),
								Rs.getString("Sexo").charAt(0),
								Rs.getString("Tipo"),
								Rs.getString("Contrasena")));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return Lista;
	}
	
	
	
	
	public Usuarios Buscar(String Id) {
		String SQL = "SELECT * FROM Usuarios WHERE Id=?";
		Usuarios ObjC = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, Id);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjC = new Usuarios(Rs.getString("Id"),
							Rs.getString("Apellidos"),
							Rs.getString("Nombres"),
							Rs.getInt("Edad"),
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
	
	
	
	
	public void Insertar(Usuarios ObjC) {
		String SQL = "insert into Usuarios (Apellidos,Nombres,Edad,Sexo,Contrasena) values(?,?,?,?,?)";
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, ObjC.getApellidos());
				Stmt.setString(2, ObjC.getNombres());
				Stmt.setInt(3, ObjC.getEdad());
				Stmt.setString(4, ObjC.getSexo() + "");
				Stmt.setString(5, ObjC.getContrasena());
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
	}
	
	
	
	
	
	public void Modificar(Usuarios ObjC) {
		String SQL = "update Usuarios set Apellidos=?,Nombres=?,Edad=?,Sexo=?,Tipo=?,Contrasena=? where Id=?";
		try {
				Stmt = Cn.prepareCall(SQL);				
				Stmt.setString(1, ObjC.getApellidos());
				Stmt.setString(2, ObjC.getNombres());
				Stmt.setInt(3, ObjC.getEdad());
				Stmt.setString(4, ObjC.getSexo() + "");
				Stmt.setString(5, ObjC.getTipo());
				Stmt.setString(6, ObjC.getContrasena());
				Stmt.setString(7, ObjC.getId());
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
	}
	
	
	
	
	
	public void Suprimir(String Id) {
		String SQL = "delete from Usuarios where Id=?";
		try {
				Stmt = Cn.prepareCall(SQL);				
				Stmt.setString(1, Id);
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
	}
	
	
	public Usuarios autenticarUsuario(String nombreUsuario, String contrasena) {
        String SQL = "SELECT * FROM Usuarios WHERE Nombres=? AND Contrasena=?";
        Usuarios usuario = null;
        try {
            Stmt = Cn.prepareCall(SQL);
            Stmt.setString(1, nombreUsuario);
            Stmt.setString(2, contrasena);
            Rs = Stmt.executeQuery();

            if (Rs.next()) {
                usuario = new Usuarios(
                        Rs.getString("Id"),
                        Rs.getString("Apellidos"),
                        Rs.getString("Nombres"),
                        Rs.getInt("Edad"),
                        Rs.getString("Sexo").charAt(0),
                        Rs.getString("Tipo"),
                        Rs.getString("Contrasena")
                );
            }
            Rs.close();
        } catch (Exception e) {
            System.out.println("ERROR:" + e.getMessage());
        }
        return usuario;
    }
		
}
