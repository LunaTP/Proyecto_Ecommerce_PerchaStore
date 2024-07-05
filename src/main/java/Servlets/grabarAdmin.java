package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Administrador;
import Negocio.BS_Admin;

/**
 * Servlet implementation class grabarAdmin
 */
@WebServlet("/grabarAdmin")
public class grabarAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public grabarAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BS_Admin ObjBD = new BS_Admin();
		Administrador ObjU = null;
		
		int op = Integer.parseInt(request.getParameter("op"));
		ObjU = new Administrador(request.getParameter("txtid"),
									request.getParameter("txtape"),
									request.getParameter("txtnom"),
									request.getParameter("txtsex").charAt(0),
									request.getParameter("txttipo"),
									request.getParameter("txtcontra"));
		
		switch(op) {
		case 1: ObjBD.Modificar(ObjU);
		response.sendRedirect("MantenerAdmin.jsp");
		break;
		case 2: ObjBD.Suprimir(ObjU.getId());
		response.sendRedirect("MantenerAdmin.jsp");
		break;
		case 3: ObjBD.Insertar(ObjU);
		response.sendRedirect("MantenerAdmin.jsp");
		break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
