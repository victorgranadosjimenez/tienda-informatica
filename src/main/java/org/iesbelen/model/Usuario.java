package org.iesbelen.model;


import java.util.Objects;

public class Usuario {


    private int idUsuario;
    private String nombre;
    private String password;
    private String rol;

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPassword() {
        return password;
    }

    public String getRol() {
        return rol;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuario usuario = (Usuario) o;
        return idUsuario == usuario.idUsuario && Objects.equals(nombre, usuario.nombre) && Objects.equals(password, usuario.password) && Objects.equals(rol, usuario.rol);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUsuario, nombre, password, rol);
    }
}

