<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
// Obtener la sesión del proyecto
HttpSession MiSesion = request.getSession();

// Eliminar el objeto "cesto" de la sesión
MiSesion.removeAttribute("cesto");

// Redireccionar a la página de inicio
response.sendRedirect("IndexUsuario.jsp");
%>
</body>
</html>