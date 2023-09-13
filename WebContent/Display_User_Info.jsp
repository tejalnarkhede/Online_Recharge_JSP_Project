<%@ page import="com.model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Information</title>
<link rel="stylesheet" type="text/css" href="css//Login_CSS.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  width:100%;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
#t01 tr:nth-child(even) {
  background-color: #eee;
}
#t01 tr:nth-child(odd) {
 background-color: #fff;
}
#t01 th {
  background-color: black;
  color: white;
}
</style>
</head>
<body style="background-image: url('images//Login.jpg');">

	<div class="boxed" id="FullLogin">
			<div>
				<h2>PERSONAL INFORMATION</h2>
			</div>
			<div class="imgcontainer">
				<img src="images//ava.jpg" alt="Avatar" class="avatar">
			</div>
			<div class="container">
	<%!Registration reg = null;%>
	<%
				if (!session.isNew()) {
					Object o = request.getAttribute("Current_User_Obj");
					reg = (Registration) o;
			%>
	<table border=1 width=50% height=20% id="t01">
		<tr style="text-align: center">
			<td><b>Registration ID</b></td>
			<td><%= reg.getRegid()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>First Name</b></td>
			<td><%=reg.getFname()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Last Name</b></td>
			<td><%=reg.getSname()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Mobile Number</b></td>
			<td><%=reg.getMobno()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>User name</b></td>
			<td><%=reg.getAcc_username()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Amount</b></td>
			<td><%=reg.getAmount()%></td>
		</tr>
	</table>
	<%
				}
			%>
			</div>
			</div>
			
</body>
</html>