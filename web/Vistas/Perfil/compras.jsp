<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Compras</title>
        <link rel="stylesheet" href="CSS/styless.css">
        <link rel="stylesheet" href="CSS/pedidos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <style>
            .table-container {
                margin: 20px;
            }
            .table-header {
                background-color: #343a40;
                color: white;
            }
            .total-cell {
                font-weight: bold;
                color: #28a745;
            }
        </style>
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
            
            <!----navedador---->   
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
            <main>
                <div class="container-fluid table-container">
                    <h2 class="text-center mb-4">Mis Compras</h2>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead class="table-header">
                                <tr>
                                    <th>ID Pedido</th>
                                    <th>Fecha</th>
                                    <th>Total</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="pedido" items="${misPedidos}">
                                    <tr>
                                        <td>${pedido.id}</td>
                                        <td>${pedido.fecha}</td>
                                        <td class="total-cell">S/. ${pedido.totalFinal}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${pedido.estadoEntrega == 1}">
                                                    <span class="badge bg-success">Entregado</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger">No entregado</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a href="UsuariosControlador?accion=verPerfil" class="btn btn-outline-secondary">
                      <i class="bi bi-arrow-left-circle"></i> Volver a mi perfil
                    </a>
                </div>


                
            </main>

    </body>
</html> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

