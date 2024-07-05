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
		<h2>ELIMINAR PRODUCTO</h2>
		<form action="grabarProducto">
		<input type=hidden name=op value=2 />
			<table class="table table-striped table-bordered">		
					<tr>
						<td>Código</td>
						<td><input name=txtcod value=<%=ObjC.getIdProducto() %> readonly /></td>
					</tr>
					<tr>
						<td>Categoria</td>
						<td><input name=txtcat value='<%=ObjC.getIdCategoria()%>' readonly/></td>
					</tr>
					<tr>
						<td>Nombres</td>
						<td><input name=txtnom value=<%=ObjC.getDescripcion()%> readonly/></td>
					</tr>
					<tr>
						<td>Precio</td>
						<td><input name=txtpre value=<%=ObjC.getPrecioUnidad()%> readonly/></td>
					</tr>
					<tr>
						<td>Stock</td>
						<td><input name=txtsto value=<%=ObjC.getStock()%> readonly/></td>
					</tr>

					<tr>
						<td colspan="2"><input class="btn btn-primary" type=submit value=Confirmar /></td>
					</tr>
			</table>		
		</form>
		<a class="btn btn-primary" href='MantenerProducto.jsp'>Regresar a Lista</a>
	</div>
</body>
</html>