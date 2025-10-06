/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.servicios.impl;

import Herramientas.Conexion;
import Modelo.clases.EntidadDVE;
import Modelo.clases.EntidadEntradaProducto;
import Modelo.clases.EntidadProducto;
import Modelo.clases.EntidadProveedor;
import Modelo.clases.EntidadVenta;
import Modelo.serviciosInterfacez.Admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Pc-03
 */
public class AdminDAO implements Admin {

    public AdminDAO() {

    }
    private Connection con;
    private ResultSet rs = null;

    public AdminDAO(Connection con) {
        this.con = con;
    }

    PreparedStatement ps;

    @Override
    public boolean agregarProducto(EntidadProducto producto) {
        String sql = "INSERT INTO producto (vista, nombreProducto, descripcion, precio, stock, id_entrada, urlImagen, tipo) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getVista());
            ps.setString(2, producto.getNombre());
            ps.setString(3, producto.getDescripcion());
            ps.setDouble(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setInt(9, producto.getId_entrada());
            ps.setString(10, producto.getUrlImagen());
            ps.setString(11, producto.getTipo());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error al agregar producto: " + e);
        }
        return false;
    }

    public boolean insertarProveedor(EntidadProveedor proveedor) {
        String sql = "INSERT INTO proveedor (nombreProveedor, correo, telefono, ruc, direccion)" + "VALUES (?, ?, ?, ?, ?)";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);

            // Establecer parámetros
            ps.setString(1, proveedor.getNombre());
            ps.setString(2, proveedor.getCorreo());
            ps.setString(3, proveedor.getTelefono());
            ps.setString(4, proveedor.getRuc());
            ps.setString(5, proveedor.getDireccion());

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al insertar proveedor: " + e.getMessage());
            return false;
        }
    }

    public boolean insertarEntradaProducto(EntidadEntradaProducto entrada) {
        String sql = "INSERT INTO entradaproducto (cantida, costo, fecha, factura, id_producto, id_proveedor) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);

            // Establecer parámetros
            ps.setInt(1, entrada.getCantida());
            ps.setDouble(2, entrada.getCosto());
            ps.setDate(3, new java.sql.Date(entrada.getFecha().getTime()));
            ps.setString(4, entrada.getFactura());
            ps.setInt(5, entrada.getId_Producto());
            ps.setInt(6, 1);

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al insertar entrada: " + e.getMessage());
            return false;
        }
    }

    public List<EntidadProveedor> traerProveedor() {
        ArrayList<EntidadProveedor> lista = new ArrayList<>();

        try {
            con = Conexion.getConnection();
            String sql = "select * from proveedor";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                EntidadProveedor obj = new EntidadProveedor();
                obj.setId(rs.getInt("idProveedor"));
                obj.setNombre(rs.getString("nombreProveedor"));
                obj.setCorreo(rs.getString("correo"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setRuc(rs.getString("ruc"));
                obj.setDireccion(rs.getString("direccion"));

                lista.add(obj);// Agregamos el producto con stock actualizado

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
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

    public List<EntidadVenta> traerVentas() {
        ArrayList<EntidadVenta> lista = new ArrayList<>();

        try {
            con = Conexion.getConnection();
            String sql = "select * from venta";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                EntidadVenta obj = new EntidadVenta();
                obj.setId(rs.getInt("idVenta"));
                obj.setIdUsuario(rs.getInt("id_usuario"));
                obj.setFecha(rs.getTimestamp("fVenta").toString());
                obj.setTotalFinal(rs.getDouble("total"));
                obj.setEstadoEntrega(rs.getInt("estadoEntrega"));

                lista.add(obj);// Agregamos el producto con stock actualizado

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
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

    public List<EntidadEntradaProducto> traerEntradas() {
        List<EntidadEntradaProducto> lista = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = Conexion.getConnection();
            String sql = "select * from entradaproducto";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                EntidadEntradaProducto entrada = new EntidadEntradaProducto();
                entrada.setId(rs.getInt("idEntrada"));
                entrada.setCantida(rs.getInt("cantida"));
                entrada.setCosto(rs.getDouble("costo"));
                entrada.setFecha(rs.getDate("fecha"));
                entrada.setFactura(rs.getString("factura"));
                entrada.setId_Producto(rs.getInt("id_producto"));
                entrada.setId_Proveedor(rs.getInt("id_proveedor"));
                lista.add(entrada);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return lista;
    }

    public boolean actualizarEstadoVenta(int idVenta, int nuevoEstado) {
        String sql = "UPDATE venta SET estadoEntrega = ? WHERE id = ?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, nuevoEstado);
            ps.setInt(2, idVenta);

            return ps.executeUpdate() > 0;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean actualizaridVenta(int idProducto, int idVenta) {
        try (Connection con = Conexion.getConnection()) {
            String sql = "UPDATE Producto SET id_entrada = ? WHERE idProducto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idVenta);
            ps.setInt(2, idProducto);
            return ps.executeUpdate() > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminarProducto(int idProducto) {
        String sql = "DELETE FROM producto WHERE idProducto = ?";
        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error al eliminar producto: " + e);
        }
        return false;
    }

    @Override
    public boolean actualizarStock(int idProducto, int cantidad) {
        try (Connection con = Conexion.getConnection()) {
            String sql = "UPDATE Producto SET stock = stock + ? WHERE idProducto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cantidad);
            ps.setInt(2, idProducto);
            return ps.executeUpdate() > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean editarPrecio(int idProducto, double nuevoPrecio) {
        try (Connection con = Conexion.getConnection()) {
            String sql = "UPDATE Producto SET precio = ? WHERE idProducto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, nuevoPrecio);
            ps.setInt(2, idProducto);
            return ps.executeUpdate() > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean editarVista(int idProducto, int vista) {
        try (Connection con = Conexion.getConnection()) {
            String sql = "UPDATE Producto SET vista = ? WHERE idProducto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, vista);
            ps.setInt(2, idProducto);
            return ps.executeUpdate() > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<EntidadVenta> obtenerVentasEntreFechas(String fechaInicio, String fechaFin) {
        List<EntidadVenta> lista = new ArrayList<>();
        String sql = "SELECT * FROM venta WHERE fVenta BETWEEN ? AND ? ORDER BY fVenta ASC";

        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, fechaInicio);
            ps.setString(2, fechaFin);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                EntidadVenta v = new EntidadVenta();
                v.setId(rs.getInt("idVenta"));
                v.setFecha(rs.getString("fVenta"));
                v.setIdUsuario(rs.getInt("id_usuario"));
                v.setTotalFinal(rs.getDouble("total"));
                v.setEstadoEntrega(rs.getInt("estadoEntrega"));
                lista.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

}
