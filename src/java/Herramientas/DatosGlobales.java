/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Herramientas;

import Modelo.clases.EntidadDVE;
import Modelo.clases.EntidadUsuarios;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;

/**
 *
 * @author USUARIO
 */
public class DatosGlobales {
    private static EntidadUsuarios usuario;
    private static double cuenta;
    private static int nDetalle=0;
    private static String fecha;
    
    public static String getFecha() {
    Calendar date = new GregorianCalendar();
    // Sumar 1 al mes porque Calendar.MONTH es base 0
    DatosGlobales.fecha = String.format("%d-%02d-%02d", 
        date.get(Calendar.YEAR),
        date.get(Calendar.MONTH) + 1,  // ¡Aquí está la corrección!
        date.get(Calendar.DAY_OF_MONTH));
    return fecha;
}

    public static EntidadUsuarios getUsuario() {
        return usuario;
    }

    public static void setUsuario(EntidadUsuarios usuario) {
        Herramientas.DatosGlobales.usuario = usuario;
    }

    public static double getCuenta() {
        return cuenta;
    }

    public static void setCuenta(double cuenta) {
        DatosGlobales.cuenta = cuenta;
    }

    public static int getnDetalle() {
        return nDetalle;
    }

    public static void setnDetalle(int nDetalle) {
        DatosGlobales.nDetalle = nDetalle;
    }
    
    public static HashMap<Integer, EntidadDVE> listaDetalle = new HashMap<>();
}
