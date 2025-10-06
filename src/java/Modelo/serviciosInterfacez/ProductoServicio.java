/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Modelo.serviciosInterfacez;

import Modelo.clases.EntidadProducto;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public interface ProductoServicio {
    
    public List<EntidadProducto> traerProducto();
    public List<EntidadProducto> traerCarnes();
    public List<EntidadProducto> traerPollos();
    public EntidadProducto verProducto(int id);
    public int idProducto();
}
