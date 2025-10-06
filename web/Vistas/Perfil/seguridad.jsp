<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mis Datos</title>
        <link rel="stylesheet" href="CSS/perfilUsuario.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
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

        <!----Navegador---->   
        <nav class="navbar navbar-expand-lg navbar-orange navbar-custom mb-4">
            <div class="container">
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Inicio</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="productosDropdown" role="button" data-bs-toggle="dropdown">
                      Productos
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="ProductoControlador?accion=verPollos">Pollos</a></li>
                      <li><a class="dropdown-item" href="ProductoControlador?accion=verCarnes">Carnes</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Carta</a>
                  </li>
                </ul>

                <!-- Buscador 
                <form class="d-flex ms-3" role="search" action="BuscarControlador" method="GET">
                  <input class="form-control me-2" type="search" name="buscar" placeholder="¿Qué está buscando?" />
                  <button class="btn btn-outline-light" type="submit">Buscar</button>
                </form>
-->
                <!-- Iconos de usuario y carrito -->
                <div class="ms-auto d-flex align-items-center">
                  <a href="DetalleVentasControlador?accion=mostrarCarrito" class="btn btn-outline-primary position-relative me-3">
                    <i class="bi bi-cart4"></i> Carrito
                  </a>

                  <c:choose>
                    <c:when test="${not empty sessionScope.usuarioLogueado}">
                      <div class="dropdown">
                        <button class="btn btn-outline-danger dropdown-toggle" type="button" data-bs-toggle="dropdown">
                          <i class="bi bi-person-circle"></i> Usuario
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                          <li><a class="dropdown-item" href="UsuariosControlador?accion=verPerfil">Ver Perfil</a></li>
                          <li><a class="dropdown-item" href="UsuariosControlador?accion=cerrarSesion">Cerrar Sesión</a></li>
                        </ul>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <a href="UsuariosControlador?accion=verLogin" class="btn btn-outline-danger">
                        <i class="bi bi-person-circle"></i> Iniciar Sesión
                      </a>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
        </nav>


        <!----Contenido---->   
        <main class="main-content">
            <div class="perfil-container datos-usuario">
                <h2 style="text-align:center;">Seguridad de tu cuenta</h2>

                <!-- Contraseña (solo visible como asteriscos) -->
                <div class="dato-item">
                    <span class="dato-label">Contraseña:</span>
                    <input type="password" value="********" readonly class="dato-valor" />
                    <button onclick="abrirModal()">Modificar</button>
                </div>
            </div>

            <!-- MODAL -->
            <div id="modalContrasena" class="modal-overlay" style="display: none;">
                <div class="modal-content">
                    <h3>Modificar Contraseña</h3>
                    <form action="UsuariosControlador?accion=actualizarContraseña" method="post">
                        <!-- Campo oculto para comparación -->
                        <input type="hidden" id="contrasenaRegistrada" value="${sessionScope.usuarioLogueado.password}">
                        <input type="hidden" name="idUsuario" value="${sessionScope.usuarioLogueado.idUsuario}" />

                        <!-- Contraseña actual -->
                        <div class="dato-item">
                            <label for="contrasenaActual">Escribe tu contraseña actual:</label>
                            <input type="password" id="contrasenaActual" name="contrasenaActual" required />
                            <button type="button" onclick="verificarContrasenaActual()">Verificar</button>
                        </div>

                        <!-- Nueva contraseña -->
                        <div class="dato-item">
                            <label for="nuevaContrasena">Nueva contraseña:</label>
                            <input type="password" id="nuevaContrasena" name="nuevaContrasena" disabled required />
                        </div>

                        <!-- Repetir contraseña -->
                        <div class="dato-item">
                            <label for="repetirContrasena">Repite la nueva contraseña:</label>
                            <input type="password" id="repetirContrasena" name="repetirContrasena" disabled required />
                            <p id="errorCoincidencia" style="color:red; display:none;">Las contraseñas no coinciden, inténtalo de nuevo.</p>
                        </div>

                        <!-- Botones -->
                        <div style="text-align: center; margin-top: 1rem;">
                            <button type="submit" onclick="return validarCoincidencia()">Guardar</button>
                            <button type="button" onclick="cerrarModal()">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="UsuariosControlador?accion=verPerfil" class="btn btn-outline-secondary">
                  <i class="bi bi-arrow-left-circle"></i> Volver a mi perfil
                </a>
            </div>
        </main>
        

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
        
        <script>
            function abrirModal() {
                document.getElementById("modalContrasena").style.display = "flex";
            }

            function cerrarModal() {
                document.getElementById("modalContrasena").style.display = "none";
                document.getElementById("contrasenaActual").value = "";
                document.getElementById("nuevaContrasena").value = "";
                document.getElementById("repetirContrasena").value = "";
                document.getElementById("nuevaContrasena").disabled = true;
                document.getElementById("repetirContrasena").disabled = true;
                document.getElementById("errorCoincidencia").style.display = "none";
            }

            function verificarContrasenaActual() {
                const actual = document.getElementById("contrasenaActual").value;
                const registrada = document.getElementById("contrasenaRegistrada").value;

                if (actual === registrada) {
                    document.getElementById("nuevaContrasena").disabled = false;
                    document.getElementById("repetirContrasena").disabled = false;
                    document.getElementById("errorCoincidencia").style.display = "none";
                    alert("Contraseña correcta. Puedes ingresar la nueva.");
                } else {
                    alert("Contraseña actual incorrecta.");
                }
            }

            function validarCoincidencia() {
                const nueva = document.getElementById("nuevaContrasena").value;
                const repetir = document.getElementById("repetirContrasena").value;

                if (nueva !== repetir) {
                    document.getElementById("errorCoincidencia").style.display = "block";
                    return false; // evita que se envíe el form
                }

                return true; // permite enviar
            }
        </script>
    </body>
</html>
