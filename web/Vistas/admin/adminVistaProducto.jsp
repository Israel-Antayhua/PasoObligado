<%-- 
    Document   : adminVistaProducto
    Created on : 28 jun. 2025, 4:28:12 p. m.
    Author     : Pc-03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>El Paso Obligado: Stock</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="CSS/AdminVistaProducto.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
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


        <!----Contenido Para editar producto---->   
        <main class="main_COMBO">

            <section class="IMG_COMBO">
                <figure>
                    <img src="${producto.urlImagen}"
                         alt="COMOBO_01">
                </figure>
            </section>

            <div class="DSCP_COMBO">
                <div>
                    <h1>${producto.nombre}</h1>

                    <label>
                        Descripcion: ${producto.descripcion}<br>
                        STOCK: ${producto.stock} unidad(es)<br>
                    </label>

                    <form id="form-actualizar" action="AdminControlador?accion=actualizarProducto" method="post">
                        <input type="hidden" name="id" value="${producto.id}">

                        <!-- VISTA -->
                        <div class="info-row">
                            <span>Es visible:</span>
                            <select id="visible-select" name="vista" class="readonly-input">
                                <option value="1" ${producto.vista == 1 ? 'selected' : ''}>Sí</option>
                                <option value="0" ${producto.vista == 0 ? 'selected' : ''}>No</option>
                            </select>
                            <button type="button" class="edit-btn" id="editarVisibleBtn">
                                <i class="fa-solid fa-pen-to-square"></i> Editar
                            </button>
                        </div>  

                        <!-- PRECIO -->
                        <div class="info-row">
                            <span>S/. </span>
                            <input type="number" id="precio-input" name="precio" value="${producto.precio}" readonly class="readonly-input">
                            <button type="button" class="edit-btn" id="editarPrecioBtn">
                                <i class="fa-solid fa-pen-to-square"></i> Editar
                            </button>
                        </div>


                        <!-- STOCK -->
                        <div class="info-row">
                            <span>Unds:</span>
                            <input type="number" id="stock-input" name="stock" value="0" readonly class="readonly-input">
                            <button type="button" class="edit-btn" id="editarStockBtn">
                                <i class="fa-solid fa-plus"></i> Agregar
                            </button>
                        </div>



                        <!-- Botón oculto para enviar el formulario -->
                        <button type="submit" id="submitFormBtn" style="display: none;"></button>
                    </form>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="main.js"></script>

    </body>

    <script>
        let editingPrecio = false;
        let editingStock = false;
        let editingVisible = false;

        const visibleSelect = document.getElementById("visible-select");
        const visibleBtn = document.getElementById("editarVisibleBtn");
        const precioInput = document.getElementById("precio-input");
        const stockInput = document.getElementById("stock-input");
        const precioBtn = document.getElementById("editarPrecioBtn");
        const stockBtn = document.getElementById("editarStockBtn");
        const msgPrecio = document.getElementById("msg-precio");
        const msgStock = document.getElementById("msg-stock");
        const submitBtn = document.getElementById("submitFormBtn");

        precioBtn.addEventListener("click", () => {
            if (!editingPrecio) {
                precioInput.removeAttribute("readonly");
                precioInput.focus();
                precioBtn.innerHTML = '<i class="fa-solid fa-check"></i> Guardar';
                editingPrecio = true;
            } else {
                precioInput.setAttribute("readonly", true);
                precioBtn.innerHTML = '<i class="fa-solid fa-pen-to-square"></i> Editar';
                editingPrecio = false;
                submitBtn.click(); // Enviar formulario
            }
        });

        stockBtn.addEventListener("click", () => {
            if (!editingStock) {
                stockInput.removeAttribute("readonly");
                stockInput.focus();
                stockBtn.innerHTML = '<i class="fa-solid fa-check"></i> Guardar';
                editingStock = true;
            } else {
                stockInput.setAttribute("readonly", true);
                stockBtn.innerHTML = '<i class="fa-solid fa-plus"></i> Agregar';

                editingStock = false;
                submitBtn.click(); // Enviar formulario
            }
        });

        visibleBtn.addEventListener("click", () => {
            if (!editingVisible) {
                visibleSelect.removeAttribute("disabled");
                visibleBtn.innerHTML = '<i class="fa-solid fa-check"></i> Guardar';
                editingVisible = true;
            } else {
                visibleSelect.setAttribute("readonly", true);
                visibleBtn.innerHTML = '<i class="fa-solid fa-pen-to-square"></i> Editar';
                editingVisible = false;
                // Aquí puedes agregar lógica para guardar el cambio si es necesario
                
                submitBtn.click();
            }
        });
    </script>

</html>
