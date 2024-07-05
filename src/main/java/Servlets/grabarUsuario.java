package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Usuarios;
import Negocio.BS_Usuarios;

@WebServlet("/grabarUsuario")
public class grabarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public grabarUsuario() {
        super();
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BS_Usuarios ObjBD = new BS_Usuarios();
		Usuarios ObjU = null;
		
		int op = Integer.parseInt(request.getParameter("op"));
		ObjU = new Usuarios(request.getParameter("txtid"),
				request.getParameter("txtape"),
				request.getParameter("txtnom"),
				Integer.parseInt(request.getParameter("txteda")),
				request.getParameter("txtsex").charAt(0),
				request.getParameter("txttipo"),
				request.getParameter("txtcontra")
				);
		
		switch(op) {
			case 1: ObjBD.Modificar(ObjU);
				response.sendRedirect("ManUsuario.jsp");
				break;
			case 2: ObjBD.Suprimir(ObjU.getId());
				response.sendRedirect("ManUsuario.jsp");
				break;
			case 3: ObjBD.Insertar(ObjU);
				response.sendRedirect("login.jsp");
				break;
		}
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
