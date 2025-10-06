/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Modelo.serviciosInterfacez;

import Modelo.clases.EntidadUsuarios;

public interface Usuarios {

    public boolean insertarUsuario(EntidadUsuarios usuario);

    public EntidadUsuarios obtenerUsuarioPorId(int id);

    public EntidadUsuarios obtenerUsuarioPorUsername(String username);

    public boolean actualizarUsuario(EntidadUsuarios usuario);

    public boolean actualizarContraseña(EntidadUsuarios usuario);

    public boolean eliminarUsuario(int id);

    public boolean verificarCredenciales(String username, String password);

    public EntidadUsuarios obtenerPorCredenciales(String username, String password);

}
