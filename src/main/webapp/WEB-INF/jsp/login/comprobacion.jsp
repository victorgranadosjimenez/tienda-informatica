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
        <div style="float: left; width: 50%">
          <h1>Login</h1>
          <div class="clearfix">
            <hr/>
          </div>
          <% String comprobacion = (String) request.getAttribute("comprobacion");%>
          <h3>  <%=comprobacion%>  </h3>

        </div>
      </div>










    </div>
  </section>
</main>
<%@ include file ="/WEB-INF/jsp/fragmentos/footer.jspf"%>
</body>
</html>