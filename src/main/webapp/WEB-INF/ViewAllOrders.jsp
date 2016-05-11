<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:View All Orders</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<p>Welcome Administrator</p>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#Drinks">View All Orders</a></li>
	</ul>
	<br>

	<div class="tab-content">
		<div id="Drinks" class="tab-pane fade in active">
			<table id="viewallorders">
				<c:forEach var="list1" items="${orderlist}" varStatus="status">
					<tr style="border: 1px solid black;">
						<td style="border: 1px solid black;">${list1.orderid}</td>
						<td style="border: 1px solid black;">${list1.username}</td>
						<td style="border: 1px solid black;">${list1.email}</td>
						<td style="border: 1px solid black;">${list1.status}</td>
						<td style="border: 1px solid black;">${list1.pickup_date}</td>
						<td style="border: 1px solid black;">${list1.pickup_time}</td>
						<c:forEach var="list" items="${list1.menumap}" varStatus="status">
								<td>${list.key}</td>
								<td>${list.value}</td>
						</c:forEach>			
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br><br>
</body>
</html>