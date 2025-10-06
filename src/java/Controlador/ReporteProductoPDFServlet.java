package Controlador;

import Modelo.clases.EntidadProducto;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import Modelo.servicios.impl.ProductoDAO;
import java.util.stream.Stream;

@WebServlet(name = "ReporteProductosPDFServlet", urlPatterns = {"/ReporteProductosPDFServlet"})
public class ReporteProductoPDFServlet extends HttpServlet {

    private final ProductoDAO productoDAO = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<EntidadProducto> productos = productoDAO.traerProducto();

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"reporte_productos.pdf\"");

        try {
            Document doc = new Document();
            PdfWriter.getInstance(doc, response.getOutputStream());
            doc.open();

            Font tituloFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLUE);
            doc.add(new Paragraph("REPORTE DE PRODUCTOS", tituloFont));
            doc.add(new Paragraph("Fecha: " + new java.util.Date().toString()));
            doc.add(new Paragraph(" "));

            // Grupo: Pollos
            doc.add(new Paragraph("Pollos", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14)));
            PdfPTable tablaPollos = crearTablaProductos();
            for (EntidadProducto p : productos) {
                if ("pollos".equalsIgnoreCase(p.getTipo())) {
                    agregarFilaProducto(tablaPollos, p);
                }
            }
            doc.add(tablaPollos);
            doc.add(new Paragraph(" "));

            // Grupo: Carnes
            doc.add(new Paragraph("Carnes", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14)));
            PdfPTable tablaCarnes = crearTablaProductos();
            for (EntidadProducto p : productos) {
                if ("carnes".equalsIgnoreCase(p.getTipo())) {
                    agregarFilaProducto(tablaCarnes, p);
                }
            }
            doc.add(tablaCarnes);

            doc.close();

        } catch (DocumentException e) {
            throw new IOException("Error al generar PDF: " + e.getMessage(), e);
        }
    }

    private PdfPTable crearTablaProductos() {
        PdfPTable tabla = new PdfPTable(6);
        tabla.setWidthPercentage(100);
        tabla.setSpacingBefore(10f);
        tabla.setSpacingAfter(10f);

        Stream.of("ID", "Nombre", "Descripcion", "Precio", "Stock", "Tipo").forEach(header -> {
            PdfPCell cell = new PdfPCell(new Phrase(header));
            cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
            tabla.addCell(cell);
        });

        return tabla;
    }

    private void agregarFilaProducto(PdfPTable tabla, EntidadProducto p) {
        tabla.addCell(String.valueOf(p.getId()));
        tabla.addCell(p.getNombre());
        tabla.addCell(p.getDescripcion());
        tabla.addCell(String.format("S/. %.2f", p.getPrecio()));
        tabla.addCell(String.valueOf(p.getStock()));
        tabla.addCell(p.getTipo());
    }
}
