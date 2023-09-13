<%@ page import="com.model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add money to wallet</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css//Login_CSS.css">
<link rel="stylesheet" type="text/css" href="css//mobcss.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script language="Javascript" type="text/javascript">
	function confirmComplete() {
		var answer = confirm("Are you sure you want to Continue?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body style="background-image: url('images//RegLogin.jpg');">

	<%!boolean o = false;%>
	<%!Registration reg = null;%>
	<%
		if (!session.isNew()) {
			reg = (Registration) (session.getAttribute("UserObj"));
			request.setAttribute("UserObj", reg);
	%>

	<h1>Add money to Wallet</h1>
	<div id="recharge">
		<form action="Add_Balance_Controller" name="register" method="get">
			<table align="center">
				<tr>
					<td><label><b>Available Amount: </b></label></td>
					<td><input type="number" value="<%=reg.getAmount()%>"
						name="amount" readonly></td>
				</tr>
				<tr>
					<td><label><b>Amount </b></label></td>
					<td><input type="number" placeholder="Enter Amount in Wallet"
						name="newamount" minlength="2" maxlength="7" required></td>
				</tr>
			</table>
			<input type="submit" class="button" value="Proceed"
				onclick="{return confirmComplete();}">
		</form>
	</div>
	<%
		}
	%>
	<%
		try {
			if (!session.isNew()) {
				o = (boolean) session.getAttribute("UpdateSuccessfullyDone");
				session.invalidate();
				if (!o) {
	%>
	<h3>Something went wrong!! Try again!!</h3>
	<%
		} else {
	%>
	<h3>Amount Inserted in your wallet!!</h3>
	<%
		}
			}
		} catch (Exception e) {
		}
	%>
</body>
</html>