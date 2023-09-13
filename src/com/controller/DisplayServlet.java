package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RegisterDao;
import com.model.Mob_Recharge;
import com.model.Registration;

/**
 * Servlet implementation class DisplayServlet
 */
@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String username_op;
	public DisplayServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		List<Mob_Recharge> t=null;
		String username_op=request.getParameter("acc_uname");
		try{
			String str=request.getParameter("operation");
			if(str.equals("ViewProfile")){
				RegisterDao rd=new RegisterDao();
				Registration r=rd.DisplayUser(username_op);
				request.setAttribute("Current_User_Obj",r);
				request.getRequestDispatcher("Display_User_Info.jsp").forward(request, response);
			}
			if(str.equals("ViewHistory")){
				RegisterDao rd=new RegisterDao();
				Registration r=rd.DisplayUser(username_op);
				request.setAttribute("Current_User_Obj",r);
				t=rd.DisplayAllTransactions(username_op);
				request.setAttribute("Current_Trans_Obj",t);
				request.getRequestDispatcher("Transaction_History.jsp").forward(request, response);
				}
			if(str.equals("AddBalance")){
				RegisterDao rd=new RegisterDao();
				Registration r=rd.DisplayUser(username_op);
				request.setAttribute("Current_User_Obj",r);
				request.getRequestDispatcher("Add_Balance.jsp").forward(request, response);
			}
		}catch(Exception e){
			response.sendRedirect("Error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
