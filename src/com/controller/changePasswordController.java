package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegisterDao;
import com.model.Changepass;
import com.model.Registration;

/**
 * Servlet implementation class changePasswordController
 */
@WebServlet("/changePasswordController")
public class changePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public changePasswordController() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("In /changePasswordController");
		HttpSession session=request.getSession();
		String uname=request.getParameter("username");
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");

		Changepass cp=new Changepass();
		cp.setUsername(uname);
		cp.setOldpass(oldpass);
		cp.setNewpass(newpass);

		RegisterDao rd=new RegisterDao();
		boolean b=rd.ValidateUser1(cp);
		if(b){
			int i=rd.ChangePassword(cp);
			if(i>0){
				Registration r=rd.DisplayUser(uname);
				session.setAttribute("UserObj",r);
				request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
			}
			else{
				response.sendRedirect("Error.jsp");
			}			
		}
		else{			
			session.setAttribute("data",b);
			response.sendRedirect("changePassword.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
