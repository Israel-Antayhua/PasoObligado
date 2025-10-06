/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.servicios.impl;

import Herramientas.Conexion;
import Modelo.clases.EntidadUsuarios;
import Modelo.clases.EntidadVenta;
import Modelo.serviciosInterfacez.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO implements Usuarios {

    public UsuariosDAO() {
    }

    private Connection cn;
    private ResultSet rs = null;
    PreparedStatement ps;

    public UsuariosDAO(Connection cn) {
        this.cn = cn;
    }

    @Override
    public boolean insertarUsuario(EntidadUsuarios usuario) {
        String sql = "INSERT INTO usuario (username, password, email, fechaRegistro, fechaNacimiento) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getPassword());
            ps.setString(3, usuario.getEmail());
            ps.setDate(4, new java.sql.Date(usuario.getFechaRegistro().getTime()));
            ps.setDate(5, new java.sql.Date(usuario.getFechaNacimiento().getTime()));

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean actualizarUsuario(EntidadUsuarios usuario) {
        String sql = "UPDATE usuario SET username = ?, email = ? WHERE idUsuario = ?";

        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getEmail());
            ps.setInt(3, usuario.getIdUsuario());
            int filas = ps.executeUpdate();
            System.out.println("Filas afectadas: " + filas);
            return filas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarContraseña(EntidadUsuarios usuario) {
        String sql = "UPDATE usuario SET password = ? WHERE idUsuario = ?";

        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, usuario.getPassword());
            ps.setInt(2, usuario.getIdUsuario());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {

            System.err.println("Error al actualizar la contraseña: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean eliminarUsuario(int idUsuario) {
        String sql = "DELETE FROM usuario WHERE idUsuario = ?";

        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public EntidadUsuarios obtenerUsuarioPorId(int id) {
        String sql = "SELECT * FROM usuario WHERE idUsuario = ?";
        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    EntidadUsuarios u = new EntidadUsuarios();
                    u.setIdUsuario(rs.getInt("idUsuario"));
                    u.setUsername(rs.getString("username"));
                    u.setPassword(rs.getString("password"));
                    u.setEmail(rs.getString("email"));
                    u.setFechaRegistro(rs.getDate("fechaRegistro"));
                    u.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                    u.setTipoUsuario(rs.getInt("tipoUsuario"));
                    return u;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener usuario por ID: " + e.getMessage());
        }
        return null;
    }

    @Override
    public EntidadUsuarios obtenerUsuarioPorUsername(String username) {
        String sql = "SELECT * FROM usuario WHERE username = ?";

        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    EntidadUsuarios usuario = new EntidadUsuarios();
                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setUsername(rs.getString("username"));
                    usuario.setPassword(rs.getString("password"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setFechaRegistro(rs.getDate("fechaRegistro"));
                    usuario.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                    return usuario;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean verificarCredenciales(String username, String password) {
        String sql = "SELECT * FROM usuario WHERE username = ? AND password = ?";

        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // Si encuentra una fila, las credenciales son correctas
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //OPTENCION PARA ENTRAR A UN USUARIO//
    @Override
    public EntidadUsuarios obtenerPorCredenciales(String username, String password) {
        EntidadUsuarios usuario = null;
        try {
            if (cn == null || cn.isClosed()) {
                cn = Conexion.getConnection(); // 
            }

            String sql = "SELECT * FROM usuario WHERE username = ? AND password = ?";
            PreparedStatement stmt = cn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new EntidadUsuarios();
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword(rs.getString("password"));
                usuario.setTipoUsuario(rs.getInt("tipoUsuario"));
                usuario.setEmail(rs.getString("email"));
                usuario.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                usuario.setFechaRegistro(rs.getDate("fechaRegistro"));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public List<EntidadVenta> traerComprasId(int idUsuario) {
        ArrayList<EntidadVenta> lista = new ArrayList<>();

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT idVenta, id_usuario, fVenta, total, estadoEntrega FROM venta WHERE id_usuario = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
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

}
