package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Productos;
import Negocio.BS_Productos;

/**
 * Servlet implementation class grabarProducto
 */
@WebServlet("/grabarProducto")
public class grabarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public grabarProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		BS_Productos ObjBD = new BS_Productos();
		Productos ObjP = null;
		int op = Integer.parseInt(request.getParameter("op"));
		ObjP = new Productos(request.getParameter("txtcod"),
				request.getParameter("txtcat"),
				request.getParameter("txtnom"),
				Double.parseDouble(request.getParameter("txtpre")),
				Integer.parseInt(request.getParameter("txtsto")),
				request.getParameter("txtima"));
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		switch(op) {
		case 1: ObjBD.Modificar(ObjP);
		response.sendRedirect("MantenerProducto.jsp");
		break;		
		case 2: ObjBD.Suprimir(ObjP.getIdProducto());
		response.sendRedirect("MantenerProducto.jsp");
		break;
		case 3: ObjBD.Insertar(ObjP);
		response.sendRedirect("MantenerProducto.jsp");
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
