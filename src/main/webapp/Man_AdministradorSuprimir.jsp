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
	<%
		String Id = request.getParameter("id");
		BS_Admin ObjBD = new BS_Admin();
		Administrador ObjC = new Administrador();
		ObjC = ObjBD.Buscar(Id);
	%>	
	<div class="center-table ">
		<h2>ELIMINAR ADMIN</h2>
		<form action="grabarAdmin">
		<input type=hidden name=op value=2 />
			<table class="table table-striped table-bordered">		
					<tr>
						<td>Código</td>
						<td><input name=txtid value=<%=ObjC.getId() %> readonly /></td>
					</tr>
					<tr>
						<td>Apellidos</td>
						<td><input name=txtape value='<%=ObjC.getApellidos()%>' readonly/></td>
					</tr>
					<tr>
						<td>Nombres</td>
						<td><input name=txtnom value=<%=ObjC.getNombres()%> readonly/></td>
					</tr>
					<tr>
						<td>Sexo</td>
						<td><input name=txtsex value=<%=ObjC.getSexo()%> readonly/></td>
					</tr>
					<tr>
						<td>Tipo</td>
						<td><input name=txttipo value=<%=ObjC.getTipo()%> readonly/></td>
					</tr>
					<tr>
						<td>Contraseña</td>
						<td><input name=txtcontra value=<%=ObjC.getContrasena()%> readonly/></td>
					</tr>
					<tr>
						<td colspan="2"><input class="btn btn-primary" type=submit value=Confirmar /></td>
					</tr>
			</table>		
		</form>
		<a class="btn btn-primary" href='MantenerAdmin.jsp'>Regresar a Lista</a>
	</div>
</body>
</html>
<%@ include file="components/footer.jsp"%>