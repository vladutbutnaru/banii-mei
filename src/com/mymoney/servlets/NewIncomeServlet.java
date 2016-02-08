package com.mymoney.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mymoney.DAO.*;
import com.mymoney.entities.*;
/**
 * Servlet implementation class NewIncomeServlet
 */
@WebServlet("/NewIncomeServlet")
public class NewIncomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewIncomeServlet() {
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
		Transactions transactionDAO = new Transactions();
		Transaction transaction = new Transaction();
		transaction.setAccountID(Integer.parseInt(request.getParameter("contCastig")));
		transaction.setAmount(Double.parseDouble(request.getParameter("valoareCastig")));
		transaction.setCurrency("RON");
		transaction.setDeleted(0);
		transaction.setIsRecurrent(0);
		transaction.setLocationID(0);
		transaction.setProductID(request.getParameter("sursaCastig"));
		transaction.setTransactionDescription(request.getParameter("descriereCastig"));
		transaction.setTransactionName(request.getParameter("numeCastig"));
		transaction.setTransactionType(2);
		transactionDAO.insertTransaction(transaction);
		response.sendRedirect("home.jsp");
		
	}

}
