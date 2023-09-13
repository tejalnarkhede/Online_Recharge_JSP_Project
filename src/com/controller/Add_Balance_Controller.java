package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegisterDao;
import com.model.Registration;

/**
 * Servlet implementation class Add_Balance_Controller
 */
@WebServlet("/Add_Balance_Controller")
public class Add_Balance_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Add_Balance_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession(true);
		boolean UpdateSuccessfull;
		Registration reg = (Registration) (session.getAttribute("UserObj"));
		int newbal=Integer.parseInt(request.getParameter("newamount"));		
		double tot=newbal+reg.getAmount();
		RegisterDao rd=new RegisterDao();
		int i=rd.Update_Amount_after_transaction(reg.getAcc_username(),tot);
		if(i>0){
			UpdateSuccessfull=true;
			reg.setAmount(tot);
			session = request.getSession(true);
			session.setAttribute("UserObj",reg);
			request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
		}
		else{
			UpdateSuccessfull=false;
			session = request.getSession(true);
			session.setAttribute("UserObj",reg);
			session.setAttribute("UpdateSuccessfullyDone",UpdateSuccessfull);
			request.getRequestDispatcher("Add_Balance.jsp").forward(request, response);
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
