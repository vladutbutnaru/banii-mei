package com.mymoney.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mymoney.DAO.Locations;
import com.mymoney.entities.Location;

/**
 * Servlet implementation class CreateLocationServlet
 */
@WebServlet("/CreateLocationServlet")
public class CreateLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateLocationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Location location = new Location();
		Locations locationDAO = new Locations();
		location.setLocationCity(request.getParameter("orasLocatie"));
		location.setLocationName(request.getParameter("numeLocatie"));
		location.setLocationDescription(request.getParameter("descriereLocatie"));
		locationDAO.insertLocation(location);
		response.sendRedirect("newpayment.jsp");
		
		
	}

}
