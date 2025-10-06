package Controlador;

import Modelo.clases.EntidadDVF;
import Modelo.servicios.impl.DVFDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "VentaControlador", urlPatterns = {"/VentaControlador"})
public class VentaControlador extends HttpServlet {

    DVFDAO dvfdao = new DVFDAO();

    int n = Herramientas.DatosGlobales.listaDetalle.size();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "FinalizarVenta":

                FinalizarVenta(request, response);

                break;

            case "pagar":

                pasarelaPagos(request, response);

                break;
            default:
                throw new AssertionError();
        }

    }

    protected void FinalizarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        double monto = Herramientas.DatosGlobales.getCuenta();

        dvfdao.guardarVenta(Herramientas.DatosGlobales.getUsuario().getIdUsuario(), Herramientas.DatosGlobales.getFecha(), monto);

        int idVenta = dvfdao.idVenta();

        for (int j = 1; j <= n; j++) { //ESTA MANERA HACE QUE SE SE PUEDA EXTRAER EN ORDEN TODOS LOS CODIGOS DE VENTA

            if (!(Herramientas.DatosGlobales.listaDetalle.get(j) == null)) {
                EntidadDVF eDVF = new EntidadDVF();
                eDVF.setIdProducto(Herramientas.DatosGlobales.listaDetalle.get(j).getIdProducto());
                eDVF.setCantidad(Herramientas.DatosGlobales.listaDetalle.get(j).getUnidades());
                eDVF.setSubtotal(Herramientas.DatosGlobales.listaDetalle.get(j).getMonto());
                eDVF.setIdVenta(idVenta);
                dvfdao.guradarDetalleVenta(eDVF);
                dvfdao.actualizarStock(Herramientas.DatosGlobales.listaDetalle.get(j).getIdProducto(), Herramientas.DatosGlobales.listaDetalle.get(j).getUnidades());

            } else {
                n++;
            }
        }

        Herramientas.DatosGlobales.listaDetalle.clear();
        Herramientas.DatosGlobales.setnDetalle(0);

        // Redirige al controlador de inicio
        response.sendRedirect("ProductoControlador?accion=verInicio");

    }

    protected void pasarelaPagos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");
        
        if (Herramientas.DatosGlobales.getUsuario() == null) {
            response.sendRedirect("UsuariosControlador?accion=verLogin");
            return;
        }

//        double monto = Double.parseDouble(request.getParameter("monto"));
        request.setAttribute("monto", Herramientas.DatosGlobales.getCuenta());
        request.setAttribute("usuario", Herramientas.DatosGlobales.getUsuario());
        request.getRequestDispatcher("/Vistas/pago.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
