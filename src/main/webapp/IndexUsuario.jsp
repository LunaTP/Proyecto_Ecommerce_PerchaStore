<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="Model.Categorias" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="components/head.jsp" %>

<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container px-5">
			<a class="navbar-brand" href="IndexUsuario.jsp">Percha Store</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span
					class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="Index.jsp">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>

<%@ include file="components/header.jsp"%>

	<%
		BS_Productos ObjBD = new BS_Productos();
		List<Categorias> Lista = new ArrayList<>();
		Lista = ObjBD.ListarCategorias();
		int columnas = 0;
	%>	
	
	<section>
    <div class="container px-5">
        <div class="row gx-5 align-items-center">
            <% for(Categorias c : Lista){ %>
                <div class="col-lg-6">
                    <div class="p-5">
                        <h2 class="display-4"><%=c.getDescripcion()%></h2>
                        
                        <% String imagen = "<img src=img/" + c.getImagen() + " width=150 height=150>"; %>
                        <%=imagen%>
                        <% String enlace = "<a href=VerProductos.jsp?id=" + c.getIdCategoria() + 
                                        " class='btn btn-danger'>Ver Productos</a>"; %>
                        <%=enlace%>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</section>
</body>
<%@ include file="components/footer.jsp"%>
