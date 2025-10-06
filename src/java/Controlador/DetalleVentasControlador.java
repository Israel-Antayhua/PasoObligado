package Controlador;

import Modelo.servicios.impl.DVEDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author USUARIO
 */
public class DetalleVentasControlador extends HttpServlet {

    private DVEDAO dveDAO = new DVEDAO();

    private final String pagCarrito = "/Vistas/carrito.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "agregarCarrito":

                agregarCarrito(request, response);

                break;

            case "mostrarCarrito":

                mostrarCarrito(request, response);

                break;

            case "EliminarItem":

                EliminarItem(request, response);

                break;
            default:
                throw new AssertionError();
        }

    }

    protected void agregarCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        int id = Integer.parseInt(request.getParameter("id"));
        int idVenta = Integer.parseInt(request.getParameter("idVenta"));
        int und = Integer.parseInt(request.getParameter("und"));
        request.setAttribute("DVE", dveDAO.crearDetalleVenta(id, idVenta, und));
        
        int n = Herramientas.DatosGlobales.listaDetalle.size();
        double monto = 0;

        for (int j = 1; j <= n; j++) {
            if (!(Herramientas.DatosGlobales.listaDetalle.get(j) == null)) {
                monto = Herramientas.DatosGlobales.listaDetalle.get(j).getMonto() + monto;
            } else {
                n++;
            }
        }
        
        Herramientas.DatosGlobales.setCuenta(monto);

        // Redirige al controlador de inicio
        response.sendRedirect("ProductoControlador?accion=verInicio");
    }

    protected void mostrarCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");
        
        int n = Herramientas.DatosGlobales.listaDetalle.size();
        double monto = 0;

        for (int j = 1; j <= n; j++) {
            if (!(Herramientas.DatosGlobales.listaDetalle.get(j) == null)) {
                monto = Herramientas.DatosGlobales.listaDetalle.get(j).getMonto() + monto;
            } else {
                n++;
            }
        }
        Herramientas.DatosGlobales.setCuenta(monto);
        
        request.setAttribute("listaDetalle", dveDAO.traerEDV());
        request.setAttribute("monto", Herramientas.DatosGlobales.getCuenta());

        request.getRequestDispatcher(pagCarrito).forward(request, response);
    }

    protected void EliminarItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        int id = Integer.parseInt(request.getParameter("id"));

        dveDAO.eliminarCompra(id, Herramientas.DatosGlobales.listaDetalle);

        response.sendRedirect("DetalleVentasControlador?accion=mostrarCarrito");
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
    }// </editor-fold>

}
