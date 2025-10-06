/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.servicios.impl;

import Herramientas.Conexion;
import Modelo.clases.EntidadDVE;
import Modelo.clases.EntidadProducto;
import Modelo.serviciosInterfacez.ProductoServicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import static org.apache.jasper.compiler.ELFunctionMapper.map;
import static org.eclipse.tags.shaded.org.apache.xalan.lib.ExsltDynamic.map;

/**
 *
 * @author USUARIO
 */
public class ProductoDAO implements ProductoServicio {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<EntidadProducto> traerProducto() {
        ArrayList<EntidadProducto> lista = new ArrayList<>();
        List<Map.Entry<Integer, EntidadDVE>> detalles = new ArrayList<>(Herramientas.DatosGlobales.listaDetalle.entrySet());

        try {
            cn = Conexion.getConnection();
            String sql = "select * from Producto";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                EntidadProducto obj = new EntidadProducto();
                obj.setId(rs.getInt("idProducto"));
                obj.setVista(rs.getInt("vista"));
                obj.setNombre(rs.getString("nombreProducto"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setUrlImagen(rs.getString("urlImagen"));
                obj.setPrecio(rs.getDouble("precio"));
                int stockBase = rs.getInt("stock"); // Stock original de la base
                obj.setStock(stockBase); // Primero establecemos el stock original
                obj.setTipo(rs.getString("tipo"));

                
                    // Buscamos si hay detalles para este producto
                    int stockFinal = stockBase;
                    for (Map.Entry<Integer, EntidadDVE> detalle : Herramientas.DatosGlobales.listaDetalle.entrySet()) {
                        if (detalle.getValue().getIdProducto() == obj.getId()) {
                            stockFinal -= detalle.getValue().getUnidades();
                        }
                    }

                    // Asegurar que el stock no sea negativo
                    obj.setStock(Math.max(stockFinal, 0));
                    lista.add(obj);// Agregamos el producto con stock actualizado
                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {

            }
        }

        return lista;
    }

    @Override
    public List<EntidadProducto> traerCarnes() {
        ArrayList<EntidadProducto> lista = new ArrayList<>();
        List<Map.Entry<Integer, EntidadDVE>> detalles = new ArrayList<>(Herramientas.DatosGlobales.listaDetalle.entrySet());

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM Producto WHERE tipo = 'carnes'";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                EntidadProducto obj = new EntidadProducto();
                obj.setId(rs.getInt("idProducto"));
                obj.setVista(rs.getInt("vista"));
                obj.setNombre(rs.getString("nombreProducto"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setUrlImagen(rs.getString("urlImagen"));
                obj.setPrecio(rs.getDouble("precio"));
                int stockBase = rs.getInt("stock"); // Stock original de la base
                obj.setStock(stockBase); // Primero establecemos el stock original
                obj.setTipo(rs.getString("tipo"));

                if (obj.getVista() >= 1) {
                    // Buscamos si hay detalles para este producto
                    int stockFinal = stockBase;
                    for (Map.Entry<Integer, EntidadDVE> detalle : Herramientas.DatosGlobales.listaDetalle.entrySet()) {
                        if (detalle.getValue().getIdProducto() == obj.getId()) {
                            stockFinal -= detalle.getValue().getUnidades();
                        }
                    }

                    // Asegurar que el stock no sea negativo
                    obj.setStock(Math.max(stockFinal, 0));
                    lista.add(obj);// Agregamos el producto con stock actualizado
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return lista;
    }

    @Override
    public List<EntidadProducto> traerPollos() {
        ArrayList<EntidadProducto> lista = new ArrayList<>();
        List<Map.Entry<Integer, EntidadDVE>> detalles = new ArrayList<>(Herramientas.DatosGlobales.listaDetalle.entrySet());

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM Producto WHERE tipo = 'pollos'";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                EntidadProducto obj = new EntidadProducto();
                obj.setId(rs.getInt("idProducto"));
                obj.setVista(rs.getInt("vista"));
                obj.setNombre(rs.getString("nombreProducto"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setUrlImagen(rs.getString("urlImagen"));
                obj.setPrecio(rs.getDouble("precio"));
                int stockBase = rs.getInt("stock"); // Stock original de la base
                obj.setStock(stockBase); // Primero establecemos el stock original
                obj.setTipo(rs.getString("tipo"));

                if (obj.getVista() >= 1) {
                    // Buscamos si hay detalles para este producto
                    int stockFinal = stockBase;
                    for (Map.Entry<Integer, EntidadDVE> detalle : Herramientas.DatosGlobales.listaDetalle.entrySet()) {
                        if (detalle.getValue().getIdProducto() == obj.getId()) {
                            stockFinal -= detalle.getValue().getUnidades();
                        }
                    }

                    // Asegurar que el stock no sea negativo
                    obj.setStock(Math.max(stockFinal, 0));
                    lista.add(obj);// Agregamos el producto con stock actualizado
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {

            }
        }

        return lista;
    }

    @Override
    public EntidadProducto verProducto(int id) {
        EntidadProducto obj = new EntidadProducto();

        try {
            cn = Conexion.getConnection();
            // Usar parámetros preparados para evitar SQL injection
            String sql = "SELECT * FROM Producto WHERE idProducto = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj.setId(rs.getInt("idProducto"));
                obj.setVista(rs.getInt("vista"));
                obj.setNombre(rs.getString("nombreProducto"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setUrlImagen(rs.getString("urlImagen"));
                obj.setPrecio(rs.getDouble("precio"));

                int stockBase = rs.getInt("stock");
                obj.setTipo(rs.getString("tipo"));

                // Ajustar stock según detalles existentes
                int stockFinal = stockBase;
                for (Map.Entry<Integer, EntidadDVE> detalle : Herramientas.DatosGlobales.listaDetalle.entrySet()) {
                    if (detalle.getValue().getIdProducto() == id) {
                        stockFinal -= detalle.getValue().getUnidades();
                    }
                }

                // Asegurar que el stock no sea negativo
                obj.setStock(Math.max(stockFinal, 0));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            // Considera lanzar una excepción personalizada aquí
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return obj;
    }

    @Override
    public int idProducto() {
        int idv = 0;
        String sql = "select max(idProducto) from producto";
        try {
            cn = Conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idv = rs.getInt(1);
            }
        } catch (Exception e) {

        }

        return idv;
    }
    
    public int idEntrada() {
        int ide = 0;
        String sql = "select max(idEntrada) from entradaproducto";
        try {
            cn = Conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ide = rs.getInt(1);
            }
        } catch (Exception e) {

        }

        return ide;
    }
}
