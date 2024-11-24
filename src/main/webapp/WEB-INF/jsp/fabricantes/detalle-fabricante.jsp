<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.Optional"%>
<%@ page import="org.iesbelen.model.FabricanteDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalle Fabricante</title>

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
				<h1>Detalle Fabricante</h1>
			</div>
			<div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">
				
				<div style="position: absolute; left: 39%; top : 39%;">
					
						<form action="${pageContext.request.contextPath}/tienda/fabricantes" >
							<input type="submit" value="Volver" />
						</form>
					</div>
				
			</div>
		</div>
		
		<div class="clearfix">
			<hr/>
		</div>
		
		<% 	Optional<Fabricante> optFab = (Optional<Fabricante>)request.getAttribute("fabricante");
			Optional<Integer> optNumProd= (Optional<Integer>)request.getAttribute("numProd");
			if (optFab.isPresent() && optNumProd.isPresent()) {
		%>
		
		<div style="margin-top: 6px;" class="clearfix">
			<div style="float: left;width: 50%">
				<label>Código</label>
			</div>
			<div style="float: none;width: auto;overflow: hidden;">
				<input value="<%= optFab.get().getIdFabricante() %>" readonly="readonly"/>
			</div> 
		</div>
		<div style="margin-top: 6px;" class="clearfix">
			<div style="float: left;width: 50%">
				<label>Nombre</label>
			</div>
			<div style="float: none;width: auto;overflow: hidden;">
				<input value="<%= optFab.get().getNombre() %>" readonly="readonly"/>
			</div> 
		</div>
	<!--nuevo campo número de productos-->
	<div style="margin-top: 6px;" class="clearfix">
		<div style="float: left;width: 50%">
			<label>Número de Productos</label>
		</div>
		<div style="float: none;width: auto;overflow: hidden;">
			<input value="<%= optNumProd.get()%>" readonly="readonly"/>
		</div>
	</div>
		
		<% 	} else { %>
			
				request.sendRedirect("fabricantes/");
		
		<% 	} %>
		
</div>
</section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>