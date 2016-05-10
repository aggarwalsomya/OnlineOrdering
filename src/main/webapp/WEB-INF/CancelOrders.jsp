<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:Delete Menu Items</title>
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
	<p>Welcome User</p>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#Drinks">Delete Queued Orders</a></li>
	</ul>
	<br>

	<div class="tab-content">
		<div id="Drinks" class="tab-pane fade in active">
			<table id="deletetable">
				<c:forEach var="list1" items="${orderlist}" varStatus="status">
					<tr style="border: 1px solid black;">
						<td><input id="cb1" type="checkbox" name="checker1" />
						<td style="border: 1px solid black;">${list1.orderid}</td>
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
	
	<button id="jqcc">Delete Selected Items</button>
	<br><br>
	<form action="deleteMenuItem" method="POST">
		<input type="hidden" id="itemData" name="itemData"> 
		<p>Please press confirm delete to make sure you want to delete these items</p><br>
		<input type="submit" id="next" value="Confirm Delete" />
	</form>

	<div id="demo1"></div>

	<script>
		$(function() {
			var tableControl1 = document.getElementById('deletetable');
			var arrayOfDrinks = [];

			$('#jqcc').click(function() {
			    $('input:checkbox:checked', tableControl1).each(function() {
			        arrayOfDrinks.push($(this).closest('tr').find('td').eq(3).text());
			    }).get();
			    
								$('input:checkbox').removeAttr('checked');
								var arrayOfItemNames = arrayOfDrinks;
								var dataToSend = arrayOfItemNames.join(";;");
								document.getElementById("demo1").innerHTML = dataToSend;

								$('#next').click(function() {document.getElementById("itemData").value = dataToSend;});
							});
		});
	</script>
</body>
</html>