<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5: After register click</title>
<style>

body {
	color: #103F53;
	background: #e6f3ff;
}
.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 20%;
}
.mybutton{
background-color: #7EB2C8;
color:black;
border: 1px solid #031E2A;
border-radius: 4px;
padding: 5px 12px;
font-size: 14px;
margin-left:45px;
}
.mybutton:hover {
    background-color: #031E2A;
    color: #7EB2C8;
}

</style>
</head>
<body class="bodycontent">
	<br>
	<br>
<form method="post" name="myform">
<p>${msg}</p>
<input class=mybutton type="button" name="login" value="Login" onclick="location.href = 'http://127.0.0.1:8080/OnlineOrdering/';">
 <input class=mybutton type="button" name="register" value="Register" onclick="location.href = 'register';">
</form>

</body>
</html>