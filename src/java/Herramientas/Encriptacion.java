/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Herramientas;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 *
 * @author user
 */
public class Encriptacion {

    public static String hashPassword(String clave) {
        try {
            // Crear instancia del algoritmo de hashing
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Generar el hash en bytes
            byte[] hashBytes = digest.digest(clave.getBytes());

            // Convertir los bytes a una cadena Base64
            return Base64.getEncoder().encodeToString(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error al hashear la contraseña", e);
        }

    }

}
