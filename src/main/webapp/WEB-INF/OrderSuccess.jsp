
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cmpe275_Term_Project_5 Order Placement Successful</title>
<style>

body {
	color: #103F53;
	background: #e6f3ff;
}
.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 30%;
}
.mybutton{
background-color: #7EB2C8;
color:black;
border: 1px solid #031E2A;
border-radius: 4px;
padding: 5px 12px;
font-size: 14px;
margin-left:45px;
width:70px;
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
	<h3>${msg}</h3>
<br>
	<input type="button" class=mybutton value="Home" id="back" name="Go to Home Page"
		onclick="location.href = '../home';">
		<input type="button" class=mybutton value="Logout" id="Logout"
			name="Logout" onclick="location.href = '../logout';"><br />
</body>
</html>