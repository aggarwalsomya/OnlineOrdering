<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:Menu Items</title>
</head>
<body>
	

		<table style="border:1px solid black;">
		<thead>
    <tr>
      <th style="border:1px solid black;">Image</th>
      <th style="border:1px solid black;">Name</th>
      <th style="border:1px solid black;">Unit Price</th>
      <th style="border:1px solid black;">Calories</th>
      <th style="border:1px solid black;">Select</th>
          </tr></thead>
			<c:forEach var="listValue" items="${list}" varStatus="status">
				<tr style="border:1px solid black;" ><td style="border:1px solid black;">${listValue.picture}</td>
				<td style="border:1px solid black;">${listValue.name}</td>
				<td style="border:1px solid black;">${listValue.unitprice}</td>
				<td style="border:1px solid black;">${listValue.calories}</td>
				<td><button>Add to cart</button></td></tr>
			</c:forEach>
		</table>
</body>
</html>