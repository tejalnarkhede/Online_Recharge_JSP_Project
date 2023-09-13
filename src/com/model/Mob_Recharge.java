package com.model;

import java.util.Random; 
public class Mob_Recharge {
	String mobno,acc_username;
	double Rem_balance,amount,tot_amount,transaction_Id;
	Random rand = new Random();
	int generate_transaction_id = rand.nextInt(1000);
	java.sql.Date date;  
	
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getAcc_username() {
		return acc_username;
	}
	public void setAcc_username(String acc_username) {
		this.acc_username = acc_username;
	}
	public double getTransaction_Id() {
		return transaction_Id;
	}
	public void setTransaction_Id(double transaction_Id) {
		this.transaction_Id = rand.nextInt(10000);
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getTot_amount() {
		return tot_amount;
	}
	public void setTot_amount(double tot_amount) {
		this.tot_amount = tot_amount;
	}
	public double getRem_balance() {
		return Rem_balance;
	}
	public void setRem_balance(double d) {
		Rem_balance = d;
	}
}
