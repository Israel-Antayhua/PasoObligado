package Modelo.clases;

import java.io.Serializable;

public class EntidadProducto implements Serializable {
    

    int id ;
    int vista;
    String nombre;
    String descripcion;
    String urlImagen;
    double precio;
    int stock;
    String tipo;
    int id_entrada;

    public EntidadProducto() {
    }

    public EntidadProducto(int id, int vista, String nombre, String marca, String urlImagen, double precio, String cpu, int ram, int almacenamiento, int stock, String tipo, int id_entrada) {
        this.id = id;
        this.vista = vista;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.urlImagen = urlImagen;
        this.precio = precio;
        this.stock = stock;
        this.tipo = tipo;
        this.id_entrada = id_entrada;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getVista() {
        return vista;
    }

    public void setVista(int vista) {
        this.vista = vista;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getId_entrada() {
        return id_entrada;
    }

    public void setId_entrada(int id_entrada) {
        this.id_entrada = id_entrada;
    }
    
    
    
}
