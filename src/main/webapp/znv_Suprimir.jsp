<%@ page session="true" %>
<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="Negocio.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Carrito de Compras</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	</head>
<body>
	    <div class="container px-5" style="margin-top:100px; min-height:600px;">
        <div class="row gx-5 align-items-center" >
	<% 
	
        String idProductoEliminar = request.getParameter("id");
        HttpSession MiSesion = request.getSession();
        
        ArrayList<Carrito> carritoCompras = (ArrayList<Carrito>) MiSesion.getAttribute("cesto");
        carritoCompras.removeIf(item -> item.getIdProducto().equals(idProductoEliminar));
        MiSesion.setAttribute("cesto", carritoCompras);
        String enlace1 = "<a href='IndexUsuario.jsp'>Seguir Comprando</a>";
        String enlace2 = "<a href='znv_Cancelar.jsp'>Cancelar Compra</a>";

        BS_Productos carritoBD = new BS_Productos();		
        String tabla = "<table class='table'>";
        tabla += "<tr bgcolor=Yellow>";
            tabla += "<th>Item</th>";
            tabla += "<th>IdProducto</th>";
            tabla += "<th>Descripcion</th>";
            tabla += "<th>Imagen</th>";
            tabla += "<th>Precio</th>";
            tabla += "<th>Cantidad</th>";
            tabla += "<th>Sub-Total</th>";
            tabla += "<th>Opciones</th>";
        tabla += "</tr>";
        double Total = 0; int i;
        // Recorrer todos los productos de Lista
        for(i = 0; i < carritoCompras.size(); i++){
            Productos Obj = new Productos();
            // Recuperar la informacion de cada producto del cesto
            Obj = carritoBD.InfoProducto(carritoCompras.get(i).getIdProducto());
            String enlace = "znv_Suprimir.jsp?id="+Obj.getIdProducto();
            double Precio = Obj.getPrecioUnidad();
            int Cantidad = carritoCompras.get(i).getCantidad();
            double SubTotal = Precio * Cantidad;
            Total += SubTotal;
            tabla += "<tr>";
                tabla += "<td>"+(i+1)+"</td>";
                tabla += "<td>"+Obj.getIdProducto()+"</td>";
                tabla += "<td>"+Obj.getDescripcion()+"</td>";
                tabla += "<td><img src='img/"+Obj.getImagen()+
                        "' width='50' height='50'></td>";
                tabla += "<td>"+Precio+"</td>";
                tabla += "<td>"+Cantidad+"</td>";
                tabla += "<td>"+SubTotal+"</td>";
                tabla += "<td><a href='"+enlace+"'>Suprimir</a></td>";
            tabla +="</tr>";
        }
        tabla += "<tr bgcolor=Yellow><th colspan=6>TOTAL GENERAL</th><th>"+Total+"</th><th></th></tr>";
        tabla += "<tr><td colspan=8 align=center>[ "+enlace1+" ][ "+enlace2+" ]</td></tr>";
        tabla += "</table>";
        out.print(tabla);
        // Guardar valores en sesion
        MiSesion.setAttribute("numarticulos", i);
        MiSesion.setAttribute("total", Total);
        

    %>
    </div></div>
</body>
</html>
<%@ include file="components/footer.jsp"%>