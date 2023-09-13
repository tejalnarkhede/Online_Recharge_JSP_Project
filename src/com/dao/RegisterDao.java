package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import com.model.Changepass;
import com.model.Login;
import com.model.Mob_Recharge;
import com.model.Registration;

public class RegisterDao {
	static Connection con;

	public int saveData(Registration reg){
		con=MyConnection.getConnection();
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement("Insert into Registration values(?,?,?,?,?,?,?)");
			ps.setInt(1,reg.getRegid());
			ps.setString(2,reg.getFname());
			ps.setString(3,reg.getSname());
			ps.setString(4,reg.getMobno());
			ps.setDouble(5,reg.getAmount());
			ps.setString(6, reg.getAcc_username());
			ps.setString(7,reg.getAcc_password());
			i=ps.executeUpdate();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public boolean ValidateUser(Login l){
		boolean b=false;
		PreparedStatement ps=null;
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from Registration where acc_username=? and acc_password=?");
			ps.setString(1,l.getUsername());
			ps.setString(2,l.getPassword());
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	}

	public Registration DisplayUser(String user_name){
		boolean b=false;
		PreparedStatement ps=null;
		Registration reg=new Registration();
		List<Registration> ls=null;
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from registration where acc_username=?");
			ps.setString(1,user_name);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				reg.setRegid(rs.getInt(1));
				reg.setFname(rs.getString(2));
				reg.setSname(rs.getString(3));
				reg.setMobno(rs.getString(4));
				reg.setAmount(rs.getDouble(5));
				reg.setAcc_username(rs.getString(6));
				reg.setAcc_password(rs.getString(7));						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reg;		
	}

	public boolean ValidateUser1(Changepass cp){
		boolean b=false;
		PreparedStatement ps=null;
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from registration where acc_username=? and acc_password=?");
			ps.setString(1,cp.getUsername());
			ps.setString(2,cp.getOldpass());
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	}

	public int ChangePassword(Changepass cp){
		con=MyConnection.getConnection();
		PreparedStatement ps=null;
		int i=0;		
		try {
			ps=con.prepareStatement("update Registration set acc_password=? where acc_username=?");			
			ps.setString(1, cp.getNewpass());
			ps.setString(2, cp.getUsername());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public int save_Mob_Rec_Data(Mob_Recharge mb){
		con=MyConnection.getConnection();
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement("Insert into Recharge values(?,?,?,?,?,?,?)");
			ps.setDouble(1,mb.getTransaction_Id());
			ps.setString(2,mb.getMobno());
			ps.setDate(3,mb.getDate());
			ps.setDouble(4,mb.getAmount());
			ps.setDouble(5,mb.getTot_amount());
			ps.setDouble(6,mb.getRem_balance());
			ps.setString(7, mb.getAcc_username());
			i=ps.executeUpdate();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int Update_Amount_after_transaction(String uname,double a){
		con=MyConnection.getConnection();
		PreparedStatement ps=null;
		int i=0;		
		try {
			ps=con.prepareStatement("update Registration set amount=? where acc_username=?");			
			ps.setDouble(1, a);
			ps.setString(2, uname);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return i;
	}
	public List<Mob_Recharge> DisplayAllTransactions(String user_name){
		List<Mob_Recharge> ls=null;
		String str="SELECT * FROM Recharge where acc_username='"+user_name+"'";
		con=MyConnection.getConnection();
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery(str);
			ls=new LinkedList<Mob_Recharge>();
			while(rs.next()){
				Mob_Recharge mb=new Mob_Recharge();
				mb.setTransaction_Id(rs.getDouble(1));
				mb.setMobno(rs.getString(2));
				mb.setDate(rs.getDate(3));				
				mb.setAmount(rs.getDouble(4));
				mb.setTot_amount(rs.getDouble(5));
				mb.setRem_balance(rs.getDouble(6));
				mb.setAcc_username(rs.getString(7));
				ls.add(mb);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;		
	}
}
