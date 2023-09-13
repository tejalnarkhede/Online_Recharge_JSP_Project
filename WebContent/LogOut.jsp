<%@ page import="com.model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log Out</title>
<link rel="stylesheet" type="text/css" href="css//Login_CSS.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body style="background-image: url('images//Login.jpg');" onload="preventBack()">
	<%
		session = request.getSession(true);
		Registration r = (Registration) session.getAttribute("UserObj");
		System.out.println("In Mobile Recharge Page: " + r);
		r = null;
		System.out.println("In Mobile Recharge Page: " + r);
		session.setAttribute("Usernm", r);
		session.invalidate();
	%><center>
		<h1>
			Log out Successfully!! <br> Hope you had a great experience!!<br> <a
				href="Home.html">Click here to Continue!!</a>
		</h1>
	</center>
</body>
</html>