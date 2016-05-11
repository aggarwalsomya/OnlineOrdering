<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:Place Order</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body {
	color: #103F53;
	background: #e6f3ff;
}

#title {
	width: 350px;
	height: 26px;
	padding-top: 15px;
	text-transform: uppercase;
	letter-spacing: 2px;
	text-align: center;
	font-size: 22px;
	margin-left: 90px;
}

form {
	width: 335px;
}

.col1 {
	text-align: right;
	width: 170px;
	height: 31px;
	margin: 0;
	float: left;
	margin-right: 2px;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.col2 {
	width: 195px;
	height: 40px;
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
	width: 435px;
}

.button:hover {
	background-color: #031E2A;
	color: #7EB2C8;
}

.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 40%;
}

.mybutton {
	background-color: #7EB2C8;
	color: black;
	border: 1px solid #031E2A;
	border-radius: 4px;
	padding: 5px 12px;
	font-size: 14px;
}

.mybutton:hover {
	background-color: #031E2A;
	color: #7EB2C8;
}

img {
	height: 100px;
	width: 100px;
}

input[type=checkbox] {
	zoom: 1.5;
}

<<<<<<< HEAD
.nav-tabs{
  background-color:#ffffff;
  width:520px;
}
.tab-content{
    background-color:#ffffff;
	width:520px;
    padding:5px;
=======
.nav-tabs {
	background-color: #ffffff;
}

.tab-content {
	background-color: #ffffff;
	padding: 5px;
>>>>>>> 2105daf0c840fc2d8655f45bcd341a908bb1ac7f
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	background-color: #ffffff;
}

td {
	min-width: 70px;
	text-align: center;
	padding: 7px;
}

tr {
	padding: 15px;
}

th {
	padding: 15px;
	text-align: center;
}
</style>


</head>
<body>
	<p>hello ${user} !</p>
	<div class="bodycontent">

		<div id="title">
			<b>Select Your Order</b>
		</div>
		<br>
		<br>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#Drinks">Drinks</a></li>
			<li><a data-toggle="tab" href="#Appetizers">Appetizers</a></li>
			<li><a data-toggle="tab" href="#Maincourse">Main Course</a></li>
			<li><a data-toggle="tab" href="#Deserts">Deserts</a></li>

		</ul>
		<div class="tab-content">
			<br>
			<br>

			<div id="Drinks" class="tab-pane fade in active">
				<table id="drinktable">
					<tr>
						<th></th>
						<th></th>

						<th>Item Name</th>
						<th>Price</th>
						<th>Calories</th>
						<th>Quantity</th>
					</tr>
					<c:forEach var="list1" items="${list_drink}" varStatus="status">
						<tr>
							<td><input id="cb1" type="checkbox" name="checker1"
								<c:if test="${not empty BulkList}"><c:if test="${BulkList.containsKey(list1.name)}">checked="checked" </c:if>
							</c:if>
							/>
							<td><img alt=""
								src="data:image/jpeg;base64,${list1.picpath}"></td>
							<td>${list1.name}</td>
							<td>${list1.unitprice}</td>
							<td>${list1.calories}</td>
							<td><select class="1-100" id="quan_1"></select></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="Appetizers" class="tab-pane fade">
				<table id="appetizertable">
					<tr>
						<th></th>
						<th></th>

						<th>Item Name</th>
						<th>Price</th>
						<th>Calories</th>
						<th>Quantity</th>
					</tr>
					<c:forEach var="list2" items="${list_appetizer}" varStatus="status">
						<tr>
							<td><input id="cb1" type="checkbox" name="checker1"
								<c:if test="${not empty BulkList}"><c:if test="${BulkList.containsKey(list2.name)}">checked="checked" </c:if>
							</c:if> />
							<td><img alt=""
								src="data:image/jpeg;base64,${list2.picpath}"></td>
							<td>${list2.name}</td>
							<td>${list2.unitprice}</td>

							<td>${list2.calories}</td>
							<td><select class="1-100" id="quan_2"></select></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="Maincourse" class="tab-pane fade">
				<table id="maincoursetable">
					<tr>
						<th></th>
						<th></th>

						<th>Item Name</th>
						<th>Price</th>
						<th>Calories</th>
						<th>Quantity</th>
					</tr>
					<c:forEach var="list3" items="${list_maincourse}"
						varStatus="status">
						<tr><td>
							<input id="cb1" type="checkbox" name="checker1"
								<c:if test="${not empty BulkList}"><c:if test="${BulkList.containsKey(list3.name)}">checked="checked" </c:if>
							</c:if>
							/>
							<td><img alt=""
								src="data:image/jpeg;base64,${list3.picpath}"></td>
				<td>${list3.name}</td>
				<td>${list3.unitprice}</td>
				<td>${list3.calories}</td>
				<td><select class="1-100" id="quan_3"></select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="Deserts" class="tab-pane fade">
	 <table id="deserttable">
	 <tr>
    <th></th>
    <th></th>
    
    <th>Item Name</th>
    <th>Price</th>
    <th>Calories</th>
    <th>Quantity</th>
					</tr>
     <c:forEach var="list4" items="${list_desert}" varStatus="status">
				<tr><td>
			    <input id="cb1" type="checkbox" name="checker1"
								<c:if test="${not empty BulkList}"><c:if test="${BulkList.containsKey(list4.name)}">checked="checked" </c:if>
							</c:if> />
			    <td><img alt=""
								src="data:image/jpeg;base64,${list4.picpath}"></td>
				<td>${list4.name}</td>
				<td>${list4.unitprice}</td>
				
				<td>${list4.calories}</td>
				<td><select class="1-100" id="quan_4"></select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	


	
	
  </div>
		<br><br>
  <button class="mybutton" id="jqcc">Add to cart</button>
  <br>
  <form action="Checkout" method="POST">
  	<input type="hidden" id="itemData" name="itemData"><br />
  	<input type="submit" class="mybutton" id="next"
				value="Proceed to checkout" />
  </form>
	</div>  
  <div id="demo1"></div>

<script>
	$(function() {
		var $select = $(".1-100");
		for (i = 1; i <= 100; i++) {
			$select.append($('<option></option>').val(i).html(i));
		}
		var tableControl1 = document.getElementById('drinktable');
		var tableControl2 = document.getElementById('appetizertable');
		var tableControl3 = document.getElementById('maincoursetable');
		var tableControl4 = document.getElementById('deserttable');
		var arrayOfDrinks = [];
		var arrayOfAppetizers = [];
		var arrayOfMaincourse = [];
		var arrayOfDeserts = [];
		$('#jqcc')
				.click(
						function() {
							$('input:checkbox:checked', tableControl1)
									.each(
											function() {
												arrayOfDrinks
														.push($(this).closest(
																'tr')
																.find('td').eq(
																		2)
																.text()
																+ '::'
																+ $(this)
																		.closest(
																				'tr')
																		.find(
																				'td select#quan_1 option:selected')
																		.text());
											}).get();

							$('input:checkbox:checked', tableControl2)
									.each(
											function() {
												arrayOfAppetizers
														.push($(this).closest(
																'tr')
																.find('td').eq(
																		2)
																.text()
																+ '::'
																+ $(this)
																		.closest(
																				'tr')
																		.find(
																				'td select#quan_2 option:selected')
																		.text());
											}).get();

							$('input:checkbox:checked', tableControl3)
									.each(
											function() {
												arrayOfMaincourse
														.push($(this).closest(
																'tr')
																.find('td').eq(
																		2)
																.text()
																+ '::'
																+ $(this)
																		.closest(
																				'tr')
																		.find(
																				'td select#quan_3 option:selected')
																		.text());
											}).get();

							$('input:checkbox:checked', tableControl4)
									.each(
											function() {
												arrayOfDeserts
														.push($(this).closest(
																'tr')
																.find('td').eq(
																		2)
																.text()
																+ '::'
																+ $(this)
																		.closest(
																				'tr')
																		.find(
																				'td select#quan_4 option:selected')
																		.text());
											}).get();

							$('input:checkbox').removeAttr('checked');
							var arrayOfItemNames = arrayOfDrinks.concat(
									arrayOfAppetizers, arrayOfMaincourse,
									arrayOfDeserts);
							var dataToSend = arrayOfItemNames.join(";;");
							document.getElementById("demo1").innerHTML = dataToSend;

							$('#next')
									.click(
											function() {
												document
														.getElementById("itemData").value = dataToSend;
											});
						});
	});
</script>
							</body>
</html>