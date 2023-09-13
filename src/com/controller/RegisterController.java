package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RegisterDao;
import com.model.Registration;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int i=0;
		int regNo=Integer.parseInt(request.getParameter("regid"));
		String regFName=request.getParameter("fname");
		String regSName=request.getParameter("sname");
		String mobno=request.getParameter("mobno");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		Double amount=Double.parseDouble(request.getParameter("amount"));

		Registration r=new Registration();
		r.setRegid(regNo);
		r.setFname(regFName);
		r.setSname(regSName);
		r.setMobno(mobno);
		r.setAcc_username(uname);
		r.setAcc_password(pass);
		r.setAmount(amount);
		//System.out.println(regNo+regFName+regSName+mobno+uname+pass+amount);

		RegisterDao rd=new RegisterDao();
		i=rd.saveData(r);
		if(i>0){
			response.sendRedirect("Login_Page.jsp");
		}
		else{
			response.sendRedirect("Error.jsp");
			//System.out.println("Insertion Failed!");
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
