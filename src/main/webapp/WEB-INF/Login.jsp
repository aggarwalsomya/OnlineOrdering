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
margin-left : 155px;
}

</style>

<body>
<div class="bodycontent">

<div id="title">CMPE275_TermProject_Group5:Login</div>
<form method="post" action="userLogin"  >
	<br>
	<div class="row"><label class="col1"> Email:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="email" value="" /></span></div>
	<div class="row"><label class="col1"> Password:&nbsp;&nbsp;</label>
	<span class="col2"><input type="text" name="password" value="" /></span></div>
	<br>
	<br>
		<input class="mybutton" type="submit" name="login" value="Login">
	<br><br><br>
	<div class="exist">New user? <input type="button" class=button id="register" name="register" value="Register" onclick="location.href = 'http://127.0.0.1:8080/OnlineOrdering/register';"></div>
	</form>
	
	</div>

</body>
</html>
