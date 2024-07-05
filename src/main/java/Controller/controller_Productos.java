package Controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DAO.db_MySQLconexion;
import Model.Categorias;
import Model.Productos;

public class controller_Productos {

	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	
	private List<Categorias> ListaC;
	private List<Productos> ListaP;
	private ArrayList<Productos> Todo;
	
	private db_MySQLconexion ObjMySQL;
	
	public controller_Productos() {
		try {
			ObjMySQL = new db_MySQLconexion();
			Cn = ObjMySQL.getConexion();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	
	public List<Categorias> ListarCategorias(){
		String SQL = "CALL ListarCategorias()";
		ListaC = new ArrayList<Categorias>();
		try {
				Stmt = Cn.prepareCall(SQL);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaC.add(new Categorias(Rs.getString("IdCategoria"), 
											Rs.getString("Descripcion"),
											Rs.getString("Imagen")));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA CATEGORIAS :" + e.getMessage());
		}
		return ListaC;
	}
	
	
	
	public List<Productos> ListarProductos(String IdCat){
		String SQL = "CALL ListarProductosXCategoria(?)";
		ListaP = new ArrayList<Productos>();
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, IdCat);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaP.add(new Productos(Rs.getString("IdProducto"), 
											Rs.getString("IdCategoria"),
											Rs.getString("Descripcion"),
											Rs.getDouble("PrecioUnidad"),
											Rs.getInt("Stock"),
											Rs.getString("Imagen")));
											
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
		return ListaP;
	}
	
	
	public ArrayList<Productos> todo() {
		String SQL =  "Select *  from productos";
		Todo = new ArrayList<Productos>();
		try {
			Cmd = Cn.createStatement();
			Rs = Cmd.executeQuery(SQL);
			while(Rs.next()) {
				Todo.add(new Productos(Rs.getString("IdProducto"), 
						Rs.getString("IdCategoria"),
						Rs.getString("Descripcion"),
						Rs.getDouble("PrecioUnidad"),
						Rs.getInt("Stock"),
						Rs.getString("Imagen")));		
			}
			Rs.close();
		} catch (Exception e) {
			System.out.println("error"+ e.getMessage());
		}
			
		return Todo;
	}
	
	
	public Productos InfoProducto(String IdPro) {
		String SQL = "CALL InfoProducto(?)";
		Productos ObjP = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, IdPro);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjP = new Productos(Rs.getString("IdProducto"), 
										Rs.getString("IdCategoria"),
										Rs.getString("Descripcion"),
										Rs.getDouble("PrecioUnidad"),
										Rs.getInt("Stock"),
										Rs.getString("Imagen"));
				}
				Rs.close();
		} catch (Exception e) {
			System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
		return ObjP;
	}
	
	
	public Productos Buscar(String IdProducto) {
		String SQL = "SELECT *  FROM Productos WHERE IdProducto=?";
		Productos ObjP = null;
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, IdProducto);
			Rs = Stmt.executeQuery();
			if(Rs.next()) {
				ObjP =  new Productos(Rs.getString("IdProducto"),
							Rs.getString("IdCategoria"),
							Rs.getString("Descripcion"),
							Rs.getDouble("PrecioUnidad"),
							Rs.getInt("Stock"),
							Rs.getString("Imagen")
						);
				
			}
			Rs.close();
		} catch(Exception e) {
			System.out.println("ERROR: " + e.getMessage());
		}
		return ObjP;
	}
	
	
	
	public void Insertar(Productos ObjP) {
		String SQL = "insert into Productos (IdCategoria,Descripcion,PrecioUnidad,Stock	) values(?,?,?,?)";
			try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, ObjP.getIdCategoria());
				Stmt.setString(2, ObjP.getDescripcion());
				Stmt.setDouble(3, ObjP.getPrecioUnidad());
				Stmt.setInt(4, ObjP.getStock());
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}	
		
	
	}
	
	
	
	public void Modificar(Productos ObjP) {
	String SQL = "update Productos set IdCategoria=?,Descripcion=?,PrecioUnidad=?,Stock=? where IdProducto=?";
		try {
				Stmt = Cn.prepareCall(SQL);				
				Stmt.setString(1, ObjP.getIdCategoria());
				Stmt.setString(2, ObjP.getDescripcion());
				Stmt.setDouble(3, ObjP.getPrecioUnidad());
				Stmt.setInt(4, ObjP.getStock());
				Stmt.setString(5, ObjP.getIdProducto());
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
	}
	
	
	
	public void Suprimir(String IdProducto) {
		String SQL = "delete from Productos where IdProducto=?";
		try {
				Stmt = Cn.prepareCall(SQL);				
				Stmt.setString(1, IdProducto);
				Stmt.executeUpdate();			
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}	
	}
	
	
	
	
	
	
}
