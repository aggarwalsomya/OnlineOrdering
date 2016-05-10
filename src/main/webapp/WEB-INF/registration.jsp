<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:Registration</title>
</head>
<style>

body {
	color: #103F53;
	background: #e6f3ff;
}

#title {
	width: 350px;
	height: 26px;	
	padding-top: 15px;
	text-transform: uppercase;
	letter-spacing: 2px;
	text-align: center;
	font-size: 22px;
	
}

form {
	width: 335px;
}

.col1 {
	text-align: right;
	width: 170px;
	height: 31px;
	margin: 0;
	float: left;
	margin-right: 2px;
	text-transform: uppercase;
	letter-spacing: 1px;
	
}

.col2 {
	width: 195px;
	height: 40px;
	display: block;
	float: left;
	margin: 0;
	
}

.col2comment {
	width: 195px;
	height: 98px;
	margin: 0;
	display: block;
	float: left;
	
}

.col1comment {
	text-align: right;
	width: 135px;
	height: 98px;
	float: left;
	display: block;
	margin-right: 2px;
	
}

div.row {
	clear: both;
	width: 435px;
}

.input {
	margin: 4px 0 5px 8px;
	padding: 1px;
	border: 1px solid #8595B2;
	height:30px;
}

.textarea {
	border: 1px solid #8595B2;
	margin: 4px 0 5px 8px;
}

.button:hover {
    background-color: #031E2A;
    color: #7EB2C8;
} 
.mybutton
{
   margin-left : 140px;
}

.button{
margin-left : 100px;
background-color: #7EB2C8;
color:black;
border: 1px solid #031E2A;
border-radius: 6px;
padding: 5px 12px;
font-size: 18px;
}

.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 40%;
}
.exist{
margin-left : 155px;
}


.mybutton{
background-color: #7EB2C8;
color:black;
border: 1px solid #031E2A;
border-radius: 4px;
padding: 5px 12px;
font-size: 14px;
}
.mybutton:hover {
    background-color: #031E2A;
    color: #7EB2C8;
}

</style>

<body>
	<div class="bodycontent">

<div id="title"><b>CMPE275_TermProject_Group5</b></div>
<div id="title" style="font-size: 20px;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;user registration</b></div>
		<form method="post" action="registerUser">
			<br>
			<div class="row">
				<label class="col1"> Email:&nbsp;&nbsp;</label> <span class="col2"><input
					type="email" id="email" name="email" required /></span>
			</div>
			<div class="row">
				<label class="col1"> Password:&nbsp;&nbsp;</label> <span
					class="col2"><input type="password" name="password" required /></span>
			</div>
			<div class="row">
				<label class="col1"> Full Name:&nbsp;&nbsp;</label> <span
					class="col2"><input type="text" name="fullname" required /></span>
			</div>
			<div class="row">
				<label class="col1"> Mobile no.:&nbsp;&nbsp;</label> <span
					class="col2"><input type="text" name="phone" id="phone"
					required /></span>
			</div>
			<div class="row">
				<label class="col1">Mobile Carrier:&nbsp;&nbsp;</label>
				<span class="col2"> <select id="carrier" name="carrier" style="width:175px;">
						<option value="ve">Verizon</option>
						<option value="at">At&T</option>
						<option value="tm">T-Mobile</option>
						<option value="oth">Other</option>
				</select>
				</span>
			</div>

			<div class="row">
				<label class="col1"> Verification Code:&nbsp;&nbsp;</label> <span
					class="col2"><input type="text"
					placeholder="Enter code received on email" name="verCode" required /></span>
			</div>
			<div class="row">
				<span class="col2" style="margin-left:35px;"><input
					class=mybutton type=button name="sendOTP" id="sendOTP"
					value="Send OTP" onclick="sendotp()"></span>
			</div>
			<br>

			<div class="row">
				<label class="col1"> Address:&nbsp;&nbsp;</label> <span class="col2"><input
					type="text" id="address" name="address" required /></span>
			</div>

			<br> <br><span class="col2" style="margin-left:35px;"> <input class="mybutton" type="submit"
				name="register" value="Register"></span>
		</form>

	</div>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		function sendotp() {
			var http = new XMLHttpRequest();
			var url = "http://127.0.0.1:8080/OnlineOrdering/verifyMail";
			var params = "email=";

			params = params + document.getElementById("email").value
					+ "&carrier=" + document.getElementById("carrier").value
					+ "&phone=" + document.getElementById("phone").value;
			http.open("POST", url, true);

			//Send the proper header information along with the request
			http.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			http.send(params);

		}
	</script>
</body>
</html>
