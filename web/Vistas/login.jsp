<%-- 
    Document   : usuarios
    Created on : 24 may. 2025, 3:38:54 p. m.
    Author     : Pc-03
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" >
        <title> El Paso Obligado - Restauramte de Carnes</title>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="CSS/usuariosEstilos.css">
    </head>
    <body>
        
        <!----Encabezado---->   
        <header class="py-4">
            <div class="container d-flex justify-content-between align-items-center">
                
                <!-- Texto -->
                <div>
                    <h1 class="display-4">El Paso Obligado</h1>
                    <p class="lead"><i>LO MEJOR EN CARNES Y POLLOS A LA LEÑA!</i></p>
                </div>

                <!-- Imagen -->
                <div class="wrapper">
                    <img src="MULTIMEDIA/INTERFACE/Logo.jpg" alt="Logo" style="max-width: 300px;">
                </div>
            </div>
        </header>
        

        <!----Formulario para iniciar sesion---->   
        <div class="create-account">
            <div class="login-container">

                <h1>Iniciar Sesión</h1>
                
                <form action="UsuariosControlador" method="post">
                    <input type="hidden" name="accion" value="login">
                    <input type="text" name="username" placeholder="Usuario" required>
                    <input type="password" name="password" placeholder="Contraseña" required>
                    <input type="submit" value="Iniciar Sesión">
                </form>

                <p><a href="UsuariosControlador?accion=verRegistro">¿No tienes cuenta? Regístrate aquí</a></p>

                <c:if test="${not empty errorLogin}">
                    <div class="error-message">${errorLogin}</div>
                </c:if>

            </div>
        </div> 
        
        <!--Pie de Página-->
        <footer class="mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <h3>Compañia</h3>

                        <li><a href="/NEOTEC/hrefs_footer/Nosotros.jsp">Nosotros</a></li>
                        <li><a href="/NEOTEC/hrefs_footer/Servicios.html">Servicios</a></li>
                        <li><a href="/NEOTEC/hrefs_footer/PoliticadePrivacidad.html">Politica de privacidad</a></li>
                        <li><a href="/NEOTEC/hrefs_footer/Calificanos.html">Ubicación</a></li>
                    </div>
                    <div class="col-md-3">
                        <h3>Ayuda</h3>
                        <p>Teléfono: (964-530-729)</p>
                        <p>Email: (pasobligaolima@gmail.com)</p>
                    </div>
                    <div class="col-md-3">
                        <h3>Horario</h3>
                        <p>Todos los dias 12:00 pm - 23:00 pm</p>
                    </div>
                    <div class="col-md-3">
                        <h3>Síguenos</h3>
                        <a href="https://www.facebook.com/ElPasoObligadoPeru?locale=es_LA" class="btn btn-outline-dark me-2"><i class="bi bi-facebook"></i></a>
                        <a href="https://www.instagram.com/elpasoobligadoperu" class="btn btn-outline-dark me-2"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="btn btn-outline-dark me-2"><i class="bi bi-twitter"></i></a>
                    </div>
                </div>
                <hr>
                <p class="text-center"><small>© 2023 El Paso Obligado - Todos los derechos reservados</small></p>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="main.js"></script>
    </body>
</html>

