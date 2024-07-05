<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>
<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="Model.Productos" %>
<!DOCTYPE html>
<html>
<head>
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
			String Id = request.getParameter("id");
			BS_Productos ObjBD = new BS_Productos();
			Productos ObjC = new Productos();
			ObjC = ObjBD.Buscar(Id);
	%>
	<div class="center-table ">
		<h2>PRODUCTO: <%=ObjC.getDescripcion() %></h2>
		<form action="grabarProducto">
		<input type=hidden name=op value=1 />
			<table class="table table-striped table-bordered">		
					<tr>
						<td>Código</td>
						<td><%=ObjC.getIdProducto()%></td>
					</tr>
					<tr>
						<td>Categoria</td>
						<td><%=ObjC.getIdCategoria()%></td>
					</tr>
					<tr>
						<td>Nombre</td>
						<td><%=ObjC.getDescripcion()%></td>
					</tr>
					<tr>
						<td>Precio</td>
						<td><%=ObjC.getPrecioUnidad()%></td>
					</tr>
					<tr>
						<td>Stock</td>
						<td><%=ObjC.getStock()%></td>
					</tr>

			</table>		
		</form>
		<a class="btn btn-primary" href='MantenerProducto.jsp'>Regresar a Lista</a>
	</div>
</body>
</html>
<%@ include file="components/footer.jsp"%>
