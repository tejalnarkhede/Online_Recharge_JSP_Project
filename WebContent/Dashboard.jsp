<%@ page import="com.model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dash board</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css//Dash.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
#b {
	background-color: #eee;
	border: none;
	color: blue;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

#am {
	display: inline-block;
	border: 1px solid black;
	box-sizing: border-box; border-radius : 8px; background-color :
	lightgreen;
	text-align: center;
	float: right;
	border: 1px solid black;
	box-sizing: border-box;
	border-radius: 8px;
	background-color: lightgreen;
	box-sizing: border-box;
	border-radius: 8px;
	background-color: lightgreen;
	border-radius: 8px;
	background-color: lightgreen;
}
</style>
</head>
<body style="background-image: url('images//LoginUser.jpg');">
	<%
		Registration currentUser = (Registration) (session.getAttribute("UserObj"));
		session.setAttribute("Usernm", currentUser.getAcc_username());
		session.setAttribute("UserObj", currentUser);
	%>

	<form action=""></form>
	<!-- Side Navigation Bar -->
	<div class="sidenav">

		<form action="DisplayServlet" method="get">
			<center>
				<div class="imgcontainer">
					<img src="images//ava.jpg" alt="Avatar" class="avatar">
				</div>

				<h5>
					User Account:&nbsp;&nbsp; <input type="text"
						value="<%=currentUser.getAcc_username()%>" name="acc_uname"
						style="border: 2px solid #eee; background-color: #eee; font-size: 15px"
						readonly>
				</h5>
			</center>
			<hr>
			<center>
				<h3>Quick Links</h3>
			</center>
			<hr>
			<Button name="operation" value="ViewProfile" id="b">View
				Profile</Button>
			<hr>
			<Button id="b"
				onClick="JavaScript:window.location='changePassword.jsp'">
				<a href="changePassword.jsp">Change Password </a>
			</Button>
			<hr>
			<Button name="operation" value="ViewHistory" id="b">View
				transaction History</Button>
			<hr>
			<Button name="operation" value="AddBalance" id="b">
				<a href="Add_Balance.jsp">Add Money to Wallet</a>
			</Button>

			<hr>
			<Button name="operation" value="contact" id="b">
				<a href="about.jsp"> Contact us</a>
			</Button>
			<hr>
		</form>
	</div>
	<div>
		<div>
			<img src="images\\Recharge.png" width="100" height="100">
			<h1>
				WELCOME TO TECHRECHARGE <br>APPLICATION
			</h1>
			<hr>
			<marquee>
				<h3>
					<b>Vi Users:</b> Users can avail 1GB data for 24 hours for Rs 16,
					3GB data for 28 days for Rs 48, and 6GB data for 28 days for Rs
					98.| <b>Airtel Users:</b> Flat Rs.40 cashback on Airtel prepaid
					recharges of 249/279/598/698 | Flat Rs.20 cashback on Airtel
					prepaid recharges of 149/179/219 | T&C apply
				</h3>
			</marquee>
		</div>
	</div>
	<button id="blogout" style="width: auto;"
		ONCLICK="window.location.href='LogOut.jsp'">
		<i class="fa fa-fw fa-user"></i> Logout
	</button>
	<div class="navbar">
		<div id="am">
			<b>Amount in wallet: <%=currentUser.getAmount()%></b>
		</div>
		&nbsp;&nbsp;
		<h3>
			Welcome to the Dash board:
			<%=currentUser.getFname()%>
			<%=currentUser.getSname()%>
		</h3>

	</div>
	<div style="padding-left: 16px">
		<button style="width: auto;"
			onClick="JavaScript:window.location='mob_recharge.jsp';">Mobile
			Recharge</button>
		<img src="images\\mbrecharge.jpg" height="300" width="300"
			id="rechargeimage">
		<h3>What We Do</h3>
		<p>Simple, fast and Hassle Free payments</p>
	</div>
</body>
</html>