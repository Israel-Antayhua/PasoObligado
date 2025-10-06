<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String currentDate = sdf.format(new Date());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>El Paso Obligado: Stock</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="CSS/styless.css">
        <link rel="stylesheet" href="CSS/crearProducto.css">
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

        <!----Contenido---->   
        <main>
            <div class="container">
                <h1>Crear Nuevo Producto</h1>

                <h2>Datos de entrada</h2>

                <form id="formDatosEntrada">
                    <div class="form-group">
                        <label for="fecha">Fecha de entrada: 
                            <input type="date" id="fecha" name="fecha" value="<%= currentDate %>" readonly required
                                   style="background-color: #f8f9fa; cursor: not-allowed;">
                        </label>  
                    </div>


                    <div class="form-group">
                        <label for="factura">Factura:</label>
                        <input type="text" id="factura" name="factura" required>
                    </div>

                    <div class="form-group">
                        <label for="id_proveedor">Proveedor:</label>
                        <select id="id_proveedor" name="id_proveedor" required class="form-control">
                            <option value="">Seleccione un proveedor</option>
                            <c:forEach items="${proveedor}" var="proveedor">
                                <option value="${proveedor.id}">
                                   ${proveedor.id}: ${proveedor.nombre}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <button type="button" id="toggleProveedorBtn" class="btn btn-primary">
                            <i class="fa fa-plus"></i> Agregar Nuevo Proveedor
                        </button>
                    </div>


                </form>

                <!----Formulario para proveedor---->   
                <form id="formProveedor"  class="mt-3" style="display: none; overflow: hidden; transition: all 0.3s ease;">
                    <h2>Nuevo Proveedor</h2> 

                    <div class="form-group">
                        <label for="nombreProveedor">Nombre del Proveedor:</label>
                        <input type="text" id="nombreProveedor" name="nombreProveedor" required>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="text" id="correo" name="correo" required>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Telefono:</label>
                        <input type="text" id="telefono" name="telefono" required>
                    </div>

                    <div class="form-group">
                        <label for="ruc">RUC:</label>
                        <input type="text" id="ruc" name="ruc" required>
                    </div>

                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" id="direccion" name="direccion" required>
                    </div>

                    <div class="text-right">
                        <button type="button" id="cancelarProveedorBtn" class="btn btn-secondary mr-2">
                            <i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-save"></i> Guardar Proveedor
                        </button>
                    </div>


                </form>


                <!----Formulario para producto---->   
                <h2>Producto</h2>
                <form id="formProducto">
                    <div class="form-group">
                        <label for="vista">Estado de visualización del producto:</label>
                        <select id="vista" name="vista" required class="form-control">
                            <option value="">Seleccione una opción</option>
                            <option value="1">Visible</option>
                            <option value="0">No visible</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="nombreProducto">Nombre del Producto:</label>
                        <input type="text" id="nombreProducto" name="nombreProducto" required>
                    </div>

                    <div class="form-group">
                        <label for="descripcion">Descripcion:</label>
                        <input type="text" id="descripcion" name="descripcion" required>
                    </div>

                    <div class="form-group">
                        <label for="costo">Costo:</label>
                        <input type="number" id="costo" name="costo" step="0.01" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="precio">Precio:</label>
                        <input type="number" id="precio" name="precio" step="0.01" required>
                    </div>

                    <div class="form-group">
                        <label for="stock">Stock:</label>
                        <input type="number" id="stock" name="stock" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="urlImagen">URL de la Imagen:</label>
                        <input type="url" id="urlImagen" name="urlImagen" required>
                    </div>

                    <div class="form-group">
                        <label for="tipo">Tipo de Producto:</label>
                        <select id="tipo" name="tipo" required>
                            <option value="">Seleccione un tipo</option>
                            <option value="carne">Carnes</option>
                            <option value="pollos">Pollos</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="submit" value="Crear Producto" class="btn-submit" id="btnCrearProducto">
                    </div>
                </form>
            </div>   
        </main>                                   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="main.js"></script>
    </body>
</html>

<script>
    document.getElementById('btnCrearProducto').addEventListener('click', function (event) {
        event.preventDefault(); // Evita el envío tradicional del formulario

        if (!document.getElementById('formProducto').reportValidity()) {
            return;
        }
        // Captura todos los valores del formulario


        const params = new URLSearchParams();
        
        params.append('cantida', document.getElementById('stock').value);
        params.append('costo', document.getElementById('costo').value);
        params.append('factura', document.getElementById('factura').value);
        params.append('idProveedor', document.getElementById('id_proveedor').value);

        params.append('vista', document.getElementById('vista').value);
        params.append('nombreProducto', document.getElementById('nombreProducto').value);
        params.append('descripcion', document.getElementById('descripcion').value);
        params.append('precio', document.getElementById('precio').value);
        params.append('stock', document.getElementById('stock').value);
        
        params.append('urlImagen', document.getElementById('urlImagen').value);
        params.append('tipo', document.getElementById('tipo').value);

        // Redirección similar a tu ejemplo
        window.location.href = "ProductoControlador?accion=crearProducto&" + params.toString();
    });
</script>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleBtn = document.getElementById('toggleProveedorBtn');
        const cancelBtn = document.getElementById('cancelarProveedorBtn');
        const formProveedor = document.getElementById('formProveedor');

        // Función para mostrar el formulario
        function mostrarFormulario() {
            formProveedor.style.display = 'block';
            setTimeout(() => {
                formProveedor.style.opacity = '1';
                formProveedor.style.height = 'auto';
            }, 10);
            toggleBtn.innerHTML = '<i class="fa fa-minus"></i> Cancelar';
            toggleBtn.classList.remove('btn-primary');
            toggleBtn.classList.add('btn-danger');
        }

        // Función para ocultar el formulario
        function ocultarFormulario() {
            formProveedor.style.opacity = '0';
            formProveedor.style.height = '0';
            setTimeout(() => {
                formProveedor.style.display = 'none';
            }, 300);
            toggleBtn.innerHTML = '<i class="fa fa-plus"></i> Agregar Nuevo Proveedor';
            toggleBtn.classList.remove('btn-danger');
            toggleBtn.classList.add('btn-primary');
        }

        // Evento para el botón toggle
        toggleBtn.addEventListener('click', function () {
            if (formProveedor.style.display === 'none') {
                mostrarFormulario();
            } else {
                ocultarFormulario();
            }
        });

        // Evento para el botón cancelar
        cancelBtn.addEventListener('click', ocultarFormulario);

        // Validación del formulario
        document.getElementById('formProveedor').addEventListener('submit', function (e) {
            e.preventDefault();
            // Aquí tu lógica para guardar el proveedor
            const params = new URLSearchParams();

            params.append('nombreProveedor', document.getElementById('nombreProveedor').value);
            params.append('correo', document.getElementById('correo').value);
            params.append('telefono', document.getElementById('telefono').value);
            params.append('ruc', document.getElementById('ruc').value);
            params.append('direccion', document.getElementById('direccion').value);

            // Redirección similar a tu ejemplo
            window.location.href = "ProductoControlador?accion=crearProveedor&" + params.toString();
            alert('Proveedor guardado con éxito!');
            ocultarFormulario();
            // Opcional: Recargar la lista de proveedores
        });
    });
</script>