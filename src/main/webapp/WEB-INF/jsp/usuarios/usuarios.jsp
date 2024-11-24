<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.List"%>
<%@ page import="org.iesbelen.model.FabricanteDTO" %>
<%@ page import="org.iesbelen.model.Usuario" %>
<%@ page import="java.util.UUID" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Usuarios</title>
	<style>
		.clearfix::after {
			content: "";
			display: block;
			clear: both;
		}
	</style>
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
				<h1>Usuarios</h1>
			</div>
			<div style="float: none;width: auto;overflow: hidden;min-height: 100px;position: relative;">
				<div style="position: absolute;display: inline-flex; left: 19%; top : 19%;">
				<form action="${pageContext.request.contextPath}/tienda/usuarios/crear">
					<input type="submit" value="Crear">
				</form>
				</div>
			</div>

		</div>


		<div class="clearfix">
			<hr/>
		</div>
		<div class="clearfix">
			<div style="float: left;width: 25%">Id</div>
			<div style="float: left;width: 25%">Nombre</div>
			<div style="float: left;width: 25%">Password</div>
			<div style="float: none;width: auto;overflow: hidden;">Rol</div>
		</div>
		<div class="clearfix">
			<hr/>
		</div>


		<%

			if (request.getAttribute("listaUsuarios") != null
			  && (!((List<Usuario>) request.getAttribute("listaUsuarios")).isEmpty()))
			{
				List<Usuario> listaUsuarios = (List<Usuario>)request.getAttribute("listaUsuarios");

				for (Usuario usuario : listaUsuarios) {
		%>
		<div style="margin-top: 6px;" class="clearfix">
			<div style="float: left;width: 25%"><%= usuario.getIdUsuario()%></div>
			<div style="float: left;width: 25%"><%= usuario.getNombre()%></div>
			<div style="float: left;width: 25%"><%= usuario.getPassword().substring(0,4)+"**********" %></div>
			<div style="float: none;width: auto;overflow: hidden;">
				<form action="${pageContext.request.contextPath}/tienda/usuarios/<%= usuario.getIdUsuario()%>" style="display: inline;">
					<input type="submit" value="Ver Detalle"/>

				</form>
				<form action="${pageContext.request.contextPath}/tienda/usuarios/editar/<%= usuario.getIdUsuario()%>" style="display: inline;">
					<input type="submit" value="Editar" />
				</form>
				<form action="${pageContext.request.contextPath}/tienda/usuarios/borrar/" method="post" style="display: inline;">
					<input type="hidden" name="__method__" value="delete"/>
					<input type="hidden" name="id" value="<%= usuario.getIdUsuario()%>"/>
					<input type="submit" value="Eliminar" />
				</form>
			</div>
		</div>

		<%
			}
		} else {
		%>
		No hay registros de usuarios
		<% } %>


	</div>
	</section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>