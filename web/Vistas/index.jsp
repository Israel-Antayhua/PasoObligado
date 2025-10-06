<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>


<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> El Paso Obligado - Restauramte de Carnes</title>
        <script src="https://kit.fontawesome.com/126fa838b4.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="CSS/styless.css">

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
        <!--Cuerpo de pagina-->
        

            <!--Carrucel-->
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <!-- Indicadores -->
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></button>
                </div>

                <!-- Imágenes -->
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="MULTIMEDIA/INTERFACE/deli.png" class="d-block w-100" alt="Imagen 1">
                  </div>
                  <div class="carousel-item">
                    <img src="MULTIMEDIA/INTERFACE/Imagen2.jpg" class="d-block w-100" alt="Imagen 2">
                  </div>
                  <div class="carousel-item">
                    <img src="MULTIMEDIA/INTERFACE/Imagen4.png" class="d-block w-100" alt="Imagen 3">
                  </div>
                  <div class="carousel-item">
                    <img src="MULTIMEDIA/INTERFACE/Imagen1.jpg" class="d-block w-100" alt="Imagen 4">
                  </div>
                  <div class="carousel-item">
                    <img src="MULTIMEDIA/INTERFACE/slash3.jpg" class="d-block w-100" alt="Imagen 5">
                  </div>
                </div>

                <!-- Controles -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon"></span>
                </button>
            </div>
            
            <!----Banner---->   
            <section id="ofertas" class="mb-5">
                <h2 class="mb-4"><i class="bi bi-tag"></i> Promociones Especiales</h2>
                <div class="container-fluid p-0">
                    <img src="MULTIMEDIA/INTERFACE/oferton.jpg" alt="Promoción" class="img-fluid w-100">
                </div>
            </section>

            <!-- VISULAIZACION DE POLLOS EN EL INICIO -->

            <div class="pollos mb-5">
                <h1 class="titulo_1"><i class="bi bi-lightning-charge"></i>Pollos a la Leña</h1>
                <%--<div class="botones-producto">
                    <a href="#" class="boton-info">Más información</a>
                    <a href="#" class="boton-comprar">Comprar</a>
</div>--%>

                <div class="row justify-content-center">
                    <c:forEach items="${pollos}" var="item" varStatus="status">
                        <c:if test="${item.precio > 20}">
                            <div class="col-md-3">
                                <div class="card product-card h-100">
                                    <c:choose>
                                        <c:when test="${item.stock > 0}">
                                            <a href="ProductoControlador?accion=verProducto&id=${item.id}">
                                            </c:when>
                                            <c:otherwise>
                                                <a href="">
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
                                                <div class="vista">
                                                    <button class="vist"
                                                            data-id="${item.id}"
                                                            data-nombre="${item.nombre}"
                                                            data-precio="${item.precio}"
                                                            data-descripcion="${item.descripcion}"
                                                            data-url="${item.urlImagen}"
                                                            data-stock="${item.stock}">
                                                        <i class="fa-solid fa-magnifying-glass"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <h1>${item.descripcion}</h1>
                                            <h2>${item.nombre}</h2>
                                            <h1>S/. ${item.precio}</h1>
                                            <br>
                                        </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>

            </div>

            <!--VISUALIZACION DE CARNES EN EL INICIO  -->

            <div class="carnes mb-5">
                <h1 class="titulo_1"><i class="bi bi-lightning-charge"></i>Carnes</h1>
                <%--<div class="botones-producto">
                    <a href="#" class="boton-info">Más información</a>
                    <a href="#" class="boton-comprar">Comprar</a>
                </div>--%>

                <div class="row justify-content-center">
                    <c:forEach items="${carnes}" var="item" varStatus="status">
                        <c:if test="${item.precio > 40}">
                            <div class="col-md-3">
                            <div class="card product-card h-100">
                                <c:choose>
                                    <c:when test="${item.stock > 0}">
                                        <a href="ProductoControlador?accion=verProducto&id=${item.id}">
                                        </c:when>
                                        <c:otherwise>
                                            <a href="">
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
                                            <div class="vista">
                                                    <button class="vist"
                                                            data-id="${item.id}"
                                                            data-nombre="${item.nombre}"
                                                            data-precio="${item.precio}"
                                                            data-descripcion="${item.descripcion}"
                                                            data-url="${item.urlImagen}"
                                                            data-stock="${item.stock}">
                                                        <i class="fa-solid fa-magnifying-glass"></i>
                                                    </button>
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

            </div>



            <!----Modal: ver producto desde la lupita---->   
            <section class="modal_combo" id="modalProducto">
                <div class="contain_modal">
                    <div class="vista_producto">
                        <div class="IMG_COMBO">
                            <img id="modal-img" class="imagen" alt="producto">
                        </div>
                        <div class="DSCP_COMBO">
                            <h1 id="modal-nombre">Nombre producto</h1>
                            <h2 id="modal-descripcion">Descripcion</h2>
                            <h2 style="display: inline;">S/.</h2>                           
                            <h2 style="display: inline;" id="modal-precio">999.99</h2>
                            <hr>
                            <button class="BUY_COMBO">
                                <i class="fa-solid fa-magnifying-glass"></i> Ver Producto
                            </button>

                        </div>
                    </div>
                </div>
            </section>         

            <!--Pie de Página-->
            <footer class="mt-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <h3>Compañia</h3>
                            
                            <li><a class="nav-link" href="Nosotros.jsp">Nosotros</a></li>
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


<script>
    function toggleSearch() {
        const searchBox = document.getElementById("searchBox");
        if (searchBox.style.maxHeight === "100px") {
            searchBox.style.maxHeight = "0";
        } else {
            searchBox.style.maxHeight = "100px";
        }
    }
</script>

<script>
    document.querySelectorAll(".vist").forEach(boton => {
        boton.addEventListener("click", function (event) {
            event.preventDefault();     // Evita que el <a> se active
            event.stopPropagation();    // Evita la propagación del clic

            // Obtener los datos del botón
            const id = this.dataset.id;
            const nombre = this.dataset.nombre;
            const precio = this.dataset.precio;
            const descripcion = this.dataset.descripcion;
            const url = this.dataset.url;
            const stock = this.dataset.stock;

            // Insertar en el modal
            document.getElementById("modal-nombre").textContent = nombre;
            document.getElementById("modal-precio").textContent = precio;
            document.getElementById("modal-descripcion").textContent = descripcion;
            document.getElementById("modal-img").src = url;
            
            console.log("ID:", id);
            console.log(typeof id);

            document.querySelectorAll('.BUY_COMBO').forEach(button => {

                if (stock > 0) {
                    button.style.display = '';
                    button.disabled = false;
                    button.addEventListener('click', () => {
                        window.location.href = "ProductoControlador?accion=verProducto&id=" + id;
                    });
                } else {
                    // Opcional: ocultar o deshabilitar el botón si el stock es 0
                    button.style.display = 'none';
                    // o: button.disabled = true;
                }
            });
            // Aquí abres tu modal
            document.getElementById("modalProducto").classList.add("active");
        });

        // Cerrar el modal al hacer clic fuera de .contain_modal
        document.getElementById("modalProducto").addEventListener("click", function (event) {
            const modalContent = document.querySelector(".contain_modal");
            if (!modalContent.contains(event.target)) {
                this.classList.remove("active");
            }
        });
    });
</script>     

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
    $(document).ready(function () {
        $('.post_head').slick({
            dots: true,
            arrows: true,
            infinite: true,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            pauseOnHover: true,
            adaptiveHeight: true, // Se ajusta a la altura de cada imagen
            lazyLoad: 'ondemand', // Carga perezosa de imágenes
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false
                    }
                }
            ]
        });
    });
</script>

