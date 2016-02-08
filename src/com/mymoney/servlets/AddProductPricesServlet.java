package com.mymoney.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mymoney.entities.*;
import com.mymoney.DAO.*;
/**
 * Servlet implementation class AddProductPricesServlet
 */
@WebServlet("/AddProductPricesServlet")
public class AddProductPricesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductPricesServlet() {
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
		ArrayList<ProductPrice> productPrices = new ArrayList<ProductPrice>();
		int numOfProducts = Integer.parseInt(request.getParameter("numOfProducts"));
		for(int i = 0 ; i<numOfProducts; i++){
			ProductPrice p = new ProductPrice();
			p.setLocationID(Integer.parseInt(request.getParameter("locationID")));
			p.setPrice(Float.parseFloat(request.getParameter("valoarePlata" + i)));
			p.setProductID(Integer.parseInt(request.getParameter("productID" + i)));
			p.setTransactionID(Integer.parseInt(request.getParameter("transactionID")));
			productPrices.add(p);
			
			
			
			
			}
		ProductPrices productPricesDAO = new ProductPrices();
		productPricesDAO.insertProductPrices(productPrices);
		response.sendRedirect("home.jsp");
		
	}

}
