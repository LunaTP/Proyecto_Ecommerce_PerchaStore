<%@ page session="true" %>
<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="Model.*"%>

<%@ include file="components/head.jsp"%>

<head>
  <style>
    .custom-table {
      max-width: 900px;
      margin: auto;
    }
    th {
      text-align: center;
      font-size: 1.2em; 
    }
  </style>
</head>
<body>
<%@ include file="components/nav.jsp"%>
<%@ include file="components/header.jsp"%>
  <div class="container my-5">
    <table class="table table-bordered custom-table">
      <thead class="thead-dark">
        <tr>
          <th colspan="2">MANTENIMIENTO DE USUARIOS Y ADMINISTRADORES</th>
        </tr>
      </thead>
      <tbody>
        <tr class="table-Active">
          <td class="w-50 align-middle py-5"><a href="MantenerUsuario.jsp" class="btn btn-dark btn-block">IR A USUARIOS</a></td>
          <td class="w-50 align-middle py-5"><a href="MantenerAdmin.jsp" class="btn btn-dark btn-block">IR A ADMINISTRADORES</a></td>
        </tr>
      </tbody>
      <thead class="thead-dark">
        <tr>
          <th colspan="2">MANTENIMIENTO DE PRODUCTOS</th>
        </tr>
      </thead>
      <tbody>
        <tr class="table-Active">
          <td class="align-middle py-5"colspan="2"><a href="MantenerProducto.jsp" class="btn btn-dark btn-block">IR A PRODUCTOS</a></td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
<%@ include file="components/footer.jsp"%>
