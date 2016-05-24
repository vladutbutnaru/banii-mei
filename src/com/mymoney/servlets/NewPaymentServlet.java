package com.mymoney.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mymoney.DAO.Transactions;
import com.mymoney.entities.Transaction;

/**
 * Servlet implementation class NewPaymentServlet
 */
@WebServlet("/NewPaymentServlet")
public class NewPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPaymentServlet() {
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
		// TODO Auto-generated method stub
		String[] a = request.getParameterValues("produsePlata");
		String produse = "";
		if(a!=null)
		{
		for(int i=0;i<a.length;i++){
	
		produse = produse + "," + a[i];
		}}
		Transaction transaction = new Transaction();
		transaction.setAccountID(Integer.parseInt(request.getParameter("contPlata")));
		transaction.setTransactionName(request.getParameter("numePlata"));
		transaction.setTransactionDescription(request.getParameter("descrierePlata"));
		transaction.setAmount(Double.parseDouble(request.getParameter("valoarePlata")));
		transaction.setProductID(produse);
		transaction.setIsRecurrent(0);
		transaction.setDeleted(0);
		transaction.setCurrency("RON");
		transaction.setLocationID(Integer.parseInt(request.getParameter("locatiePlata")));
		transaction.setTransactionType(1);
		
		Transactions transactionDAO = new Transactions();
		transaction.setID(transactionDAO.insertTransaction(transaction));
		request.setAttribute("products", produse);
		request.setAttribute("transactionID", transaction.getID());
		request.setAttribute("LocationID", transaction.getLocationID());
		if(!produse.equals(""))
		request.getRequestDispatcher("transactionAdded.jsp").forward(request, response);
		else
		response.sendRedirect("viewhistory.jsp");
	}

}
