<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css//Login_CSS.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Change Password</title>
<script>
	function ValidatePassword() {
		re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
		var pass = document.changepass.newpass.value;
		if (re.test(pass)) {
			window.document.forms.changepass.newpass.style.backgroundColor = 'lightgreen'

		} else {
			window.document.forms.changepass.newpass.value = ""
			alert('Enter Password containing: \nMinimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character!')
		}
	}
	function ShowCurrentPassword() {
		var x = document.getElementById("myCurrentInput");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	function ShowNewPassword() {
		var x = document.getElementById("myNewInput");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
<style type="text/css">
#FullLogin {
	width: 400px;
	padding: 10px;
	margin: 20px;
	margin-left: auto;
	margin-right: auto;
	background-color: lightblue;
}

h1 {
	margin: 30px;
	text-align: center;
	color: red;
	background: -webkit-linear-gradient(orange, red);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	-webkit-text-stroke: 1px black;
}

h3 {
	margin: 20px;
	text-align: center;
	color: red;
}
</style>
</head>
<body style="background-image: url('images//RegLogin.jpg');">
	<%!boolean o = false;%>
	<h1>Change Password</h1>
	<div class="boxed" id="FullLogin">
		<form action="changePasswordController" name="changepass" method="get">
			<table>
				<tr>
					<td><label><b>Enter Username:</b></label></td>
					<td><input type="text" placeholder="Enter Username"
						name="username" minlength="3" maxlength="16" required></td>
				</tr>
				<tr>
					<td><label><b>Enter Current Password:</b></label></td>
					<td><input type="password"
						placeholder="Enter Current Password" id="myCurrentInput"
						name="oldpass" required><br> <input type="checkbox"
						onclick="ShowCurrentPassword()">Show Password</td>
				</tr>
				<tr>
					<td><label><b>Enter New Password:</b></label></td>
					<td><input type="password" placeholder="Enter New Password"
						id="myNewInput" name="newpass" minlength="8" maxlength="16"
						onblur="ValidatePassword()" required><br> <input
						type="checkbox" onclick="ShowNewPassword()">Show Password</td>
				</tr>
			</table>
			<button type="submit" name="proceed" value="Proceed">Proceed</button>
		</form>
		<%
			try {
				if (!session.isNew()) {
					o = (boolean) session.getAttribute("data");
					session.invalidate();
					if (!o) {
		%>
		<h3>Account Not Found!! Try again!!</h3>
		<%
			}
					else{
						%>
						<h3>Password Changed!! Don't share your Password with anyone!!</h3>
						<%
					}
				}
			} catch (Exception e) {
			}
		%>
	</div>
</body>
</html>