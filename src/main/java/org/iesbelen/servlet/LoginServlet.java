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

@WebServlet(name = "LoginServlet", value = "/tienda/login/*")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = null;

        String pathInfo = request.getPathInfo(); //

        if (pathInfo == null || "/".equals(pathInfo)) {  //GET de /login/
            UsuarioDAO userDAO = new UsuarioDAOImpl();

            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login/login.jsp");

        } else {
            pathInfo = pathInfo.replaceAll("/$", "");
            String[] pathParts = pathInfo.split("/");

            if (pathParts.length == 2 && "comprobacion".equals(pathParts[1])) {  // GET de /login/comprobacion

                String nombre = request.getParameter("nombre");
                String password = request.getParameter("password");

                try {
                    password = UsuarioDAOImpl.hashPassword(password);
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }

                UsuarioDAO userDao = new UsuarioDAOImpl();

                List<Usuario> listaUsuarios = userDao.getAll();

                String comprobacion = "";
                for (Usuario usuario : listaUsuarios) {
                    if (nombre.equals(usuario.getNombre()) && password.equals(usuario.getPassword())) {
                        //request.getSession().setAttribute("usuario", usuario);
                        request.setAttribute("comprobacion","Se ha conectado con éxito");
                    }else{
                        request.setAttribute("comprobacion","Nombre o password incorrecto");
                    }
                }

                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login/comprobacion.jsp");
            }


            }


        dispatcher.forward(request, response);
    }

}
