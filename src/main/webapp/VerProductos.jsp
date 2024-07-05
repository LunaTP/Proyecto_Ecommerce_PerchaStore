<%@ page session="true"%>
<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="components/head.jsp"%>
<body>
<%@ include file="components/nav.jsp"%>
	<%
		HttpSession sesion = request.getSession();
		String IdCat = request.getParameter("id");
		BS_Productos ObjBD = new BS_Productos();
		List<Productos> Lista = new ArrayList<>();
		Lista = ObjBD.ListarProductos(IdCat);
		int columnas = 0;
	%>

	<section>
	    <div class="container px-5 pt-5">
	        <div class="row gx-5 align-items-center">
	            <% for(Productos p : Lista){ %>
	                <div class="col-lg-6">
	                    <div class="p-5">
	                        <h2 class="display-4"><%=p.getDescripcion()%></h2>
	                        
	                        <% String imagen = "<img src=img/" + p.getImagen() + " width=150 height=150>"; %>
	                        <%=imagen%>
	                        <% String enlace = "<a href=VerDetalle.jsp?id=" + p.getIdProducto() + 
	                                        " class='btn btn-warning'>Ver Detalle</a>"; %>
	                        <%=enlace%>
	                    </div>
	                </div>
	            <% } %>
	        </div>
	    </div>
	</section>		
	<div class="col-md-12 d-flex justify-content-center pb-4">
		<button href="javascript:history.back()" class='btn btn-info '><a href="javascript:history.back()">Seleccionar Otra Categoria</a></button>
	</div>	
</body>
<%@ include file="components/footer.jsp"%>