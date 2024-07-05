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
	<div class="center-table ">
	<h1>REGISTRAR PRODUCTO</h1>
	<form action="grabarProducto">
		<input type="hidden" name="op" value="3" />
		<table class="table table-striped table-bordered">
			<tr>
				<td>Categoria:</td><td><input type="text" name="txtcat" maxlength="6" required/></td>
			</tr>
			<tr>
				<td>Nombre:</td><td><input type="text" name="txtnom" maxlength="100" required/></td>
			</tr>
			<tr>
				<td>Precio</td><td><input type="number" name="txtpre" required/></td>
			</tr>
			<tr>
				<td>Stock</td><td><input type="number" name="txtsto" required/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Grabar" /></td>
			</tr>
		</table>
	</form>
	<a href=MantenerProducto.jsp>Regresar al Listado</a>
	</div>
</body>
</html>