<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>
<%@ page import="Controller.BS_Admin" %>
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
		<h2>ADMIN: <%=ObjC.getNombres()%></h2>
		<form action="grabarAdmin">
		<input type=hidden name=op value=1 />
			<table class="table table-striped table-bordered">		
					<tr>
						<td>Código</td>
						<td><%=ObjC.getId()%></td>
					</tr>
					<tr>
						<td>Apellidos</td>
						<td><%=ObjC.getApellidos()%></td>
					</tr>
					<tr>
						<td>Nombres</td>
						<td><%=ObjC.getNombres()%></td>
					</tr>
					<tr>
						<td>Sexo</td>
						<td><%=ObjC.getSexo()%></td>
					</tr>
					<tr>
						<td>Tipo</td>
						<td><%=ObjC.getTipo()%> </td>
					</tr>
					<tr>
						<td>Contraseña</td>
						<td><%=ObjC.getContrasena()%></td>
					</tr>

			</table>		
		</form>
		<a class="btn btn-primary" href='MantenerAdmin.jsp'>Regresar a Lista</a>
	</div>
</body>
</html>
<%@ include file="components/footer.jsp"%>
