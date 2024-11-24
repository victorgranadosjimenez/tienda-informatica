package org.iesbelen.dao;

import org.iesbelen.model.Producto;
import org.iesbelen.model.Usuario;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UsuarioDAOImpl extends AbstractDAOImpl implements UsuarioDAO{

    @Override
    public synchronized void create(Usuario usuario) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSet rsGenKeys = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("INSERT INTO usuarios (nombre, password, rol) VALUES (?,?,?)", Statement.RETURN_GENERATED_KEYS);

            int idx = 1;
            ps.setString(idx++, usuario.getNombre());
            ps.setString(idx++, usuario.getPassword());
            ps.setString(idx,usuario.getRol());

            int rows = ps.executeUpdate();
            if (rows == 0)
                System.out.println("INSERT de usuario con 0 filas insertadas.");

            rsGenKeys = ps.getGeneratedKeys();
            if (rsGenKeys.next())
                usuario.setIdUsuario(rsGenKeys.getInt(1));

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }
    }

    /**
     * Devuelve lista con todos loa fabricantes.
     */
    @Override
    public List<Usuario> getAll() {

        Connection conn = null;
        Statement s = null;
        ResultSet rs = null;

        List<Usuario> listUsuarios= new ArrayList<>();

        try {
            conn = connectDB();

            // Se utiliza un objeto Statement dado que no hay parámetros en la consulta.
            s = conn.createStatement();

            rs = s.executeQuery("SELECT * FROM usuarios");
            while (rs.next()) {
                Usuario usuario = new Usuario();
                int idx = 1;
                usuario.setIdUsuario(rs.getInt(idx++));
                usuario.setNombre(rs.getString(idx++));
                usuario.setPassword(rs.getString(idx++));
                usuario.setRol(rs.getString(idx));
                listUsuarios.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, s, rs);
        }
        return listUsuarios;

    }

    /**
     * Devuelve Optional de fabricante con el ID dado.
     */
    @Override
    public Optional<Usuario> find(int idUsuario) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE idUsuario = ?");

            int idx =  1;
            ps.setInt(idx, idUsuario);

            rs = ps.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                idx = 1;
                usuario.setIdUsuario(rs.getInt(idx++));
                usuario.setNombre(rs.getString(idx++));
                usuario.setPassword(rs.getString(idx++));
                usuario.setRol(rs.getString(idx));


                return Optional.of(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

        return Optional.empty();

    }
    /**
     * Actualiza fabricante con campos del bean fabricante según ID del mismo.
     */
    @Override
    public void update(Usuario usuario) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("UPDATE usuarios SET nombre = ?,password = ?,rol = ?  WHERE idUsuario = ?");
            int idx = 1;
            ps.setString(idx++, usuario.getNombre());
            ps.setString(idx++, usuario.getPassword());
            ps.setString(idx++,usuario.getRol());
            ps.setInt(idx, usuario.getIdUsuario());

            int rows = ps.executeUpdate();

            if (rows == 0)
                System.out.println("Update de usuario con 0 registros actualizados.");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }

    /**
     * Borra fabricante con ID proporcionado.
     */
    @Override
    public void delete(int idUsuario) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("DELETE FROM usuarios WHERE idUsuario = ?");
            int idx = 1;
            ps.setInt(idx, idUsuario);

            int rows = ps.executeUpdate();

            if (rows == 0)
                System.out.println("Delete de usuario con 0 registros eliminados.");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }


    /**
     * Método que obtiene el hash de una password, por ejemplo, dado password = admin, devuelve:
     8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918
     * @param password
     * @return hash de encriptación de la password
     * @throws NoSuchAlgorithmException
     */
    public static String hashPassword(String password ) throws NoSuchAlgorithmException {
        MessageDigest digest;

        digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedhash = digest.digest(
                password.getBytes(StandardCharsets.UTF_8));

        return bytesToHex(encodedhash);

    }

    private static String bytesToHex(byte[] byteHash) {

        StringBuilder hexString = new StringBuilder(2 * byteHash.length);
        for (int i = 0; i < byteHash.length; i++) {
            String hex = Integer.toHexString(0xff & byteHash[i]);
            if(hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        return hexString.toString();

    }





}
