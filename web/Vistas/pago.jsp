<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/pasarelaPago.css">
        <title>Pasarela de Pago</title>
    </head>
    <body>
        <!----contenedor de Pago---->   
        <div class="payment-container">
            <!----Imagen---->   
            <div class="payment-header">
                <img src="MULTIMEDIA/INTERFACE/Logo-Culqui.png" alt="Logo Pasarela de Pago">
                <h1>Pago Seguro</h1>
                <p>Complete su compra de manera rápida y segura</p>
            </div>

            <!----info del pago---->   
            <div class="payment-amount">
                <!----precio---->   
                <div class="label">Total a pagar</div>
                <div class="amount">
                    <c:if test="${not empty monto}">
                        S/ <fmt:formatNumber value="${monto}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                    </c:if>
                    <c:if test="${empty monto}">S/ 0.00</c:if>
                    </div>
                    <div class="label">Orden #123456</div>
                </div>

                <!----Metodos de pago con su imagen---->   
                <div class="payment-options">
                    <h1>Medios de pago</h1>
                    <div class="option selected">
                        <img src="MULTIMEDIA/INTERFACE/Logo-Pago.png" alt="PagoEfectivo">
                        <div class="option-info">
                            <h3>PagoEfectivo</h3>
                            <p>Paga en efectivo en agentes autorizados</p>
                        </div>
                    </div>

                    <div class="option">
                        <img src="MULTIMEDIA/INTERFACE/Logo-BCP.jpg" alt="BCP">
                        <div class="option-info">
                            <h3>Banco BCP</h3>
                            <p>Pago con tarjeta de débito/crédito</p>
                        </div>
                    </div>

                    <div class="option">
                        <img src="MULTIMEDIA/INTERFACE/Logo-BBVA.jpg" alt="BBVA">
                        <div class="option-info">
                            <h3>Banco BBVA</h3>
                            <p>Pago con tarjeta de débito/crédito</p>
                        </div>
                    </div>
                </div>

                <!----Datos del usuario---->   
                <div class="payment-details">
                    <div class="form-group">
                        <h1>Datos para seguimiento de pago</h1>
                        <label for="name">Nombre completo</label>
                        <input type="text" id="name" placeholder="Ingrese su nombre completo" value="${usuario.username}" required>
                </div>

                <div class="form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="email" id="email" placeholder="Ingrese su correo electrónico" value="${usuario.email}" required>
                </div>

                <div class="form-group">
                    <label for="dni">DNI</label>
                    <input type="text" id="dni" placeholder="Ingrese su DNI" value="${usuario.username}" required>
                </div>
            </div>

            <button class="btn-pay">Generar Código de Pago</button>

            <div class="payment-footer">
                <p>Su información está protegida con encriptación SSL de 256 bits</p>
                <p>© 2025 Pasarela de Pagos Seguros</p>
            </div>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <div id="modal-icon" class="modal-icon">!</div>
                <h2 id="modal-title">Título</h2>
                <div id="modal-message">
                    <p id="message-text"></p>
                    <div id="payment-info" style="display: none;">
                        <div class="payment-code" id="payment-code"></div>
                        <div class="payment-steps" id="payment-steps"></div>
                    </div>
                </div>
                <button id="btn-ok" class="btn-ok">Aceptar</button>
            </div>
        </div>

        <script>
            // Función para generar código aleatorio de 8 dígitos
            function generateRandomCode() {
                const prefix = "PE-";
                const randomNumber = Math.floor(10000000 + Math.random() * 90000000);
                return prefix + randomNumber.toString();
            }

            // Obtener elementos del modal
            const modal = document.getElementById("myModal");
            const modalIcon = document.getElementById("modal-icon");
            const modalTitle = document.getElementById("modal-title");
            const messageText = document.getElementById("message-text");
            const paymentInfo = document.getElementById("payment-info");
            const paymentCode = document.getElementById("payment-code");
            const paymentSteps = document.getElementById("payment-steps");
            const btnOk = document.getElementById("btn-ok");
            const span = document.getElementsByClassName("close")[0];

            // Función para mostrar el modal
            function showModal(title, message, type, showPaymentInfo = false) {
                modalTitle.textContent = title;
                messageText.textContent = message;

                // Configurar según el tipo de mensaje
                modalIcon.className = "modal-icon";
                modalIcon.classList.add(type);

                if (type === "success") {
                    modalIcon.textContent = "✓";
                    paymentInfo.style.display = showPaymentInfo ? "block" : "none";
                } else if (type === "error") {
                    modalIcon.textContent = "!";
                    paymentInfo.style.display = "none";
                } else {
                    modalIcon.textContent = "?";
                    paymentInfo.style.display = "none";
                }

                modal.style.display = "block";
            }


            // Cerrar modal al hacer clic en Aceptar
            btnOk.onclick = function () {
                if (modalTitle.textContent === "¡Éxito!") {
                    // Solo redirigir si es el modal de éxito
                    window.location.href = "VentaControlador?accion=FinalizarVenta";
                }
                modal.style.display = "none";
            }


            // Simulación de botón de pago con validación
            document.querySelector('.btn-pay').addEventListener('click', function () {
                // Obtener los valores de los campos
                const name = document.getElementById('name').value.trim();
                const email = document.getElementById('email').value.trim();
                const dni = document.getElementById('dni').value.trim();

                // Validar que ningún campo esté vacío
                if (!name || !email || !dni) {
                    showModal("Error", "Por favor rellene todos los campos", "error");
                    return;
                }

                // Validar formato de email
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    showModal("Error", "Por favor ingrese un correo electrónico válido", "error");
                    return;
                }

                // Validar DNI (ejemplo: 8 dígitos)
                const dniRegex = /^\d{8}$/;
                if (!dniRegex.test(dni)) {
                    showModal("Error", "Por favor ingrese un DNI válido (8 dígitos)", "error");
                    return;
                }

                // Generar código de pago aleatorio
                const randomCode = generateRandomCode();

                // Configurar la información de pago
                paymentCode.textContent = randomCode;
                paymentSteps.innerHTML = `
            <ol>
                <li>Ingresa a la banca móvil de la entidad seleccionada</li>
                <li>Ingresa a pagar servicio y digita CULQUI en el buscador</li>
                <li>Ingresa el código proporcionado y paga</li>
            </ol>
        `;

                // Mostrar modal de éxito con información de pago
                showModal(
                        "¡Éxito!",
                        "Su compra ha sido procesada correctamente. Use el siguiente código para completar el pago:",
                        "success",
                        true
                        );
            });
        </script>
    </body>
</html>
