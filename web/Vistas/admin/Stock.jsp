

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>El Paso Obligado: Stock</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"> 
        <link rel="stylesheet" href="CSS/styless.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    </head>
    <body>
        <div class="fondo">
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
                        <a class="nav-link" href="AdminControlador?accion=verPedidos">Pedidos</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="AdminControlador?accion=verCrearProducto">Ingresar Producto</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="AdminControlador?accion=verStock">Stock</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="AdminControlador?accion=verReportes">Reportes</a>
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
            <main>
                <!--1era caja-->
                <h1 class="titulo_1">Pollos</h1>

                <div class="row justify-content-center">
                    <c:forEach items="${producto}" var="item" varStatus="status">
                        <c:if test="${item.tipo eq 'pollos'}">
                            <div class="col-md-4">
                                <div class="card product-card h-100">
                                    <c:choose>
                                        <c:when test="${item.stock > 0}">
                                            <a href="AdminControlador?accion=verVistaProducto&id=${item.id}">
                                            </c:when>
                                            <c:otherwise>
                                                <a href="AdminControlador?accion=verVistaProducto&id=${item.id}">
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="Producto">
                                                <!-- Aplicar filtro de grises si stock es 0 -->
                                                <div class="imagen-container">
                                                    <img class="foto ${item.stock == 0 ? 'sin-stock' : ''}" 
                                                         src="${item.urlImagen}" 
                                                         alt="Producto">
                                                    <c:if test="${item.stock == 0}">
                                                        <div class="agotado-overlay">AGOTADO</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <h1>${item.nombre}</h1>
                                            <h2>${item.descripcion}</h2>                 
                                            <h1>S/. ${item.precio}</h1>
                                            <br>
                                        </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                
                
                <!--2 da caja-->   
                <h1 class="titulo_1">Carnes</h1>

                <div class="row justify-content-center">
                    <c:forEach items="${producto}" var="item" varStatus="status">
                        <c:if test="${item.tipo eq 'carnes'}">
                            <div class="col-md-4">
                                <div class="card product-card h-100">
                                    <c:choose>
                                        <c:when test="${item.stock > 0}">
                                            <a href="AdminControlador?accion=verVistaProducto&id=${item.id}">
                                            </c:when>
                                            <c:otherwise>
                                                <a href="AdminControlador?accion=verVistaProducto&id=${item.id}">
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="Producto">
                                                <!-- Aplicar filtro de grises si stock es 0 -->
                                                <div class="imagen-container">
                                                    <img class="foto ${item.stock == 0 ? 'sin-stock' : ''}" 
                                                         src="${item.urlImagen}" 
                                                         alt="Producto">
                                                    <c:if test="${item.stock == 0}">
                                                        <div class="agotado-overlay">AGOTADO</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <h2>${item.nombre}</h2>
                                            <h4>${item.descripcion}</h4>
                                            <h1>S/. ${item.precio}</h1>
                                            <br>
                                        </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </main>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="main.js"></script>
    </body>
</html>
