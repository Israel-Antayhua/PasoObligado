/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.clases;

/**
 *
 * @author USUARIO
 */
public class EntidadDVE {
    
    int codigo;
    String urlImg;
    int idProducto;
    int idVenta;
    String nombre;
    int unidades;
    double monto;

    public EntidadDVE() {
    }

    public EntidadDVE(int codigo, String urlImg, int idProducto, int idVenta, String nombre, int unidades, double monto) {
        this.codigo = codigo;//ITEM = CODIGO
        this.urlImg = urlImg;
        this.idProducto = idProducto;
        this.idVenta = idVenta;
        this.nombre = nombre;
        this.unidades = unidades;
        this.monto = monto;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    
    
}
