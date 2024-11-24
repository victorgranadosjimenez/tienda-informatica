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
    <title>Login</title>

</head>
<body>
<style><%@ include file="/css/style.css" %></style>
<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>
<main>
    <section>

        <div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
            <div class="clearfix">

            <form action="${pageContext.request.contextPath}/tienda/login/comprobacion/">
                <div class="clearfix">
                    <div style="float: left; width: 50%">
                        <h1>Login</h1>
                    </div>
                    <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

                        <div style="position: absolute; left: 39%; top : 39%;">
                            <input type="submit" value="Login"/>
                        </div>

                    </div>
                </div>

                <div class="clearfix">
                    <hr/>
                </div>

                <div style="margin-top: 6px;" class="clearfix">
                    <div style="float: left;width: 50%">
                        Nombre
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


                </div>

            </form>




        </div>
    </section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>
