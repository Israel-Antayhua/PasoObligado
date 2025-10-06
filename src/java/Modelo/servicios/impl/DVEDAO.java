/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.servicios.impl;

import Herramientas.DatosGlobales;
import Modelo.clases.EntidadDVE;
import Modelo.clases.EntidadProducto;
import Modelo.serviciosInterfacez.DetalleVentaServicio;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author user
 */
public class DVEDAO implements DetalleVentaServicio {

//    @Override
//    public String DescripcionTotal(String plato, String ad1, String ad2, String ad3, String ad4, String ad5, String ad6, String ad7) {
//        String descripcion = plato + ad1 + ad2 + ad3 + ad4 + ad5 + ad6 + ad7;
//        return descripcion;
//    }
//    @Override
//    public double CuentaTotal(double plato, double ad1, double ad2, double ad3, double ad4, double ad5, double ad6, double ad7, double dscto) {
//        double cuenta = plato + ad1 + ad2 + ad3 + ad4 + ad5 + ad6 + ad7 - dscto;
//        return cuenta;
//    }
//
//    @Override
//    public EntidadDVE crearDetalleVenta(String item, int codpro, String dscp, int idprom, int cntd, double sub, double add, double dscto, double total){
//        EntidadDVE edv = new EntidadDVE(item,codpro,dscp,idprom,cntd,sub,add,dscto,total);
//        return edv;
//    };
//    
//    @Override
//    public void guardarDetalleVenta(String codigo, EntidadDVE NDVE, HashMap<String, EntidadDVE> listaDetalle){
//        Main.listaDetalle.put(codigo, NDVE);
//    };
//    
//    public EntidadDVE traerEDV (String item){
//        EntidadDVE dve = new EntidadDVE();
//        DVF dvf= new DVF ();
//        
//        dve.setCodPro(Main.listaDetalle.get(item).getCodPro());
//        dve.setIdVenta(dvf.idVenta());
//        dve.setIdProm(Main.listaDetalle.get(item).getIdProm());
//        dve.setCntd(Main.listaDetalle.get(item).getCntd());
//        dve.setSub(Main.listaDetalle.get(item).getSub());
//        dve.setAdd(Main.listaDetalle.get(item).getAdd());
//        dve.setTotal(Main.listaDetalle.get(item).getTotal());
//        return dve;
//    }
    @Override
    public double CuentaTotal() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void guardarDetalleVenta(int codigo, EntidadDVE NDVE, HashMap<Integer, EntidadDVE> listaDetalle) {
        Herramientas.DatosGlobales.listaDetalle.put(codigo, NDVE);
    }

    @Override
    public List<EntidadDVE> traerEDV() {
    ArrayList<EntidadDVE> lista = new ArrayList<>();

    for (EntidadDVE original : Herramientas.DatosGlobales.listaDetalle.values()) {
        EntidadDVE detalle = new EntidadDVE();

        // Copiar los datos del objeto original
        detalle.setCodigo(original.getCodigo());
        detalle.setIdProducto(original.getIdProducto());
        detalle.setNombre(original.getNombre());
        detalle.setUrlImg(original.getUrlImg());
        detalle.setUnidades(original.getUnidades());
        detalle.setMonto(original.getMonto());

        lista.add(detalle);
    }

    return lista;
}

    @Override
    public void eliminarCompra(int item, HashMap<Integer, EntidadDVE> listaDetalle) {
        Herramientas.DatosGlobales.listaDetalle.remove(item);
    }

    @Override
    public EntidadDVE crearDetalleVenta(int id, int idVenta, int und) {

        int item = Herramientas.DatosGlobales.getnDetalle() + 1;

        ProductoDAO proDAO = new ProductoDAO();
        String urlImg = proDAO.verProducto(id).getUrlImagen();
        String nombre = proDAO.verProducto(id).getNombre();
        double monto = und * proDAO.verProducto(id).getPrecio();

        EntidadDVE edv = new EntidadDVE(item, urlImg, id, idVenta, nombre, und, monto);

        guardarDetalleVenta(item, edv, Herramientas.DatosGlobales.listaDetalle);

        Herramientas.DatosGlobales.setnDetalle(item);
        return edv;
    }

}
