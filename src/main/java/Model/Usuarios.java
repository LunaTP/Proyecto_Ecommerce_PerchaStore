package Model;

public class Usuarios {
	//Campos o atributos
	private String Id;
    private String Apellidos;
    private String Nombres;
    private int Edad;
    private char Sexo;
    private String Tipo;
    private String Contrasena;
    
    public Usuarios() {
    }

	public Usuarios(String id, String apellidos, String nombres, int edad, char sexo, String tipo, String contrasena) {
		Id = id;
		Apellidos = apellidos;
		Nombres = nombres;
		Edad = edad;
		Sexo = sexo;
		Tipo = tipo;
		Contrasena = contrasena;
	}
	
	public Usuarios(String apellidos, String nombres, int edad, char sexo, String contrasena) {
		Apellidos = apellidos;
		Nombres = nombres;
		Edad = edad;
		Sexo = sexo;
		Contrasena = contrasena;
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

	public int getEdad() {
		return Edad;
	}

	public void setEdad(int edad) {
		Edad = edad;
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