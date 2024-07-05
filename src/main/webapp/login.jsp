<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page session="true" %>
<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>
<!DOCTYPE html>
<html>
	<head>	
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	<body>
	<div class="sss col-lg-3">
	    <form action="login.jsp" method="post"class="login-form">
			<div class="form-group text-center">
				<i class="fa-solid fa-user fa-lg"></i>
				<p><strong>Bienvenido al Sistema de Login</strong></p>
			</div>
			
			<div class="form-group">
		        <label for="nombreUsuario">Nombre:</label>
		        <input class="form-control" type="text" id="nombreUsuario" name="nombreUsuario" required>
	        </div>
	        <div class="form-group">
		        <label for="contrasena">Contraseña:</label>
		        <input class="form-control" type="password" id="contrasena" name="contrasena" required>
	        </div>
	        <input class="btn btn-danger btn-block" type="submit" value="Iniciar sesión">
	            <p>¿No tienes cuenta? <a href="signup.jsp">Regístrate aquí.</a></p>
	    </form>
	


    <%
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");

        // Validar si se han ingresado datos en los campos
        if (nombreUsuario == null || contrasena == null || nombreUsuario.trim().isEmpty() || contrasena.trim().isEmpty()) {
    %>
            <p class="error-message">Por favor, ingresa nombre de usuario y contraseña.</p>
    <%
        } else {
            // Si se han ingresado datos, proceder con la autenticación
            controller_Usuarios UM = new controller_Usuarios();
            Usuarios usuario = UM.autenticarUsuario(nombreUsuario, contrasena);
            
            controller_Admin AM =  new controller_Admin();
            Administrador admin =  AM.autentiticarUsuario(nombreUsuario, contrasena);

            if (usuario != null || admin != null) {
                // Usuario autenticado, redirige según el tipo de usuario
                if (admin != null && "Admin".equals(admin.getTipo())) {
                    // Redirige a la página de administrador
                    response.sendRedirect("IndexAdmin.jsp");
                } else if (usuario != null && "Usuario".equals(usuario.getTipo())) {
                    // Redirige a la página de usuario normal
                    response.sendRedirect("IndexUsuario.jsp");
                }
            } else {
    %>
                <p>Usuario no encontrado. Verifica tus credenciales.</p>
    <%
            }
        }
    %>
	</div>
	
</body>
<%@ include file="components/footer.jsp"%>
</html>