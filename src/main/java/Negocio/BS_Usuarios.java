package Negocio;

import java.util.ArrayList;

import Controller.controller_Usuarios;
import Model.Usuarios;

public class BS_Usuarios {
	private controller_Usuarios ObjBD;
	
	public BS_Usuarios() {
		ObjBD = new controller_Usuarios();
	}
	
	public ArrayList<Usuarios> Listar(){
		return ObjBD.Listar();
	}
	
	
	
	
	public Usuarios Buscar(String Id) {
		return ObjBD.Buscar(Id);
	}
	
	
	
	
	public void Insertar(Usuarios ObjC) {
		ObjBD.Insertar(ObjC);
	}
	
	
	
	
	
	
	public void Modificar(Usuarios ObjC) {
		ObjBD.Modificar(ObjC);
	}
	
	
	
	
	
	public void Suprimir(String Id) {
		ObjBD.Suprimir(Id);
	}
	
}
