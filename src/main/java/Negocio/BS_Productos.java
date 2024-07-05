package Negocio;

import Model.Categorias;
import Model.Productos;

import java.util.List;

import Controller.controller_Productos;

import java.util.ArrayList;

public class BS_Productos {
	private controller_Productos ObjBD;
	
	public BS_Productos() {
		ObjBD = new controller_Productos();
	}
	
	public List<Categorias> ListarCategorias(){
		return ObjBD.ListarCategorias();
	}
	
	public List<Productos> ListarProductos(String IdCat){
		return ObjBD.ListarProductos(IdCat);
	}
	public ArrayList<Productos> todo() {
		return ObjBD.todo();
	}
	public Productos InfoProducto(String IdPro) {
		return ObjBD.InfoProducto(IdPro);
	}
	
	
	
	public Productos Buscar(String IdProducto) {
		return ObjBD.Buscar(IdProducto);
	}
	
	public void Insertar(Productos ObjP) {
		ObjBD.Insertar(ObjP);
	}
	public void Modificar(Productos ObjP) {
		ObjBD.Modificar(ObjP);
	}
	public void Suprimir(String IdProducto) {
		ObjBD.Suprimir(IdProducto);
	}
}
