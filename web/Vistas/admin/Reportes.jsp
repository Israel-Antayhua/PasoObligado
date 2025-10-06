<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes</title>
        <link rel="stylesheet" href="CSS/header.css">
        <link rel="stylesheet" href="CSS/styless.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            html {
                scroll-behavior: smooth;
            }
            body{
                padding-top: 20px;
                background-color: white;
            }
            .report-section {
                margin-bottom: 40px;
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .section-title {
                color: #2c3e50;
                border-bottom: 2px solid #3498db;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            .table-responsive {
                margin-top: 15px;
            }
            .table th {
                background-color: #3498db;
                color: white;
            }
            .total-cell {
                font-weight: bold;
                color: #28a745;
            }
            .badge {
                font-size: 0.9em;
                padding: 5px 10px;
            }

            .stock-cell {
                font-weight: bold;
                text-align: center;
            }

            .stock-bajo {
                background-color: #FFA500; /* Naranja */
                color: white;
                animation: pulse-warning 2s infinite;
            }

            .stock-cero {
                background-color: #FF0000; /* Rojo */
                color: white;
                animation: pulse-danger 2s infinite;
            }

            @keyframes pulse-warning {
                0% {
                    background-color: #FFA500;
                }
                50% {
                    background-color: #FFC04D;
                }
                100% {
                    background-color: #FFA500;
                }
            }

            @keyframes pulse-danger {
                0% {
                    background-color: #FF0000;
                }
                50% {
                    background-color: #FF4D4D;
                }
                100% {
                    background-color: #FF0000;
                }
            }
            .stock-cell {
                text-align: center;
                vertical-align: middle;
            }

            .badge {
                padding: 5px 10px;
                border-radius: 15px;
                font-size: 0.85rem;
            }

            .bg-danger {
                background-color: #dc3545 !important;
            }

            .bg-warning {
                background-color: #ffc107 !important;
            }

            .fas {
                margin-right: 5px;
            }
            .month-header {
                background-color: #2c3e50;
                color: white;
                font-weight: bold;
                cursor: pointer;
            }
            .month-header:hover {
                background-color: #1a252f;
            }
            .month-total {
                background-color: #f8f9fa;
                font-weight: bold;
            }
            .table-hover tbody tr:hover {
                background-color: rgba(0, 123, 255, 0.1);
            }
            .badge {
                font-size: 0.85em;
                padding: 5px 10px;
            }
            .total-cell {
                font-weight: 600;
                color: #28a745;
            }
            .month-details {
                display: none;
            }
            .collapsed .bi-chevron-down {
                display: none;
            }
            .collapsed .bi-chevron-up {
                display: inline-block;
            }
            .not-collapsed .bi-chevron-down {
                display: inline-block;
            }
            .not-collapsed .bi-chevron-up {
                display: none;
            }
            .group-header {
                font-weight: bold;
                cursor: default;
                text-align: center; /* Centrado horizontal */
                vertical-align: middle; /* Centrado vertical */
                height: 50px; /* Altura aumentada para mejor visualización */
                font-size: 1.1em; /* Tamaño de fuente ligeramente mayor */
                letter-spacing: 1px; /* Espaciado entre letras */
            }

            .group-header i {
                font-size: 1.2em;
                margin-right: 10px; /* Más espacio entre el icono y el texto */
            }

            .bg-primary {
                background-color: #0d6efd !important;
                background: linear-gradient(135deg, #0d6efd, #0b5ed7) !important; /* Degradado para mejor apariencia */
            }

            .bg-info {
                background-color: #0dcaf0 !important;
                background: linear-gradient(135deg, #0dcaf0, #0ba8c8) !important; /* Degradado para mejor apariencia */
            }

            /* Efecto hover sutil para los encabezados */
            .group-header:hover {
                opacity: 0.95;
                transition: opacity 0.3s ease;
            }
            .custom-pill {
                border: 1px solid #0d6efd;
                color: #0d6efd;
                background-color: white;
                border-radius: 25px;
                padding: 8px 16px;
                transition: all 0.3s ease-in-out;
                font-weight: 500;
            }

            .custom-pill:hover,
            .custom-pill:focus {
                background-color: #0d6efd;
                color: white;
                text-decoration: none;
                transform: scale(1.05);
            }
            #btnSubir {
                position: fixed;
                bottom: 30px;
                right: 30px;
                z-index: 999;
                display: none;
                width: 45px;
                height: 45px;
                font-size: 18px;
                align-items: center;
                justify-content: center;
                display: flex;
                transition: opacity 0.3s ease;
            }
        </style>
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
        <div class="container mt-4">
            <h1 class="text-center mb-4">Reportes Generales</h1>

            <div class="mb-4 text-center">
                <div class="bg-light p-3 rounded shadow-sm d-inline-block">
                    <nav class="nav nav-pills justify-content-center flex-wrap gap-2">
                        <a class="nav-link custom-pill" href="#ventas">Ventas por Mes</a>
                        <a class="nav-link custom-pill" href="#entradas">Entradas de Productos</a>
                        <%-- <a class="nav-link custom-pill" href="#resumen">Resumen Financiero</a> --%>
                        <a class="nav-link custom-pill" href="#productos">Productos</a>
                    </nav>
                </div>
            </div>


            <!-- Reporte de Ventas por Rango de Fechas -->
            <div id="ventas" class="report-section">
                <h2 class="section-title">Reporte de Ventas por Rango de Fechas</h2>

                <!-- Formulario de filtro -->
                <form method="get" action="AdminControlador" class="mb-4">
                    <input type="hidden" name="accion" value="verReportes" />
                    <div class="row">
                        <div class="col-md-4">
                            <label for="fechaInicio" class="form-label">Desde:</label>
                            <input type="date" id="fechaInicio" name="fechaInicio" class="form-control" value="${param.fechaInicio}" required>
                        </div>
                        <div class="col-md-4">
                            <label for="fechaFin" class="form-label">Hasta:</label>
                            <input type="date" id="fechaFin" name="fechaFin" class="form-control" value="${param.fechaFin}" required>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">Filtrar Ventas</button>
                        </div>
                    </div>
                </form>

                <!-- Tabla de ventas -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID Venta</th>
                                <th>Fecha</th>
                                <th>ID Usuario</th>
                                <th>Total</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="totalFiltrado" value="0" />
                            <c:forEach items="${ventasFiltradas}" var="venta">
                                <tr>
                                    <td>${venta.id}</td>
                                    <td>${venta.fecha}</td>
                                    <td>${venta.idUsuario}</td>
                                    <td>S/. <fmt:formatNumber value="${venta.totalFinal}" maxFractionDigits="2" /></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${venta.estadoEntrega == 1}">
                                                <span class="badge bg-success">Entregado</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning text-dark">Pendiente</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <c:set var="totalFiltrado" value="${totalFiltrado + venta.totalFinal}" />
                            </c:forEach>

                            <!-- Total filtrado -->
                            <tr class="table-info">
                                <td colspan="3"></td>
                                <td><strong>S/. <fmt:formatNumber value="${totalFiltrado}" maxFractionDigits="2" /></strong></td>
                                <td><strong>Total Filtrado</strong></td>
                            </tr>
                        </tbody>
                    </table>

                    <a href="ReportePDFServlet?fechaInicio=${param.fechaInicio}&fechaFin=${param.fechaFin}" target="_blank" class="btn btn-danger">
                        <i class="fas fa-file-pdf"></i> Exportar PDF
                    </a>

                </div>
            </div>


            <!-- Tabla de Entradas -->
            <div id="entradas" class="report-section">
                <h2 class="section-title">Entradas de Productos</h2>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID Entrada</th>
                                <th>ID Producto</th>
                                <th>ID Proveedor</th>
                                <th>Cantidad</th>
                                <th>Costo</th>
                                <th>Fecha</th>
                                <th>Factura</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="totalCosto" value="0" />
                            <c:forEach var="entrada" items="${entradas}">
                                <tr>
                                    <td>${entrada.id}</td>
                                    <td>${entrada.id_Producto}</td>
                                    <td>${entrada.id_Proveedor}</td>
                                    <td>${entrada.cantida}</td>
                                    <td>S/. <fmt:formatNumber value="${entrada.costo}" maxFractionDigits="2" /></td>
                                    <td>${entrada.fecha}</td>
                                    <td>${entrada.factura}</td>
                                </tr>
                                <c:set var="totalCosto" value="${totalCosto + entrada.costo}" />
                            </c:forEach>

                            <!-- Fila con el costo total -->
                            <tr class="table-info">
                                <td colspan="4"></td>
                                <td><strong>S/. <fmt:formatNumber value="${totalCosto}" maxFractionDigits="2" /></strong></td>
                                <td colspan="2"><strong>Total Costo</strong></td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="ReporteEntradasPDFServlet" target="_blank" class="btn btn-danger">
                        <i class="fas fa-file-pdf"></i> Exportar Entradas a PDF
                    </a>

                </div>
            </div>

            <%--RESUMEN FINACIERO             

            <div id="resumen" class="report-section">
                <h3 class="section-title">Resumen Financiero</h3>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Total Vendido</th>
                                <th>Total Gastado</th>
                                <th>Ganancia</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>S/. <fmt:formatNumber value="${totalGeneral}" maxFractionDigits="2" /></td>
                                <td>S/. <fmt:formatNumber value="${totalCosto}" maxFractionDigits="2" /></td>
                                <td>
                                    <c:set var="ganancia" value="${totalGeneral - totalCosto}" />
                                    <strong>S/. <fmt:formatNumber value="${ganancia}" maxFractionDigits="2" /></strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>--%>

            <!-- Tabla de Productos -->
            <div id="productos" class="report-section">
                <h2 class="section-title">Productos</h2>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Tipo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Grupo para Pollos -->
                            <tr class="group-header bg-primary text-white">
                                <td colspan="6">
                                    POLLOS
                                </td>
                            </tr>
                            <c:forEach var="producto" items="${producto}">
                                <c:if test="${producto.tipo == 'pollos'}">
                                    <tr>
                                        <td>
                                            <a href="AdminControlador?accion=verVistaProducto&id=${producto.id}" 
                                               class="btn btn-sm btn-outline-primary"
                                               title="Ver detalles del producto">
                                                <i class="fas fa-eye"></i> ${producto.id}
                                            </a>
                                        </td>
                                        <td>${producto.nombre}</td>
                                        <td>${producto.descripcion}</td>
                                        <td>S/. ${producto.precio}</td>
                                        <td class="stock-cell">
                                            <c:choose>
                                                <c:when test="${producto.stock == 0}">
                                                    <span class="badge bg-danger">
                                                        <i class="fas fa-times-circle"></i> ${producto.stock}
                                                    </span>
                                                </c:when>
                                                <c:when test="${producto.stock < 5}">
                                                    <span class="badge bg-warning text-dark">
                                                        <i class="fas fa-exclamation-triangle"></i> ${producto.stock}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${producto.stock}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${producto.tipo}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            <!-- Grupo para Carnes -->
                            <tr class="group-header bg-info text-white">
                                <td colspan="6">
                                    CARNES
                                </td>
                            </tr>
                            <c:forEach var="producto" items="${producto}">
                                <c:if test="${producto.tipo == 'carnes'}">
                                    <tr>
                                        <td>
                                            <a href="AdminControlador?accion=verVistaProducto&id=${producto.id}" 
                                               class="btn btn-sm btn-outline-primary"
                                               title="Ver detalles del producto">
                                                <i class="fas fa-eye"></i> ${producto.id}
                                            </a>
                                        </td>
                                        <td>${producto.nombre}</td>
                                        <td>${producto.descripcion}</td>
                                        <td>S/. ${producto.precio}</td>
                                        <td class="stock-cell">
                                            <c:choose>
                                                <c:when test="${producto.stock == 0}">
                                                    <span class="badge bg-danger">
                                                        <i class="fas fa-times-circle"></i> ${producto.stock}
                                                    </span>
                                                </c:when>
                                                <c:when test="${producto.stock < 5}">
                                                    <span class="badge bg-warning text-dark">
                                                        <i class="fas fa-exclamation-triangle"></i> ${producto.stock}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${producto.stock}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${producto.tipo}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>

                    <a href="ReporteProductosPDFServlet" class="btn btn-danger" target="_blank">
                        <i class="fas fa-file-pdf"></i> Exportar Productos a PDF
                    </a>

                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <button id="btnSubir" class="btn btn-primary rounded-circle shadow" title="Volver arriba">
            <i class="fas fa-arrow-up"></i>
        </button>
    </body>
</html>

<script>
    // Mostrar/ocultar botón cuando se hace scroll
    const btnSubir = document.getElementById("btnSubir");

    window.onscroll = function () {
        if (document.documentElement.scrollTop > 200) {
            btnSubir.style.display = "flex";
        } else {
            btnSubir.style.display = "none";
        }
    };

    // Volver arriba al hacer clic
    btnSubir.addEventListener("click", function () {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });
</script>
