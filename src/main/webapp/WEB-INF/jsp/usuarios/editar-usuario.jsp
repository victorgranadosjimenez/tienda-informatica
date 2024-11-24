<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.Optional"%>
<%@ page import="org.iesbelen.model.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>

</head>
<body>
<style><%@ include file="/css/style.css" %></style>
<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>
<main>
    <section>
        <div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
            <form action="${pageContext.request.contextPath}/tienda/usuarios/editar/" method="post" >
                <input type="hidden" name="__method__" value="put" />
                <div class="clearfix">
                    <div style="float: left; width: 50%">
                        <h1>Editar Usuarios</h1>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

                        <div style="position: absolute; left: 39%; top : 39%;">
                            <input type="submit" value="Guardar" />
                        </div>

                    </div>
                </div>

                <div class="clearfix">
                    <hr/>
                </div>

                <% 	Optional<Usuario> optUser = (Optional<Usuario>)request.getAttribute("usuario");
                    if (optUser.isPresent()) {
                %>

                <div style="margin-top: 6px;" class="clearfix">
                    <div style="float: left;width: 50%">
                        <label>id</label>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="id" value="<%= optUser.get().getIdUsuario() %>" readonly="readonly"/>
                    </div>
                </div>
                <div style="margin-top: 6px;" class="clearfix">
                    <div style="float: left;width: 50%">
                        <label>Nombre</label>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="nombre" value="<%= optUser.get().getNombre() %>"/>
                    </div>
                </div>
                <div style="margin-top: 6px;" class="clearfix">
                    <div style="float: left;width: 50%">
                        <label>Password</label>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="password" value="<%= optUser.get().getPassword() %>"/>
                    </div>
                </div>
                <div style="margin-top: 6px;" class="clearfix">
                    <div style="float: left;width: 50%">
                        <label>Rol</label>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="rol" value="<%= optUser.get().getRol() %>"/>
                    </div>
                </div>

                <% 	} else { %>

                request.sendRedirect("usuarios/");

                <% 	} %>
            </form>
        </div>
    </section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>