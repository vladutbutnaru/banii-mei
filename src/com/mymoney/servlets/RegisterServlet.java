package com.mymoney.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mymoney.DAO.RegisterProcess;
import com.mymoney.entities.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("Register servlet initialized");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setFirstName(request.getParameter("FirstName"));
		user.setLastName(request.getParameter("LastName"));
		user.setEmail(request.getParameter("Email"));
		user.setPhoneNumber(request.getParameter("PhoneNumber"));
		user.setPassword(request.getParameter("pwd"));
		DateFormat format = new SimpleDateFormat("MM-DD-YYYY", Locale.ENGLISH);
		Date date = new Date();
		
		user.setDateOfBirth(request.getParameter("DateOfBirth"));

		user.setCity(request.getParameter("City"));
		user.setCountry(request.getParameter("Country"));
		if(request.getParameter("smoker") == null)
			user.setSmoker(0);
		else
		user.setSmoker(1);
		if(request.getParameter("carnetDeConducere") == null)			
		user.setHasDriversLicence(0);
		else
			user.setHasDriversLicence(1);	
		if(request.getParameter("masinaPersonala") == null)
		user.setHasCar(0);
		else
			user.setHasCar(1);
		if(request.getParameter("casatorit") == null)
			user.setMarried(0);
			else
				user.setMarried(1);
		
		user.setUserType(Integer.parseInt(request.getParameter("tipCont")));
		if(request.getParameter("deAcord") == null)
			user.setAgreedWithProcessingTerms(0);
			else
				user.setAgreedWithProcessingTerms(1);
		
		
		user.setDateRegistered(new Date());
		user.setNumberOfLogins(0);
		user.setAdmin(0);
		if (Integer.parseInt(request.getParameter("tipCont")) > 1)
			user.setPremium(1);
		else
			user.setPremium(0);
		RegisterProcess registerProcessor = new RegisterProcess();
		registerProcessor.registerUser(user);
		response.sendRedirect("login.html");
	}

}
