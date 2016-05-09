<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Welcome ${user} !!</p>
	<input type="button" class=button value="Place Order" id="Order"
		name="Order" onclick="location.href = 'Menu/displayMenuItems';">
	<input type="button" class=button value="Logout" id="Logout"
		name="Logout" onclick="location.href = 'signout';">
</body>
</html>