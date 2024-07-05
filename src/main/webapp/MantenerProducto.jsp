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
		<title>Mantenimiento Producto</title>
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
		BS_Productos ObjU = new BS_Productos();
	    ArrayList<Productos> Lista = ObjU.todo();
	    request.setAttribute("Lista", Lista);
	%>
	
    <div class="center-table">
		<table id="tablax" class="table table-striped table-bordered" style="width:100%">
			<thead>
				<tr>
					<th>Código</th>
					<th>Categoría</th>
					<th>Nombre</th>
					<th>Precio Unidad</th>
					<th>Stock</th>
					<th>Ver</th>
					<th>Modificar</th>
					<th>Borrar</th>
				</tr>
			</thead>
            <tbody>
                <c:forEach var="usuario" items="${Lista}">
                    <tr>
                        <td><c:out value="${usuario.idProducto}"/></td>
                        <td><c:out value="${usuario.idCategoria}"/></td>  
                        <td><c:out value="${usuario.descripcion}"/></td>  
                        <td><c:out value="${usuario.precioUnidad}"/></td>  
                        <td><c:out value="${usuario.stock}"/></td> 
						<td><a class="btn btn-primary" href=Man_ProductoVer.jsp?id=<c:out value="${usuario.idProducto}"/>>Ver</a></td>
						<td><a class="btn btn-primary" href=Man_ProductoEditar.jsp?id=<c:out value="${usuario.idProducto}"/>>Modificar</a></td>
						<td><a class="btn btn-primary" href=Man_ProductoSuprimir.jsp?id=<c:out value="${usuario.idProducto}"/>>Borrar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
		<a class="btn btn-primary" href="IndexAdmin.jsp">Regresar al Inicio</a>
		<a class="btn btn-primary" href="Man_ProductoAdd.jsp">Agregar Producto</a>
	</div>

</body>
</html>
<%@ include file="components/footer.jsp"%>
<%@ include file="components/tablaxScript.jsp"%>