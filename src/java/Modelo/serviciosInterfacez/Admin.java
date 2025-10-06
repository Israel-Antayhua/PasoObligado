/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Modelo.serviciosInterfacez;

import Modelo.clases.EntidadProducto;

/**
 *
 * @author Pc-03
 */
public interface Admin {

    boolean agregarProducto(EntidadProducto producto);

    boolean eliminarProducto(int idProducto);

    boolean actualizarStock(int idProducto, int cantidad);

    boolean editarPrecio(int idProducto, double nuevoPrecio);

    public boolean editarVista(int idProducto, int vista);

}
