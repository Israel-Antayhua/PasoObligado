/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Modelo.serviciosInterfacez;

import Modelo.clases.EntidadDVE;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public interface DetalleVentaServicio {
    
    public double CuentaTotal ();
    public EntidadDVE crearDetalleVenta(int id , int idVenta, int und);
    public void eliminarCompra(int codigo, HashMap<Integer, EntidadDVE> listaDetalle); //YA ESTA
    public void guardarDetalleVenta(int codigo, EntidadDVE NDVE, HashMap<Integer, EntidadDVE> listaDetalle);
    public List<EntidadDVE> traerEDV();
    
}
