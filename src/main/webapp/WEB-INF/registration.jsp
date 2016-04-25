<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:Registration</title>
</head>
<style>

body {
	color: #5A698B;
}

#title {
	width: 330px;
	height: 26px;
	color: #5A698B;
	padding-top: 5px;
	text-transform: uppercase;
	letter-spacing: 2px;
	text-align: center;
	margin-left:15px;
}

form {
	width: 335px;
}

.col1 {
	text-align: right;
	width: 135px;
	height: 31px;
	margin: 0;
	float: left;
	margin-right: 2px;
	
}

.col2 {
	width: 195px;
	height: 31px;
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
	width: 335px;
}

.input {
	margin: 4px 0 5px 8px;
	padding: 1px;
	border: 1px solid #8595B2;
}

.textarea {
	border: 1px solid #8595B2;
	margin: 4px 0 5px 8px;
}

.mybutton
{
   margin-left : 140px;
}

.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 40%;
}
.exist{
margin-left : 170px;
}

</style>

<body>
<div class="bodycontent">

<div id="title">User Registration</div>
<form method="post" name="myform">
	<br>
	<div class="row"><label class="col1"> Email:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="email"/></span></div>
	<div class="row"><label class="col1"> Password:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="password"/></span></div>
	<div class="row"><label class="col1"> Verification Code:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" placeholder="Enter code received on email" name="verCode"/></span></div>
	<span class="col2"><input class="mybutton" type="submit" name="sendOTP" value="Send OTP"  onclick="selected(this.value)"></span><br>
	<div class="row"><label class="col1"> Full Name:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="fullName"/></span></div>
	<div class="row"><label class="col1"> Address:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="address"/></span></div>
	<div class="row"><label class="col1"> Phone no.:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="phone"/></span></div>
	<br>
	<br>
		<input class="mybutton" type="submit" name="register" value="Register"  onclick="selected(this.value)">
</form>
	
	</div>
<script type="text/javascript">
	function selected(value){
		
		var variable = value;	
		  if(variable == "sendOTP")
		  {
		   document.myform.action ="sendOTP";
		  }
		  else
		  if(variable == "register")
		  {
		    document.myform.action ="registerUser";
		  }
	
	
	}
	</script>
</body>
</html>