/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.servicios.impl;

import Herramientas.Conexion;
import Modelo.clases.EntidadDVF;
import Modelo.clases.EntidadProveedor;
import Modelo.clases.EntidadVenta;
import Modelo.clases.EntidadVenta;
import Modelo.serviciosInterfacez.VentaServicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public class DVFDAO implements VentaServicio {

    PreparedStatement ps;
    ResultSet rs;

    EntidadVenta ev = new EntidadVenta();
    Conexion con = new Conexion();
    Connection acces;
    int rpt = 0;

    @Override
    public int idVenta() {
        int idv = 0;
        String sql = "select max(idVenta) from venta";
        try {
            acces = con.getConnection();
            ps = acces.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idv = rs.getInt(1);
            }
        } catch (Exception e) {

        }

        return idv;
    }

    @Override
    public int guradarDetalleVenta(EntidadDVF edv) {
        String sql = "insert into detalleventa (id_producto,id_venta,cantidad,precioSubtotal) values (?,?,?,?)";
        try {
            acces = con.getConnection();
            ps = acces.prepareStatement(sql);
            ps.setInt(1, edv.getIdProducto());
            ps.setInt(2, edv.getIdVenta());
            ps.setInt(3, edv.getCantidad());
            ps.setDouble(4, edv.getSubtotal());
            rpt = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return rpt;
    }

    @Override
    public int guardarVenta(int idUsuario, String fecha, double totalFinal) {
        EntidadVenta ev = new EntidadVenta();
        ev.setFecha(fecha);
        ev.setIdUsuario(idUsuario);
        ev.setTotalFinal(totalFinal);
        String sql = "insert into venta (id_usuario,fVenta,total) values (?,?,?)";
        try {
            acces = con.getConnection();
            ps = acces.prepareStatement(sql);
            ps.setInt(1, ev.getIdUsuario());
            ps.setString(2, ev.getFecha());
            ps.setDouble(3, ev.getTotalFinal());

            rpt = ps.executeUpdate();
        } catch (Exception e) {

            System.out.println(e);
        }
        return rpt;
    }

    @Override
    public EntidadVenta traerId(String idU, String fecha, double monto) {
        EntidadVenta evu = new EntidadVenta();
        String sql = "select * from Venta where idUsuario = ? and fechaVenta = ? and monto = ? ";
        try {
            acces = con.getConnection();
            ps = acces.prepareStatement(sql);
            ps.setString(1, idU);
            ps.setString(2, fecha);
            ps.setDouble(3, monto);
            rs = ps.executeQuery();
            while (rs.next()) {
                evu.setId(rs.getInt(1));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return evu;
    }
    
    @Override
    public int actualizarStock(int idProducto, int cantidadVendida) {
        String sql = "UPDATE producto SET stock = stock - ? WHERE idProducto = ?";
        int resultado = 0;
        try {
            acces = con.getConnection();
            ps = acces.prepareStatement(sql);
            ps.setInt(1, cantidadVendida);   // restar esta cantidad del stock
            ps.setInt(2, idProducto);        // id del producto
            resultado = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al actualizar stock: " + e.getMessage());
        }
        return resultado;
    }

//       public int idVenta() {
//        int idv = 0;
//        String sql = "select max(idVenta) from Venta";
//        try {
//            acces = con.establecerConexion();
//            ps = acces.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                idv = rs.getInt(1);
//            }
//        } catch (Exception e) {
//
//        }
//        return idv;
//    }
}
