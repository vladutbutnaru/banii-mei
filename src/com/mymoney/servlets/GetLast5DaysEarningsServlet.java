package com.mymoney.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mymoney.DAO.Transactions;
import com.mymoney.DAO.Users;
import com.mymoney.entities.User;

/**
 * Servlet implementation class GetLast5DaysEarningsServlet
 */
@WebServlet("/GetLast5DaysEarningsServlet")
public class GetLast5DaysEarningsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetLast5DaysEarningsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
				String email = request.getParameter("email");
				Users userDAO = new Users();
				System.out.println("IN SERVLET" + email);
				User currentUser = userDAO.getUserByEmail(email);
				Transactions transactionDAO = new Transactions();
				ArrayList<String> sums = new ArrayList<String>();
				sums = transactionDAO.getAmountEarnedLast5Days(currentUser);
				 String json = new Gson().toJson(sums);
				 System.out.println(json);
				 response.setContentType("application/json");
				    response.setCharacterEncoding("UTF-8");
				    response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
