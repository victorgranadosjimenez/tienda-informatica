<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.Optional"%>
<%@ page import="org.iesbelen.model.FabricanteDTO" %>
<%@ page import="org.iesbelen.model.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle Usuario</title>

</head>
<body>
<style><%@ include file="/css/style.css" %></style>
<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>
<main>
    <section>

        <div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
            <div class="clearfix">
                <div style="float: left; width: 50%">
                    <h1>Detalle Usuario</h1>
                </div>
                <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

                    <div style="position: absolute; left: 39%; top : 39%;">

                        <form action="${pageContext.request.contextPath}/tienda/usuarios" >
                            <input type="submit" value="Volver" />
                        </form>
                    </div>

                </div>
            </div>

            <div class="clearfix">
                <hr/>
            </div>

            <%

                Optional<Usuario> optUser = (Optional<Usuario>)request.getAttribute("usuario");
                //Optional<Integer> optidUser= (Optional<Integer>)request.getAttribute("id");
                if (optUser.isPresent() ) {
                    //&& optidUser.isPresent()
            %>

            <div style="margin-top: 6px;" class="clearfix">
                <div style="float: left;width: 50%">
                    <label>Id</label>
                </div>
                <div style="float: none;width: auto;overflow: hidden;">
                    <input value="<%= optUser.get().getIdUsuario() %>" readonly="readonly"/>
                </div>
            </div>
            <div style="margin-top: 6px;" class="clearfix">
                <div style="float: left;width: 50%">
                    <label>Nombre</label>
                </div>
                <div style="float: none;width: auto;overflow: hidden;">
                    <input value="<%= optUser.get().getNombre() %>" readonly="readonly"/>
                </div>
            </div>
            <div style="margin-top: 6px;" class="clearfix">
                <div style="float: left;width: 50%">
                    <label>Password</label>
                </div>
                <div style="float: none;width: auto;overflow: hidden;">
                    <input value="<%= optUser.get().getPassword() %>" readonly="readonly"/>
                </div>
            </div>
            <div style="margin-top: 6px;" class="clearfix">
                <div style="float: left;width: 50%">
                    <label>Rol</label>
                </div>
                <div style="float: none;width: auto;overflow: hidden;">
                    <input value="<%= optUser.get().getRol() %>" readonly="readonly"/>
                </div>
            </div>


            <% 	} else { %>

            request.sendRedirect("usuarios/");

            <% 	} %>

        </div>
    </section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>