package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegisterDao;
import com.model.Mob_Recharge;
import com.model.Registration;

/**
 * Servlet implementation class Mob_Recharge_Controller
 */
@WebServlet("/Mob_Recharge_Controller")
public class Mob_Recharge_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Mob_Recharge_Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("In Mobile Recharge Controller: " + str);
		HttpSession session = request.getSession(true);
		Registration r=new Registration();
		RegisterDao rd=new RegisterDao();		
		Boolean b=false;
		String str = (String) session.getAttribute("Usernm");
		System.out.println("str: "+str);
		
		r=rd.DisplayUser(str);		
		session.setAttribute("Usernm", str);
		String mob=request.getParameter("mobno");
		int amount=Integer.parseInt(request.getParameter("amount"));

		if(amount<r.getAmount()){
			Mob_Recharge mb=new Mob_Recharge();
			mb.setAcc_username(str);
			mb.setAmount(amount);
			mb.setMobno(mob);
			mb.setTransaction_Id(0.0);
			
			//Save Date  
			long millis=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(millis);  
			//System.out.println(date);  
			mb.setDate(date);	

			mb.setTot_amount(r.getAmount());
			//System.out.println("mb.setTot_amount(r.getAmount());:: "+r.getAmount());
			mb.setRem_balance(r.getAmount()-mb.getAmount());	
			//System.out.println("mb.setRem_balance(r.getAmount()-mb.getAmount());:: "+mb.getRem_balance());

			int i=rd.save_Mob_Rec_Data(mb);		
			double a=mb.getRem_balance();
			r.setAmount(a);
			if(i>0){
				//System.out.println("Insertion of Recharge Successful.");
				i=rd.Update_Amount_after_transaction(str, a);
				if(i>0){
					//System.out.println("Updation of Amount Successful.");				
					session = request.getSession(true);
					session.setAttribute("UserObj",r);
					request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
				}
				else{
					System.out.println("Updation of Amount Failed!");
				}			
			}
			else{
				System.out.println("Recharge Insertion Failed!");
			}
		}
		else{
			session = request.getSession(true);
			session.setAttribute("Usernm", str);
			System.out.println("Usernm in mb:"+str);
			session.setAttribute("data",b);
			request.getRequestDispatcher("mob_recharge.jsp").forward(request, response);
			//response.sendRedirect("mob_recharge.jsp");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
