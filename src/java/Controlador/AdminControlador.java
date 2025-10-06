package Controlador;

import jakarta.servlet.annotation.WebServlet;
import Herramientas.Conexion;
import Modelo.clases.EntidadProducto;
import Modelo.clases.EntidadVenta;
import Modelo.servicios.impl.AdminDAO;
import Modelo.servicios.impl.DVFDAO;
import Modelo.servicios.impl.ProductoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author Pc-03
 */
public class AdminControlador extends HttpServlet {

    private ProductoDAO proDAO = new ProductoDAO();
    private AdminDAO provDAO = new AdminDAO();

    private final String pagCrearProducto = "/Vistas/admin/CrearProducto.jsp";
    private final String pagStock = "/Vistas/admin/Stock.jsp";
    private final String pagPedidos = "/Vistas/admin/Pedidos.jsp";
    private final String pagConfiguracion = "/Vistas/admin/Configuracion.jsp";
    private final String pagUsuarios = "/Vistas/admin/Usuarios.jsp";
    private final String pagReportes = "/Vistas/admin/Reportes.jsp";
    private final String pagProducto = "/Vistas/admin/adminVistaProducto.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charsetUTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "verCrearProducto":

                verCrearProducto(request, response);

                break;

            case "verStock":

                verStock(request, response);

                break;

            case "verPedidos":

                verPedidos(request, response);

                break;

            case "verConfiguracion":

                verConfiguracion(request, response);

                break;

            case "verUsuarios":

                verUsuarios(request, response);

                break;

            case "verReportes":

                verReportes(request, response);

                break;

            case "filtrarPorFecha":

                filtrarPorFecha(request, response);

                break;

            case "verVistaProducto":

                verVistaProducto(request, response);

                break;

            case "actualizarProducto":
                actualizarProducto(request, response);
                break;

            case "cambiarEstado":
                cambiarEstado(request, response);
                break;

            case "cerrarSesion":
                request.getSession().invalidate();
                Herramientas.DatosGlobales.setUsuario(null);
                response.sendRedirect("index.jsp");

                break;

            default:
                throw new AssertionError();
        }

    }

    //muestra el jsp de crearProducto
    protected void verCrearProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("proveedor", provDAO.traerProveedor());

        request.getRequestDispatcher(pagCrearProducto).forward(request, response);
    }

    //muestra el jsp de stock
    protected void verStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("producto", proDAO.traerProducto());

        request.getRequestDispatcher(pagStock).forward(request, response);
    }
    //muestra el jsp de pedidos

    protected void verPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("pedidos", provDAO.traerVentas());

        request.getRequestDispatcher(pagPedidos).forward(request, response);
    }

    //muestra el jsp de configuracion
    protected void verConfiguracion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagConfiguracion).forward(request, response);
    }

    //muestra el jsp de usuarios
    protected void verUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagUsuarios).forward(request, response);
    }

    protected void verReportes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Obtener parámetros de fecha (pueden ser nulos)
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        List<EntidadVenta> ventasFiltradas;

        if (fechaInicio != null && fechaFin != null && !fechaInicio.isEmpty() && !fechaFin.isEmpty()) {
            // Obtener ventas por fecha desde el DAO
            ventasFiltradas = provDAO.obtenerVentasEntreFechas(fechaInicio, fechaFin);
        } else {
            // Si no hay filtro, trae todas las ventas
            ventasFiltradas = provDAO.traerVentas();
        }

        // 🔁 Cambiar agrupación por mes por lista filtrada
        request.setAttribute("ventasFiltradas", ventasFiltradas);

        // Lo demás igual
        request.setAttribute("producto", proDAO.traerProducto());
        request.setAttribute("pedidos", provDAO.traerVentas());
        request.setAttribute("entradas", provDAO.traerEntradas());

        request.getRequestDispatcher(pagReportes).forward(request, response);
    }

    //muestra el jsp de verVistaProducto
    protected void verVistaProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UFT-8");

        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("producto", proDAO.verProducto(id));
        request.getRequestDispatcher(pagProducto).forward(request, response);
    }

    //METODOS
    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        double nuevoPrecio = Double.parseDouble(request.getParameter("precio"));
        int nuevoStock = Integer.parseInt(request.getParameter("stock"));
        int vista = Integer.parseInt(request.getParameter("vista"));

        AdminDAO adminDAO = new AdminDAO(Conexion.getConnection());

        adminDAO.editarPrecio(id, nuevoPrecio);
        adminDAO.actualizarStock(id, nuevoStock);
        adminDAO.editarVista(id, vista);

        EntidadProducto productoActualizado = proDAO.verProducto(id);
        request.setAttribute("producto", productoActualizado);
        request.getRequestDispatcher("/Vistas/admin/adminVistaProducto.jsp").forward(request, response);
    }

    protected void cambiarEstado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int idPedido = Integer.parseInt(request.getParameter("id"));
            int nuevoEstado = Integer.parseInt(request.getParameter("estado"));

            // Llamar a tu DAO para actualizar
            boolean actualizado = provDAO.actualizarEstadoVenta(idPedido, nuevoEstado);

            if (actualizado) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error");
            }
        } catch (Exception e) {
            response.getWriter().write("error");
        }
    }

    protected void filtrarPorFecha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        // Llama a tu DAO para filtrar por fechas
        List<EntidadVenta> ventasFiltradas = provDAO.obtenerVentasEntreFechas(fechaInicio, fechaFin);

        request.setAttribute("ventasFiltradas", ventasFiltradas);
        request.setAttribute("producto", proDAO.traerProducto());
        request.setAttribute("pedidos", provDAO.traerVentas());
        request.setAttribute("entradas", provDAO.traerEntradas());
        request.getRequestDispatcher(pagReportes).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";

    }
}
