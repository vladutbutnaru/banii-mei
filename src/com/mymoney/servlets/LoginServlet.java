package com.mymoney.servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mymoney.DAO.LoginProcess;
import com.mymoney.entities.User;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(description = "Servlet to handle login requests", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    private final String userID = "Vlad";
    private final String password = "password";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
	System.out.println("Login servlet initialized");
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
		 // get request parameters for userID and password
		LoginProcess loginProcessor = new LoginProcess();
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        User userReceived = new User();
        userReceived.setEmail(user);
        userReceived.setPassword(pwd);
        
        if(loginProcessor.doLogin(userReceived)){
            Cookie loginCookie = new Cookie("user",user);
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            response.sendRedirect("LoginSuccess.jsp");
        }else{
           
        }
        
	}


}
