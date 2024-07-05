<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Mantenimiento Administrador</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
		<style>
	        .center-table {
	            margin: 100px	 auto;
	            width: 70%;
	        }
	    </style>
	</head>
<body>
	<%
		BS_Admin ObjU = new BS_Admin();
	    ArrayList<Administrador> Lista = ObjU.Listar();
	    request.setAttribute("Lista", Lista);
	%>
	
    <div class="center-table">
		<table id="tablax" class="table table-striped table-bordered" style="width:100%">
			<thead>
				<tr>
					<th>Código</th>
					<th>Apellidos</th>
					<th>Nombres</th>
					<th>Sexo</th>
					<th>Ver</th>
					<th>Modificar</th>
					<th>Borrar</th>
				</tr>
			</thead>
            <tbody>
                <c:forEach var="admin" items="${Lista}">
                    <tr>
                        <td><c:out value="${admin.id}"/></td>
                        <td><c:out value="${admin.apellidos}"/></td>
                        <td><c:out value="${admin.nombres}"/></td>
                        <td><c:out value="${admin.sexo}"/></td>
						<td><a class="btn btn-primary" href=Man_AdministradorVer.jsp?id=<c:out value="${admin.id}"/>>Ver</a></td>
						<td><a class="btn btn-primary" href=Man_AdministradorEditar.jsp?id=<c:out value="${admin.id}"/>>Modificar</a></td>
						<td><a class="btn btn-primary" href=Man_AdministradorSuprimir.jsp?id=<c:out value="${admin.id}"/>>Borrar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
		<a class="btn btn-primary" href="IndexAdmin.jsp">Regresar al Inicio</a>
		<a class="btn btn-primary" href="Man_AdministradorAdd.jsp">Agregar Administrador</a>
	</div>

</body>
</html>
<%@ include file="components/footer.jsp"%>
<%@ include file="components/tablaxScript.jsp"%>