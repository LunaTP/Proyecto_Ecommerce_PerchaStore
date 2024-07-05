package Model;

public class Administrador {
	private String Id;
    private String Apellidos;
    private String Nombres;
    private char Sexo;
    private String Tipo;
    private String Contrasena;
    
	public Administrador(String id, String apellidos, String nombres, char sexo, String tipo, String contrasena) {
		Id = id;
		Apellidos = apellidos;
		Nombres = nombres;
		Sexo = sexo;
		Tipo = tipo;
		Contrasena = contrasena;
	}
	public Administrador() {
		super();
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getApellidos() {
		return Apellidos;
	}
	public void setApellidos(String apellidos) {
		Apellidos = apellidos;
	}
	public String getNombres() {
		return Nombres;
	}
	public void setNombres(String nombres) {
		Nombres = nombres;
	}
	public char getSexo() {
		return Sexo;
	}
	public void setSexo(char sexo) {
		Sexo = sexo;
	}
	public String getTipo() {
		return Tipo;
	}
	public void setTipo(String tipo) {
		Tipo = tipo;
	}
	public String getContrasena() {
		return Contrasena;
	}
	public void setContrasena(String contrasena) {
		Contrasena = contrasena;
	}
    
    
    
}
