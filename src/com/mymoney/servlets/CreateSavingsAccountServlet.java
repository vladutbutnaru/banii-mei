package com.mymoney.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mymoney.DAO.CreateAccountProcess;
import com.mymoney.DAO.Users;
import com.mymoney.entities.Account;
import com.mymoney.entities.User;

/**
 * Servlet implementation class CreateSavingsAccountServlet
 */
@WebServlet("/CreateSavingsAccountServlet")
public class CreateSavingsAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSavingsAccountServlet() {
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
	CreateAccountProcess accountCreator= new CreateAccountProcess();
	Account account = new Account();
	account.setAccountName(request.getParameter("numeCont"));
	account.setAccountDescription(request.getParameter("descriereCont"));
	account.setCurrency(1);
	
	account.setAmount(Double.parseDouble(request.getParameter("soldCont")));
	User user = new User();
	Users userDAO = new Users();
	String userEmail = "";
	  Cookie[] cookies = request.getCookies();
      if(cookies != null){
      for(Cookie cookie : cookies){
          if(cookie.getName().equals("user")){
        	  userEmail = cookie.getValue();
              break;
          }
      }
      }
	
	
	
	user=userDAO.getUserByEmail(userEmail);
	account.setUserID(user.getId());
      accountCreator.createSavingsAccount(account);
      response.sendRedirect("home.jsp");
	
	}

}
