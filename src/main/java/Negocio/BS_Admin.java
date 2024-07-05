package Negocio;

import java.util.ArrayList;

import Controller.controller_Admin;
import Model.Administrador;

public class BS_Admin {
	private controller_Admin ObjBD;
	
	
	public BS_Admin() {
		ObjBD = new controller_Admin();
	}
	
	
	public ArrayList<Administrador> Listar(){
		return ObjBD.Listar();
	}

	public Administrador Buscar(String Id) {
		return ObjBD.Buscar(Id);
	}

	public void Insertar(Administrador ObjC) {
		ObjBD.Insertar(ObjC);
	}
	
	public void Modificar(Administrador ObjC) {
		ObjBD.Modificar(ObjC);
	}
	
	public void Suprimir(String Id) {
		ObjBD.Suprimir(Id);
	}	
	
	
}
