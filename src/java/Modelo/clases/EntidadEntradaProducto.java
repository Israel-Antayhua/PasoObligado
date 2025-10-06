/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.clases;

import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class EntidadEntradaProducto {
    
    private int id;
    private int cantida;
    private double costo;
    private Date fecha;
    private String factura;
    private int id_Producto;
    private int id_Proveedor;

    public EntidadEntradaProducto() {
    }

    public EntidadEntradaProducto(int id, int cantida, double costo, Date fecha, String factura, int id_Producto, int id_Proveedor) {
        this.id = id;
        this.cantida = cantida;
        this.costo = costo;
        this.fecha = fecha;
        this.factura = factura;
        this.id_Producto = id_Producto;
        this.id_Proveedor = id_Proveedor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCantida() {
        return cantida;
    }

    public void setCantida(int cantida) {
        this.cantida = cantida;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getFactura() {
        return factura;
    }

    public void setFactura(String factura) {
        this.factura = factura;
    }

    public int getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
    }

    public int getId_Proveedor() {
        return id_Proveedor;
    }

    public void setId_Proveedor(int id_Proveedor) {
        this.id_Proveedor = id_Proveedor;
    }
    
    
            
}
