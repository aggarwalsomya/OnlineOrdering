<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CMPE275_TermProject_Group5: Logout</title>
<style>

body {
	color: #103F53;
	background: #e6f3ff;
}
.bodycontent {
	margin: auto;
	margin-top: 150px;
	width: 40%;
}

.mybutton{
	background-color: #7EB2C8;
	color:black;
	border: 1px solid #031E2A;
	border-radius: 4px;
	padding: 5px 12px;
	font-size: 16px;
	width:100px;
	text-align:center;
	margin-left:170px;
}

.mybutton:hover {
    background-color: #031E2A;
    color: #7EB2C8;
}
</style>

</head>
<body><div class="bodycontent">
<h3>Thank you for your visit ${user}! You have successfully logged out.</h3>
<br>
<input type="button" class=mybutton value="Home" id="Logout"
			name="Logout" onclick="location.href = 'home';">
</div>


</body>
</html>