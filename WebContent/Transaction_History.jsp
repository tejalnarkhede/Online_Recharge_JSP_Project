<%@ page import="com.model.Mob_Recharge"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Information</title>
<link rel="stylesheet" type="text/css" href="css//Login_CSS.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
table {
	width: 100%;
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
#FullLogin{
	width: 500px;
	padding: 10px;
	margin: 10px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body style="background-image: url('images//Login.jpg');">

		<div>
			<h1>TRANSACTION INFORMATION</h1>
		</div>
		<div class="container">
			<%!List<Mob_Recharge> lst_mb;%>
			<%
				if (!session.isNew()) {
					lst_mb = (List<Mob_Recharge>) request.getAttribute("Current_Trans_Obj");
			%>
			<table border=1 width=90% height=20% id="t01">
			<tr style="text-align: center">
					<td><b>TRANSACTION ID</b></td>
					<td><b>TRANSACTION INFORMATION</b></td>
					<td><b>DATE</b></td>
					<td><b>RECHARGE AMOUNT</b></td>
					<td><b>TOTAL BALANCE</b></td>
					<td><b>REMAINING BALANCE</b></td>
				</tr>
				<%
					for (Mob_Recharge mb : lst_mb) {
				%>				
				<tr style="text-align: center">
					<td><%=mb.getTransaction_Id()%></td>
					<td>Recharge on Number: <%=mb.getMobno()%></td>
					<td><%=mb.getDate()%></td>
					<td><%=mb.getAmount()%></td>
					<td><%=mb.getTot_amount()%></td>
					<td><%=mb.getRem_balance()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				}
			%>
		</div>
</body>
</html>