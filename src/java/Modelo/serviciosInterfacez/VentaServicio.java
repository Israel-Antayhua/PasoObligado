/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Modelo.serviciosInterfacez;

import Modelo.clases.EntidadDVF;
import Modelo.clases.EntidadVenta;

/**
 *
 * @author USUARIO
 */
public interface VentaServicio {
    
    //ESTOS SON UNICAMENTE PARA SUBIR LOS DATOS A LA BD, CON ESTO ACABA EL PROCESO DE COMPRA

    public int idVenta();

    public int guradarDetalleVenta(EntidadDVF edv);

    public int guardarVenta(int idUsuario, String fecha, double totalFinal);

    public EntidadVenta traerId(String idU, String fecha, double monto);
    
    public int actualizarStock(int idProducto, int cantidadVendida);

}
