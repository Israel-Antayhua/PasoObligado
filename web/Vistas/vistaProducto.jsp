<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> El Paso Obligado: ${producto.nombre}</title>
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
            
            <!--Cuerpo de pagina-->

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
                        <h2> S/. ${producto.precio}</h2>
                        <Label>
                            Descripcion: ${producto.descripcion}<br>
                            Disponibles: ${producto.stock} unidades<br>

                        </Label>
                                                  
                        <hr>

                        <!----box---->   
                        <div class="quantity-container">
                            <h4>CANTIDAD:</h4>
                            <select class="quantity-select" data-stock="${producto.stock}" 
                                    onchange="document.querySelector('.BUY_COMBO').setAttribute('data-und', this.value)">
                                <!-- Las opciones básicas como fallback -->
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>

                        <button class="BUY_COMBO" 
                                data-id="${producto.id}"
                                data-idventa="1"
                                data-und="1"
                                ><i class="fa-solid fa-cart-shopping"></i> Agregar
                        </button>
                    </div>
                </div>

                <section class="modal_dots">
                    <div class="contain_modal_dots">
                        <div class="dots">
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                </section>

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

        
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="main.js"></script>
    </body>

</html>

<script>
    document.querySelectorAll('.BUY_COMBO').forEach(button => {
        button.addEventListener('click', () => {
            const id = button.dataset.id;
            const idVenta = button.dataset.idventa;
            const und = button.dataset.und;

            // Redirección
            window.location.href = "DetalleVentasControlador?accion=agregarCarrito&id=" + id + "&idVenta=" + idVenta + "&und=" + und;
        });
    });
</script>

<script>
    document.querySelectorAll('.quantity-select').forEach(select => {
        const stock = parseInt(select.getAttribute('data-stock'));
        const maxQuantity = Math.min(stock, 5);

        // Si el stock es menor que 5, ajustamos las opciones
        if (maxQuantity < 5) {
            select.innerHTML = ''; // Limpiamos las opciones existentes

            for (let i = 1; i <= maxQuantity; i++) {
                const option = document.createElement('option');
                option.value = i;
                option.textContent = i;
                select.appendChild(option);
            }
        }
    });
</script>