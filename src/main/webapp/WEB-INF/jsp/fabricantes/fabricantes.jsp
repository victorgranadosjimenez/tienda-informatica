<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.List"%>
<%@ page import="org.iesbelen.model.FabricanteDTO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Fabricantes</title>
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
				<h1>Fabricantes</h1>

			</div>
			<div style="float: none;width: auto;overflow: hidden;min-height: 100px;position: relative;">
				<div style="position: absolute;display: inline-flex; left: 19%; top : 19%;">
					
					<form action="${pageContext.request.contextPath}/tienda/fabricantes/crear">
						<input type="submit" value="Crear">
					</form>
					<form action="${pageContext.request.contextPath}/tienda/fabricantes" style="margin-left: 40px;">

						<input type="submit" value="Mostrar">
						</br>
						ordenar-por
						<select name="ordenar-por">
							<option value="nombre">nombre</option>
							<option value="codigo">código</option>
						</select>
						</br>
						modo
						<select name="modo">
							<option value="asc">asc</option>
							<option value="desc">desc</option>
						</select>

					</form>
				</div>
				
			</div>
		</div>
		<div class="clearfix">
			<hr/>
		</div>
		<div class="clearfix">
			<div style="float: left;width: 25%">Código</div>
			<div style="float: left;width: 25%">Nombre</div>
			<div style="float: left;width: 25%">Número Productos</div>
			<div style="float: none;width: auto;overflow: hidden;">Acción</div>
		</div>
		<div class="clearfix">
			<hr/>
		</div>
	<%
		//List<FabricanteDTO> listaFabricanteDTO = (List<FabricanteDTO>)request.getAttribute("listaFabricantesDTO");
		//List<Fabricante> listaFabricante = (List<Fabricante>)request.getAttribute("listaFabricantes");
		if (request.getAttribute("listaEjercicioOpcional") != null) {
		List<FabricanteDTO> listaFabricanteDTO = (List<FabricanteDTO>)request.getAttribute("listaEjercicioOpcional");
		List<FabricanteDTO> usar;
		usar = listaFabricanteDTO;

			if (request.getAttribute("fabricantesOrdenNombresAsc") != null) {
				List<FabricanteDTO> fabricantesOrdenNombresAsc = (List<FabricanteDTO>) request.getAttribute("fabricantesOrdenNombresAsc");
				usar = fabricantesOrdenNombresAsc;
			}
			if (request.getAttribute("fabricantesOrdenNombresDesc") != null) {
				List<FabricanteDTO> fabricantesOrdenNombresDesc = (List<FabricanteDTO>) request.getAttribute("fabricantesOrdenNombresDesc");
				usar = fabricantesOrdenNombresDesc;
			}
			if (request.getAttribute("fabricantesOrdenIdAsc") != null) {
				List<FabricanteDTO> fabricantesOrdenIdAsc = (List<FabricanteDTO>) request.getAttribute("fabricantesOrdenIdAsc");
				usar = fabricantesOrdenIdAsc;
			}
			if (request.getAttribute("fabricantesOrdenIdDesc") != null) {
				List<FabricanteDTO> fabricantesOrdenIdDesc = (List<FabricanteDTO>) request.getAttribute("fabricantesOrdenIdDesc");
				usar = fabricantesOrdenIdDesc;
			}

			for (FabricanteDTO fabricanteDTO : usar) {
    %>

		<div style="margin-top: 6px;" class="clearfix">
			<div style="float: left;width: 25%"><%= fabricanteDTO.getIdFabricante()%></div>
			<div style="float: left;width: 25%"><%= fabricanteDTO.getNombre()%></div>
			<div style="float: left;width: 25%"><%= fabricanteDTO.getNumProductos() %></div>
			<div style="float: none;width: auto;overflow: hidden;">
				<form action="${pageContext.request.contextPath}/tienda/fabricantes/<%= fabricanteDTO.getIdFabricante()%>" style="display: inline;">
    				<input type="submit" value="Ver Detalle" />
				</form>
				<form action="${pageContext.request.contextPath}/tienda/fabricantes/editar/<%= fabricanteDTO.getIdFabricante()%>" style="display: inline;">
    				<input type="submit" value="Editar" />
				</form>
				<form action="${pageContext.request.contextPath}/tienda/fabricantes/borrar/" method="post" style="display: inline;">
					<input type="hidden" name="__method__" value="delete"/>
					<input type="hidden" name="codigo" value="<%= fabricanteDTO.getIdFabricante()%>"/>
    				<input type="submit" value="Eliminar" />
				</form>
			</div>
		</div>

	<%
		}
        } else { 
    %>
		No hay registros de fabricante
	<% } %>
	</div>

	</section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>