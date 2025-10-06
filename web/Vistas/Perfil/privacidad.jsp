<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Privacidad</title>
        <link rel="stylesheet" href="CSS/perfilUsuario.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
            <section class="privacy-settings">

                <h2>Privacidad y Seguridad</h2>
                <div class="privacy-card">
                    <img alt="list-thumbnail-image" aria-hidden="true" class="items-list__img-url item-list--manage-privacy-permissions" src="https://http2.mlstatic.com/frontend-assets/personal-data-frontend/image-icon-manage-privacy-permissions-yellowblue_light.svg">
                    <div class="privacy-text">
                    <h3>Permisos</h3>
                    <p>Permisos brindados correctamente.</p>
                    </div>
                </div>

                <div class="privacy-card">
                    <img alt="list-thumbnail-image" aria-hidden="true" class="items-list__img-url item-list--request-report" src="https://http2.mlstatic.com/frontend-assets/personal-data-frontend/image-icon-request-report-yellowblue_light.svg">
                    <div class="privacy-text">
                    <h3>Datos</h3>
                    <p>Tu información personal está segura y protegida.</p>
                    </div>
                </div>

                <div class="privacy-card">
                    <img alt="list-thumbnail-image" aria-hidden="true" class="items-list__img-url item-list--manage-cookies" src="https://http2.mlstatic.com/frontend-assets/personal-data-frontend/image-icon-manage-cookies-yellowblue_light.svg">
                    <div class="privacy-text">
                    <h3>Cookies</h3>
                    <p>Preferencias de cookies configuradas con éxito.</p>
                    </div>
                </div>

                <div class="privacy-card">
                    <img alt="list-thumbnail-image" aria-hidden="true" class="items-list__img-url item-list--cancel-account" src="https://http2.mlstatic.com/frontend-assets/personal-data-frontend/image-icon-cancel-account-yellowblue_light.svg">
                    <div class="privacy-text">
                    <h3>Cuenta</h3>
                    <p>No hay solicitudes activas para eliminar tu cuenta.</p>
                    </div>
                </div>
            </section>
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
    </body>
</html>
