package Controlador;

import Modelo.clases.EntidadVenta;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import Modelo.servicios.impl.AdminDAO;
import java.util.stream.Stream;

@WebServlet(name = "ReportePDFServlet", urlPatterns = {"/ReportePDFServlet"})
public class ReportePDFServlet extends HttpServlet {

    private final AdminDAO provDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener parámetros de fechas desde el formulario
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        List<EntidadVenta> ventas;

        if (fechaInicio != null && fechaFin != null && !fechaInicio.isEmpty() && !fechaFin.isEmpty()) {
            ventas = provDAO.obtenerVentasEntreFechas(fechaInicio, fechaFin);
        } else {
            ventas = provDAO.traerVentas(); // Sin filtro
        }

        // Configuración del PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"reporte_ventas.pdf\"");

        try {
            Document documento = new Document();
            PdfWriter.getInstance(documento, response.getOutputStream());

            documento.open();

            // Título
            Font tituloFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLUE);
            Paragraph titulo = new Paragraph("REPORTE DE VENTAS", tituloFont);
            titulo.setAlignment(Element.ALIGN_CENTER);
            documento.add(titulo);

            documento.add(new Paragraph(" "));
            documento.add(new Paragraph("Fecha de generación: " + new java.util.Date()));
            documento.add(new Paragraph("Rango: " + (fechaInicio != null ? fechaInicio : "N/A") + " a " + (fechaFin != null ? fechaFin : "N/A")));
            documento.add(new Paragraph(" "));

            // Tabla
            PdfPTable tabla = new PdfPTable(5);
            tabla.setWidthPercentage(100);
            tabla.setSpacingBefore(10f);
            tabla.setSpacingAfter(10f);

            // Encabezados
            Stream.of("ID Venta", "Fecha", "ID Usuario", "Total", "Estado").forEach(header -> {
                PdfPCell cell = new PdfPCell(new Phrase(header));
                cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                tabla.addCell(cell);
            });

            double total = 0;
            for (EntidadVenta venta : ventas) {
                tabla.addCell(String.valueOf(venta.getId()));
                tabla.addCell(venta.getFecha());
                tabla.addCell(String.valueOf(venta.getIdUsuario()));
                tabla.addCell(String.format("S/. %.2f", venta.getTotalFinal()));
                tabla.addCell(venta.getEstadoEntrega() == 1 ? "Entregado" : "Pendiente");
                total += venta.getTotalFinal();
            }

            // Fila total
            PdfPCell celdaVacia = new PdfPCell(new Phrase(""));
            celdaVacia.setColspan(3);
            tabla.addCell(celdaVacia);

            tabla.addCell(new Phrase("TOTAL"));
            tabla.addCell(new Phrase(String.format("S/. %.2f", total)));

            documento.add(tabla);
            documento.close();

        } catch (DocumentException e) {
            throw new IOException("Error al generar el PDF: " + e.getMessage(), e);
        }
    }
}
