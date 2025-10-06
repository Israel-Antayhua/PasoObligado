package Controlador;

import Herramientas.Conexion;
import Modelo.clases.EntidadUsuarios;
import Modelo.clases.EntidadVenta;
import Modelo.servicios.impl.UsuariosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UsuariosControlador extends HttpServlet {

    private UsuariosDAO sa = new UsuariosDAO(Conexion.getConnection());

    private EntidadUsuarios usuario = new EntidadUsuarios();

    private final String pagLogin = "/Vistas/login.jsp";
    private final String pagRegistro = "/Vistas/registro.jsp";
    private final String pagPerfil = "/Vistas/Perfil/perfil.jsp";
    private final String pagPerfilAdmin = "/Vistas/perfilAdmin.jsp";
    private final String pagModificarPerfil = "/Vistas/Perfil/modificarPerfil.jsp";
    private final String pagCompras = "/Vistas/Perfil/compras.jsp";
    private final String pagDirecciones = "/Vistas/Perfil/direcciones.jsp";
    private final String pagPrivacidad = "/Vistas/Perfil/privacidad.jsp";
    private final String pagSeguridad = "/Vistas/Perfil/seguridad.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "verLogin":

                verLogin(request, response);

                break;

            case "verRegistro":

                verRegistro(request, response);

                break;

            case "insertarUsuario":

                insertarUsuario(request, response);

                break;

            case "login":

                login(request, response);

                break;

            case "verPerfil":

                verPerfil(request, response);

                break;

            case "modificarPerfil":

                modificarPerfil(request, response);

                break;

            case "verCompras":

                verCompras(request, response);

                break;

            case "verPrivacidad":

                verPrivacidad(request, response);

                break;
            case "verSeguridad":

                verSeguridad(request, response);

                break;

            case "verDirecciones":

                verDirecciones(request, response);

                break;

            case "guardarCambiosUsuario":

                guardarCambiosUsuario(request, response);

                break;

            case "actualizarContraseña":

                actualizarContraseña(request, response);

                break;

            case "verMisPedidos":
                verMisPedidos(request, response);
                break;

            case "cerrarSesion":
                request.getSession().invalidate();
                response.sendRedirect("index.jsp");

                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }

    }

    //muestra el jsp de login
    protected void verLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagLogin).forward(request, response);
    }

    //muestra el jsp de registro
    protected void verRegistro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagRegistro).forward(request, response);
    }

    // Validación de login
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorLogin", "Todos los campos son obligatorios.");
            request.getRequestDispatcher(pagLogin).forward(request, response);
            return;
        }

        EntidadUsuarios usuario = sa.obtenerPorCredenciales(username, password);  
        Herramientas.DatosGlobales.setUsuario(usuario);

        if (usuario != null) {
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("usuarioLogueado", usuario);
            response.sendRedirect("index.jsp");

        } else {
            request.setAttribute("errorLogin", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher(pagLogin).forward(request, response);
        }
    }

    //VER PERFIL
    protected void verPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession sesion = request.getSession(false);

        if (sesion == null || sesion.getAttribute("usuarioLogueado") == null) {
            // Usuario no ha iniciado sesión, redirigir al login
            response.sendRedirect(pagLogin);
            return;
        }

        EntidadUsuarios usuario = (EntidadUsuarios) sesion.getAttribute("usuarioLogueado");
        if (usuario.getTipoUsuario() == 0) {
            request.getRequestDispatcher(pagPerfilAdmin).forward(request, response);

        } else {
            request.getRequestDispatcher(pagPerfil).forward(request, response);
        }

    }

    protected void modificarPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagModificarPerfil).forward(request, response);
    }

    protected void verCompras(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        verMisPedidos(request, response);
    }

    protected void verDirecciones(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagDirecciones).forward(request, response);
    }

    protected void verPrivacidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagPrivacidad).forward(request, response);
    }

    protected void verSeguridad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagSeguridad).forward(request, response);
    }

    //inserta usuario a la base de datos
    protected void insertarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fechaNacimientoStr = request.getParameter("fechaNacimiento");  // Recibir fecha en formato yyyy-MM-dd

        if (username == null || password == null || email == null || fechaNacimientoStr == null
                || username.isEmpty() || password.isEmpty() || email.isEmpty() || fechaNacimientoStr.isEmpty()) {
            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher(pagRegistro).forward(request, response);
            return;
        }

        try {
            java.util.Date fechaNacimiento = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimientoStr);

            EntidadUsuarios nuevoUsuario = new EntidadUsuarios();
            nuevoUsuario.setUsername(username);
            nuevoUsuario.setPassword(password);
            nuevoUsuario.setEmail(email);
            nuevoUsuario.setFechaNacimiento(fechaNacimiento);
            nuevoUsuario.setFechaRegistro(new java.util.Date()); // Fecha actual

            boolean exito = sa.insertarUsuario(nuevoUsuario);

            if (exito) {
                response.sendRedirect("UsuariosControlador?accion=verLogin&registro=exito");
            } else {
                request.setAttribute("error", "Error al registrar el usuario. Intente nuevamente.");
                request.getRequestDispatcher(pagRegistro).forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al procesar la fecha de nacimiento.");
            request.getRequestDispatcher(pagRegistro).forward(request, response);
        }
    }

    protected void guardarCambiosUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("idUsuario"));
        String nuevoNombre = request.getParameter("nuevoNombre");
        String nuevoEmail = request.getParameter("nuevoEmail");

        EntidadUsuarios usuario = sa.obtenerUsuarioPorId(id); // Este método debe existir

        if (usuario == null) {
            request.setAttribute("error", "No se encontró el usuario.");
            request.getRequestDispatcher("/Vistas/Perfil/modificarPerfil.jsp").forward(request, response);
            return;
        }
        usuario.setUsername(nuevoNombre);
        usuario.setEmail(nuevoEmail);

        boolean exito = sa.actualizarUsuario(usuario); // Este método hace el UPDATE

        if (exito) {
            request.getSession().setAttribute("usuarioLogueado", usuario);
            response.sendRedirect("UsuariosControlador?accion=verPerfil");
        } else {
            request.setAttribute("error", "No se pudo actualizar tu perfil.");
            request.getRequestDispatcher("/Vistas/Perfil/modificarPerfil.jsp").forward(request, response);
        }

    }

    protected void actualizarContraseña(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuarioLogueado") == null) {
            response.sendRedirect("UsuariosControlador?accion=verLogin");
            return;
        }

        EntidadUsuarios usuarioSesion = (EntidadUsuarios) sesion.getAttribute("usuarioLogueado");
        int idUsuario = usuarioSesion.getIdUsuario();

        String actual = request.getParameter("contrasenaActual");
        String nueva = request.getParameter("nuevaContrasena");
        String repetir = request.getParameter("repetirContrasena");

        // Recuperar el usuario real desde la BD (más seguro)
        EntidadUsuarios usuarioBD = sa.obtenerUsuarioPorId(idUsuario);

        if (usuarioBD == null) {
            request.setAttribute("error", "Usuario no encontrado.");
            request.getRequestDispatcher("/Vistas/Perfil/seguridad.jsp").forward(request, response);
            return;
        }

        // Verificar contraseña actual
        if (!usuarioBD.getPassword().equals(actual)) {
            request.setAttribute("error", "Contraseña actual incorrecta.");
            request.getRequestDispatcher("/Vistas/Perfil/seguridad.jsp").forward(request, response);
            return;
        }

        // Verificar coincidencia nueva
        if (!nueva.equals(repetir)) {
            request.setAttribute("error", "Las nuevas contraseñas no coinciden.");
            request.getRequestDispatcher("/Vistas/Perfil/seguridad.jsp").forward(request, response);
            return;
        }

        // Actualizar contraseña
        usuarioBD.setPassword(nueva);
        boolean exito = sa.actualizarContraseña(usuarioBD);

        if (exito) {
            sesion.setAttribute("usuarioLogueado", usuarioBD); // actualizar en sesión también
            response.sendRedirect("UsuariosControlador?accion=seguridad");
        } else {
            request.setAttribute("error", "Hubo un error al actualizar la contraseña.");
            request.getRequestDispatcher("/Vistas/Perfil/seguridad.jsp").forward(request, response);
        }
    }

    // VERCOMPRAS //
    protected void verMisPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuarioLogueado") == null) {
            response.sendRedirect("UsuariosControlador?accion=verLogin");
            return;
        }

        EntidadUsuarios usuario = (EntidadUsuarios) sesion.getAttribute("usuarioLogueado");

        List<EntidadVenta> lista = sa.traerComprasId(usuario.getIdUsuario());

        request.setAttribute("misPedidos", lista);
        request.getRequestDispatcher(pagCompras).forward(request, response);
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
