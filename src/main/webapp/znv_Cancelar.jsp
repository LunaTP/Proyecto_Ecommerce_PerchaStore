<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
// Obtener la sesi�n del proyecto
HttpSession MiSesion = request.getSession();

// Eliminar el objeto "cesto" de la sesi�n
MiSesion.removeAttribute("cesto");

// Redireccionar a la p�gina de inicio
response.sendRedirect("IndexUsuario.jsp");
%>
</body>
</html>