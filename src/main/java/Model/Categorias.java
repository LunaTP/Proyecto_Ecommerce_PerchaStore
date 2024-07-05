package Model;

public class Categorias {
	// Campos o atributos
	private String IdCategoria;
	private String Descripcion;
	private String Imagen;
	
	// Métodos Constructores
	public Categorias(String idCategoria, String descripcion, String imagen) {
		IdCategoria = idCategoria;
		Descripcion = descripcion;
		Imagen = imagen;
	}
	public Categorias() {
	}
	
	// Propiedades get/set
	public String getIdCategoria() {
		return IdCategoria;
	}
	public void setIdCategoria(String idCategoria) {
		IdCategoria = idCategoria;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public String getImagen() {
		return Imagen;
	}
	public void setImagen(String imagen) {
		Imagen = imagen;
	}
}

