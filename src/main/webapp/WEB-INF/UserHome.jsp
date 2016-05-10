<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home- Welcome!</title>
<style>

body {
	color: #103F53;
	background: #e6f3ff;
}




.col2 {
	width: 195px;
	height: 31px;
	display: block;
	float: left;
	margin: 0;
	
}



.mybutton{
background-color: #7EB2C8;
color:black;
border: 1px solid #031E2A;
border-radius: 6px;
padding: 5px 12px;
font-size: 18px;
}
.mybutton:hover {
    background-color: #031E2A;
    color: #7EB2C8;
}

.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 40%;
}


</style>
</head>
<body>
	<div style="margin-left:70px;"><h2><b>Welcome ${user} !!</b></h2></div>
	<div class="bodycontent">
	<input type="button" class=mybutton value="Place Order" id="Order"
		name="Order" onclick="location.href = 'Menu/displayMenuItems';"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<br><br>	<input type="button" class=mybutton value="Cancel Order" id="cancel"
		name="cancel" onclick="location.href = 'cancelOrder';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<br><br><input type="button" class=mybutton value="Logout" id="Logout"
		name="Logout" onclick="location.href = 'logout';"><br/>
		</div>
</body>
</html>