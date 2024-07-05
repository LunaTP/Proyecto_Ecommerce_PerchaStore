<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>

<body>
	<%
		String IdPro = request.getParameter("id");
		BS_Productos ObjBD = new BS_Productos();
		Productos ObjP = new Productos();
		ObjP = ObjBD.InfoProducto(IdPro);
	%>
	<div class="container mt-5 pt-5">
	    <div class="row justify-content-center">
	        <div class="col-md-8 pt-5">
	            <form action="VerCarrito.jsp">
	                <table class="table ">
	                    <tr>
	                        <td>IdProducto</td><td class="col-md-6 pr-0"><input name="txtid" value=<%=ObjP.getIdProducto()%> readonly/></td>
	                    </tr>
	                    <tr>
	                        <td>Descripcion</td><td class="col-md-6 pr-0"><%=ObjP.getDescripcion()%></td>
	                    </tr>
	                    <tr>
	                        <td>Precio Unidad</td class="col-md-6 pr-0"><td><%=ObjP.getPrecioUnidad()%></td>
	                    </tr>
	                    <tr>
	                        <td class="align-middle">Imagen</td><td class="col-md-6 pr-0"><img src=img/<%=ObjP.getImagen()%> width=200 height=200/></td>
	                    </tr>
	                    <tr>
	                        <td>Cantidad</td><td class="col-md-6 pr-0"><input name="txtcant"/></td>
	                    </tr>
	                    <tr class="d-flex justify-content-center pt-4">
	                        <td><input type="submit" value="Añadir al Carrito" class="btn btn-success"/></td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-12 d-flex justify-content-center pb-4">
		<button class='btn btn-info '>
		<a href="javascript:history.back()">Seleccionar otro producto</a>
		</button>
	</div>	
</body>
<%@ include file="components/footer.jsp"%>