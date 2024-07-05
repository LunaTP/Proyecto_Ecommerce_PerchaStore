<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>
<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="Model.Administrador" %>
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
	<h1>REGISTRAR COLABORADOR</h1>
	<form action="grabarAdmin">
		<input type="hidden" name="op" value="3" />
		<table class="table table-striped table-bordered">
			<tr>
				<td>Apellidos:</td><td><input type="text" name="txtape" maxlength="50"/></td>
			</tr>
			<tr>
				<td>Nombre:</td><td><input type="text" name="txtnom" maxlength="50"/></td>
			</tr>
			<tr>
				<td>Sexo:</td><td><input type="text" name="txtsex" maxlength="1"/></td>
			</tr>
			<tr>
				<td>Contraseña</td><td><input type="password" name="txtcontra" maxlength="50" required/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Grabar" /></td>
			</tr>
		</table>
	</form>
	<a href=MantenerAdmin.jsp>Regresar al Listado</a>
	</div>
</body>
</html>
<%@ include file="components/footer.jsp"%>