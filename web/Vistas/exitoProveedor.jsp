<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operación Exitosa | Sistema de Productos</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            :root {
                --primary-color: #4361ee;
                --success-color: #2ecc71;
                --light-color: #f8f9fa;
                --dark-color: #212529;
                --transition: all 0.3s ease;
            }
            
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f5f7fa;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                color: var(--dark-color);
                line-height: 1.6;
            }
            
            .success-container {
                background: white;
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 40px;
                width: 90%;
                max-width: 600px;
                text-align: center;
                transform: translateY(-20px);
                animation: fadeInUp 0.5s ease forwards;
            }
            
            .success-icon {
                font-size: 5rem;
                color: var(--success-color);
                margin-bottom: 20px;
                animation: pulse 1.5s infinite;
            }
            
            .success-title {
                font-size: 2rem;
                color: var(--success-color);
                margin-bottom: 15px;
                font-weight: 600;
            }
            
            .success-message {
                font-size: 1.1rem;
                margin-bottom: 20px;
                padding: 15px;
                background: #f0fff4;
                border-left: 4px solid var(--success-color);
                border-radius: 4px;
                text-align: left;
            }
            
            .product-id {
                display: inline-block;
                background: var(--success-color);
                color: white;
                padding: 5px 15px;
                border-radius: 20px;
                font-weight: 500;
                margin: 10px 0;
            }
            
            .action-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 30px;
                flex-wrap: wrap;
            }
            
            .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 12px 24px;
                border-radius: 8px;
                text-decoration: none;
                font-weight: 500;
                transition: var(--transition);
                border: none;
                cursor: pointer;
            }
            
            .btn-primary {
                background-color: var(--primary-color);
                color: white;
            }
            
            .btn-outline {
                background-color: transparent;
                color: var(--primary-color);
                border: 2px solid var(--primary-color);
            }
            
            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .btn i {
                margin-right: 8px;
            }
            
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.1);
                }
                100% {
                    transform: scale(1);
                }
            }
            
            @media (max-width: 768px) {
                .success-container {
                    padding: 30px 20px;
                    width: 95%;
                }
                
                .success-icon {
                    font-size: 4rem;
                }
                
                .success-title {
                    font-size: 1.5rem;
                }
                
                .action-buttons {
                    flex-direction: column;
                    gap: 10px;
                }
                
                .btn {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="success-container">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1 class="success-title">¡Operación Exitosa!</h1>
            <div class="success-message">
                ${param.mensaje}
            </div>
            
            <c:if test="${not empty param.id}">
                <div class="product-id">
                    <i class="fas fa-hashtag"></i> Nombre proveedor: ${param.id}
                </div>
            </c:if>
            
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/AdminControlador?accion=verCrearProducto" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Crear producto
                </a>
                <a href="${pageContext.request.contextPath}/UsuariosControlador?accion=verPerfil" class="btn btn-outline">
                    <i class="fas fa-home"></i> Volver al inicio
                </a>
            </div>
        </div>
    </body>
</html>