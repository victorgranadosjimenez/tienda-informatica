
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.Optional"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear usuario</title>

</head>
<body>
<style><%@ include file="/css/style.css" %></style>
<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>
<main>
    <section>

        <div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
            <form action="${pageContext.request.contextPath}/tienda/usuarios/crear/" method="post">
                <div class="clearfix">
                    <div style="float: left; width: 50%">
                        <h1>Crear Usuario</h1>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

                        <div style="position: absolute; left: 39%; top : 39%;">
                            <input type="submit" value="Crear"/>
                        </div>

                    </div>
                </div>

                <div class="clearfix">
                    <hr/>
                </div>

                <div style="margin-top: 6px;" class="clearfix">
                    <div style="float: left;width: 50%">
                        Nombre del usuario
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="nombre" />
                    </div>
                    <div style="float: left;width: 50%">
                        Password
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="password" />
                    </div>

                    <div style="float: left;width: 50%">
                        Rol
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;">
                        <input name="rol" />
                    </div>
                </div>

            </form>
        </div>
    </section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>