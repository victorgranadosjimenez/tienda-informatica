package org.iesbelen.dao;

import java.util.List;
import java.util.Optional;


import org.iesbelen.model.Usuario;

public interface UsuarioDAO {

    public void create(Usuario usuario);

    public List<Usuario> getAll();

    public Optional<Usuario> find(int id);

    public void update(Usuario usuario);

    public void delete(int idUsuario);


}