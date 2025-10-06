package Controlador;

import Modelo.clases.EntidadEntradaProducto;
import Modelo.clases.EntidadProducto;
import Modelo.clases.EntidadProveedor;
import Modelo.servicios.impl.AdminDAO;
import Modelo.servicios.impl.DVEDAO;
import Modelo.servicios.impl.ProductoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class ProductoControlador extends HttpServlet {

    private ProductoDAO proDAO = new ProductoDAO();
    private final String pagInicio = "/Vistas/index.jsp";
    private final String pagPollos = "/Vistas/pollos.jsp";
    private final String pagCarnes = "/Vistas/carnes.jsp";
    private final String pagProducto = "/Vistas/vistaProducto.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        switch (accion) {
            case "verInicio":
                verInicio(request, response);
                break;
            case "verPollos":
                verPollos(request, response);
                break;
            case "verCarnes":
                verCarnes(request, response);
                break;
            case "verProducto":
                verProducto(request, response);
                break;

            case "crearProducto":
                crearProducto(request, response);
                break;

            case "crearProveedor":
                crearProveedor(request, response);
                break;
            default:

                throw new AssertionError();
        }
    }

    protected void verInicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        request.setAttribute("pollos", proDAO.traerPollos());
        request.setAttribute("carnes", proDAO.traerCarnes());

        request.getRequestDispatcher(pagInicio).forward(request, response);

    }

    protected void verPollos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        request.setAttribute("productos", proDAO.traerPollos());
        request.getRequestDispatcher(pagPollos).forward(request, response);

    }

    protected void verCarnes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        request.setAttribute("productos", proDAO.traerCarnes());
        request.getRequestDispatcher(pagCarnes).forward(request, response);

    }

    protected void verProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UFT-8");

        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("producto", proDAO.verProducto(id));
        request.getRequestDispatcher(pagProducto).forward(request, response);

    }

    protected void crearProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            EntidadProducto producto = new EntidadProducto();

            producto.setVista(Integer.parseInt(request.getParameter("vista")));
            producto.setNombre(request.getParameter("nombreProducto"));
            producto.setDescripcion(request.getParameter("descripcion"));
            producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
            producto.setStock(Integer.parseInt(request.getParameter("stock")));
            producto.setId_entrada(1);
            producto.setUrlImagen(request.getParameter("urlImagen"));
            producto.setTipo(request.getParameter("tipo"));

            // 4. Llamar al DAO
            boolean resultado1 = new AdminDAO().agregarProducto(producto);

            if (resultado1) {

                int id = new ProductoDAO().idProducto();

                EntidadEntradaProducto eep = new EntidadEntradaProducto();

                eep.setCantida(Integer.parseInt(request.getParameter("stock")));
                eep.setCosto(Double.parseDouble(request.getParameter("costo")));
                eep.setFecha(new java.util.Date());
                eep.setFactura(request.getParameter("factura"));
                eep.setId_Producto(id);
                eep.setId_Proveedor(Integer.parseInt(request.getParameter("idProveedor")));

                boolean resultado2 = new AdminDAO().insertarEntradaProducto(eep);

                // 5. Redireccionar
                if (resultado2) {

                    int idVenta = new ProductoDAO().idEntrada();
                    boolean resultado3 = new AdminDAO().actualizaridVenta(id, idVenta);
                    if(resultado3){
                        response.sendRedirect("Vistas/exito.jsp?mensaje=Producto creado&id=" + id);
                    }else{
                        response.sendRedirect("Vistas/error.jsp?mensaje=Error en la creación del producto");
                    }
                    
                } else {
                    response.sendRedirect("Vistas/error.jsp?mensaje=Error en base de datos entrada");
                }
            } else {
                response.sendRedirect("Vistas/error.jsp?mensaje=Error en base de datos en producto");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("Vistas/error.jsp?mensaje=Formato numérico inválido");
        } catch (Exception e) {
            response.sendRedirect("Vistas/error.jsp?mensaje=Error interno: " + URLEncoder.encode(e.getMessage(), "UTF-8"));
        }
    }

    protected void crearProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {

            EntidadProveedor proveedor = new EntidadProveedor();
            proveedor.setNombre(request.getParameter("nombreProveedor"));
            proveedor.setCorreo(request.getParameter("correo"));
            proveedor.setTelefono(request.getParameter("telefono"));
            proveedor.setRuc(request.getParameter("ruc"));
            proveedor.setDireccion(request.getParameter("direccion"));

            // Llamar al DAO
            boolean resultado = new AdminDAO().insertarProveedor(proveedor);

            // 5. Redireccionar
            if (resultado) {
                response.sendRedirect("Vistas/exitoProveedor.jsp?mensaje=Nuevo proveedor agregado &id=" + proveedor.getNombre());
            } else {
                response.sendRedirect("Vistas/error.jsp?mensaje=Error en base de datos");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("Vistas/error.jsp?mensaje=Formato numérico inválido");
        } catch (Exception e) {
            response.sendRedirect("Vistas/error.jsp?mensaje=Error interno: " + URLEncoder.encode(e.getMessage(), "UTF-8"));
        }
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
