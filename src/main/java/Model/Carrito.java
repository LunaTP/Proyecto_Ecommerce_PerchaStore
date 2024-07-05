package Model;


public class Carrito {
    // Campos o Atributos
    private String IdProducto;
    private int Cantidad;

    // Métodos Constructores
    public Carrito() {
    }
    
    public Carrito(String IdProducto, int Cantidad) {
        this.IdProducto = IdProducto;
        this.Cantidad = Cantidad;
    }
    
    // Propiedades de Lectura y Escritura
    public String getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(String IdProducto) {
        this.IdProducto = IdProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    
}
