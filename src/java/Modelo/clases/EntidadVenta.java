/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.clases;

/**
 *
 * @author USUARIO
 */
public class EntidadVenta {
    
    int id;
    int idUsuario;
    String fecha;
    double totalFinal;
    int estadoEntrega;

    public EntidadVenta() {
    }

    public EntidadVenta(int id, int idUsuario, String fecha, double totalFinal, int estadoEntrega) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.fecha = fecha;
        this.totalFinal = totalFinal;
        this.estadoEntrega = estadoEntrega;
    }

    public int getEstadoEntrega() {
        return estadoEntrega;
    }

    public void setEstadoEntrega(int estadoEntrega) {
        this.estadoEntrega = estadoEntrega;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotalFinal() {
        return totalFinal;
    }

    public void setTotalFinal(double totalFinal) {
        this.totalFinal = totalFinal;
    }
    
    
}
