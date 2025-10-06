<%-- 
    Document   : perfilAdmin
    Created on : 17 jun. 2025, 7:01:32 p. m.
    Author     : Pc-03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adminsitrador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="CSS/adminEstilo.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        <!----Contenido del admin---->   
        <div class="admin-container">
            <div class="admin-left">
                <h2>Bienvenido, ${sessionScope.usuarioLogueado.username}</h2>
                <img src="MULTIMEDIA/INTERFACE/confi.png" alt="Logo" class="logo_perfil">
            </div>

            <div class="admin-right">
                <div class="admin-slogan">
                    <h3>“Gestión rápida y eficaz”</h3>
                    <div class="slogan-line"></div>
                </div>

                <div class="admin-actions">
                    <div class="card" onclick="location.href = 'AdminControlador?accion=verPedidos'">
                        <i class="fa-solid fa-box"></i><span>Pedidos</span>
                    </div>
                    
                    <div class="card" onclick="location.href = 'AdminControlador?accion=verStock'">
                        <i class="fa-solid fa-gear"></i><span>Modificar Producto</span>
                    </div>
                    
                    <%--<div class="card" onclick="location.href = 'AdminControlador?accion=verConfiguracion'">
                        <i class="fa-solid fa-gear"></i><span>Configuración</span>
</div>--%>

                    <div class="card" onclick="location.href = 'AdminControlador?accion=verCrearProducto'">
                        <i class="fa-solid fa-plus"></i><span>Crear Producto</span>
                    </div>
                    
                    <%--<div class="card" onclick="location.href = 'AdminControlador?accion=verUsuarios'">
                        <i class="fa-solid fa-users"></i><span>Usuarios</span>
                    </div>--%>
                    <div class="card" onclick="location.href = 'AdminControlador?accion=verReportes'">
                        <i class="fa-solid fa-file-lines"></i><span>Reportes</span>
                    </div>
                </div>
            </div>
        </div>



        <script>
            const ctx = document.getElementById('ventasChart').getContext('2d');
            const ventasChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
                    datasets: [{
                            label: 'Ventas del mes (S/.)',
                            data: [1200, 1500, 1000, 2000],
                            backgroundColor: '#0071e3'
                        }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        },
                        title: {
                            display: true,
                            text: 'Resumen de Ventas del Mes'
                        }
                    }
                }
            });
        </script>
        <script src="https://kit.fontawesome.com/126fa838b4.js" crossorigin="anonymous"></script>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="main.js"></script>
    </body>
</html>
