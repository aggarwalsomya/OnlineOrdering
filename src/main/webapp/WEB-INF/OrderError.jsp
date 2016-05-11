
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cmpe275_Term_Project_5 Error- Order</title>
</head>
<body>
	<h1>Error in Placing the order</h1>
	<br>
	<br>
	<p>Error in Placing the order for Orderid: ${orderid}</p>

	<input type="button" class=button value="Cancel Order" id="back" name="Cancel Order"
		onclick="location.href = 'cancelOrder';">
	<input type="button" class=button value="Modify Order" id="back" name="Modify Order"
		onclick="location.href = 'modifyOrder';">
</body>
</html>