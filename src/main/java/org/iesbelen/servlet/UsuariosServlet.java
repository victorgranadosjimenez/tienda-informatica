package org.iesbelen.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.iesbelen.dao.FabricanteDAO;
import org.iesbelen.dao.FabricanteDAOImpl;
import org.iesbelen.dao.UsuarioDAO;
import org.iesbelen.dao.UsuarioDAOImpl;
import org.iesbelen.model.Fabricante;
import org.iesbelen.model.FabricanteDTO;
import org.iesbelen.model.Usuario;

@WebServlet(name = "UsuariosServlet", value = "/tienda/usuarios/*")
public class UsuariosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher;

        String pathInfo = request.getPathInfo(); //

        if (pathInfo == null || "/".equals(pathInfo)) {
            UsuarioDAO userDAO = new UsuarioDAOImpl();

            //GET
            //	/usuarios/
            //	/usuarios

            request.setAttribute("listaUsuarios", userDAO.getAll());
            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");

        } else {
            pathInfo = pathInfo.replaceAll("/$", "");
            String[] pathParts = pathInfo.split("/");

            if (pathParts.length == 2 && "crear".equals(pathParts[1])) {

                // GET
                // /usuarios/crear
                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/crear-usuario.jsp");

            } else if (pathParts.length == 2) {
                UsuarioDAO userDAO = new UsuarioDAOImpl();
                // GET
                // /usuarios/{id}
                try {

                    request.setAttribute("usuario",userDAO.find(Integer.parseInt(pathParts[1])));
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/detalle-usuario.jsp");

                } catch (NumberFormatException nfe) {
                    nfe.printStackTrace();
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
                }
            } else if (pathParts.length == 3 && "editar".equals(pathParts[1]) ) {
                UsuarioDAO userDAO = new UsuarioDAOImpl();

                // GET
                // /usuarios/editar/{id}
                try {
                    request.setAttribute("usuario",userDAO.find(Integer.parseInt(pathParts[2])));
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/editar-usuario.jsp");

                } catch (NumberFormatException nfe) {
                    nfe.printStackTrace();
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
                }
            } else {
                System.out.println("Opción POST no soportada.");
                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");

            }
        }

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher;
        String __method__ = request.getParameter("__method__");

        if (__method__ == null) {    //PARA EL CREAR

            UsuarioDAO userDAO = new UsuarioDAOImpl();

            String nombre = request.getParameter("nombre");
            String password = request.getParameter("password");
            try {
                password = UsuarioDAOImpl.hashPassword(password);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
            String rol = request.getParameter("rol");

            Usuario nuevoUser = new Usuario();

            nuevoUser.setNombre(nombre);
            nuevoUser.setPassword(password);
            nuevoUser.setRol(rol);

            userDAO.create(nuevoUser);


        } else if (__method__ != null && "put".equalsIgnoreCase(__method__)) {  //ACTUALIZAR
            doPut(request, response);

        } else if (__method__ != null && "delete".equalsIgnoreCase(__method__)) {  //DELETE
            doDelete(request, response);
        } else {
            System.out.println("Opción POST no soportada.");
        }

        //response.sendRedirect("../../../tienda/usuarios");
        response.sendRedirect(request.getContextPath() + "/tienda/usuarios");
    }

    //EDITAR
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioDAO userDAO = new UsuarioDAOImpl();
        String nombre = request.getParameter("nombre");
        String password = request.getParameter("password");
        try {
            password = UsuarioDAOImpl.hashPassword(password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        String rol = request.getParameter("rol");
        String id = request.getParameter("id");

        Usuario nuevoUser = new Usuario();

        try {
            nuevoUser.setNombre(nombre);
            nuevoUser.setPassword(password);
            nuevoUser.setRol(rol);
            nuevoUser.setIdUsuario(Integer.parseInt(id));
            userDAO.update(nuevoUser);

        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
    {
        RequestDispatcher dispatcher;
        UsuarioDAO userDAO = new UsuarioDAOImpl();

        String idUsuario = request.getParameter("id");

        try {
            int id = Integer.parseInt(idUsuario);

            userDAO.delete(id);

        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }
    }
}
