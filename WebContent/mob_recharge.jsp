<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Mobile Recharge</title>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css//mobcss.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script language="Javascript" type="text/javascript">
	function ValidateAmount() {
		var amountinbox = document.register.amount.value
		if (amountinbox < 0) {
			alert("Enter Valid amount!!");
			window.document.forms.register.amount.value = ""
		} else {
			window.document.forms.register.amount.style.backgroundColor = 'lightgreen'
		}
	}
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
	<%
		session = request.getSession(true);
		String str = (String) session.getAttribute("Usernm");
		System.out.println("In Mobile Recharge Page: " + str);
		session.setAttribute("Usernm", str);
	%>

	<h1>Mobile Recharge</h1>
	<div id="recharge">
		<form action="Mob_Recharge_Controller" name="register" method="get">
			<table>
				<tr>
					<td><label><b>Mobile No</b></label></td>
					<td><input type="text" placeholder="Enter Mobile No"
						name="mobno" minlength="10" maxlength="10" required></td>
				</tr>
				<tr>
					<td><label><b>Service Provider</b></label></td>
					<td><select name="sp" id="sp"
						placeholder="Please select your Service Provider"
						class="custom-select"
						style="width: 100%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid black; box-sizing: border-box; border-radius: 8px;">
							<option value="Airtel">Airtel</option>
							<option value="Idea">Idea</option>
							<option value="Jio">Jio</option>
							<option value="Vodafone">Vodafone</option>
							<option value="Tata Docomo GSM-Special">Tata Docomo
								GSM-Special</option>
							<option value="Tata Docomo GSM-Talktime">Tata Docomo
								GSM-Talktime</option>
							<option value="BSNL Talktime">BSNL Talktime</option>
							<option value="Reliance Mobile">Reliance Mobile</option>
							<option value="Vodafone Idea">Vodafone Idea</option>
					</select></td>
				</tr>
				<tr>
					<td><label><b>Circle</b></label></td>
					<td><select name="loc" id="loc"
						placeholder="Please select Your circle" class="custom-select"
						style="width: 100%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid black; box-sizing: border-box; border-radius: 8px;">
							<option value="Assam">Assam</option>
							<option value="Chennai">Chennai</option>
							<option value="Delhi">Delhi</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Kolkata">Kolkata</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="North East">North East</option>
							<option value="Orissa">Orissa</option>
							<option value="Panjab">Panjab</option>
							<option value="Rajasthan">Rajasthan</option>
					</select></td>
				</tr>
				<tr>
					<td><label><b>Amount </b></label></td>
					<td><input type="number" placeholder="Enter Amount"
						name="amount" minlength="1" maxlength="10"
						onblur="ValidateAmount()" required></td>
				</tr>
			</table>
			<input type="submit" class="button" value="Proceed"
				onclick="{return confirmComplete();}">
		</form>
		<%
			try {
				if (!session.isNew()) {
					o = (boolean) session.getAttribute("data");
					session.invalidate();
					if (!o) {
		%>
		<h3>Not Enough Balance!! Try again!!</h3>
		<%
			} else {
		%>
		<h3>Recharge Done Successfully!!</h3>
		<%
			}
				}
			} catch (Exception e) {
			}
		%>
	</div>
	<h1>
		<u>You can also Select from our Recommended Plans</u>
	</h1>
	<img src="images//offer.jpeg" width="70%" height="2%">
	<br>
	<img src="images//offer2.jpeg" width="70%" height="2%">
</body>
</html>