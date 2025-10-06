/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.clases.EntidadEntradaProducto;
import Modelo.servicios.impl.AdminDAO;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;


@WebServlet(name = "ReporteEntradasPDFServlet", urlPatterns = {"/ReporteEntradasPDFServlet"})
public class ReporteEntradasPDFServlet extends HttpServlet {

    private final AdminDAO provDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<EntidadEntradaProducto> entradas = provDAO.traerEntradas();

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"reporte_entradas.pdf\"");

        try {
            Document doc = new Document();
            PdfWriter.getInstance(doc, response.getOutputStream());
            doc.open();

            // Título
            Font tituloFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLUE);
            doc.add(new Paragraph("REPORTE DE ENTRADAS DE PRODUCTOS", tituloFont));
            doc.add(new Paragraph("Fecha: " + new java.util.Date().toString()));
            doc.add(new Paragraph(" "));

            // Tabla de entradas
            PdfPTable tabla = new PdfPTable(7);
            tabla.setWidthPercentage(100);
            tabla.setSpacingBefore(10f);
            tabla.setSpacingAfter(10f);

            // Encabezados
            Stream.of("ID Entrada", "ID Producto", "ID Proveedor", "Cantidad", "Costo", "Fecha", "Factura")
                    .forEach(header -> {
                        PdfPCell cell = new PdfPCell(new Phrase(header));
                        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                        tabla.addCell(cell);
                    });

            double totalCosto = 0;
            for (EntidadEntradaProducto entrada : entradas) {
                tabla.addCell(String.valueOf(entrada.getId()));
                tabla.addCell(String.valueOf(entrada.getId_Producto()));
                tabla.addCell(String.valueOf(entrada.getId_Proveedor()));
                tabla.addCell(String.valueOf(entrada.getCantida()));
                tabla.addCell(String.format("S/. %.2f", entrada.getCosto()));
                tabla.addCell(entrada.getFecha().toString());
                tabla.addCell(entrada.getFactura());

                totalCosto += entrada.getCosto();
            }

            // Fila Total
            PdfPCell vacio = new PdfPCell(new Phrase(""));
            vacio.setColspan(4);
            tabla.addCell(vacio);
            tabla.addCell(new Phrase(String.format("S/. %.2f", totalCosto)));
            PdfPCell totalText = new PdfPCell(new Phrase("Total Costo"));
            totalText.setColspan(2);
            tabla.addCell(totalText);

            doc.add(tabla);
            doc.close();

        } catch (DocumentException e) {
            throw new IOException("Error al generar PDF: " + e.getMessage(), e);
        }
    }
}
