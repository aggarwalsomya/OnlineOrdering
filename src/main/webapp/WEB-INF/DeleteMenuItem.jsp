<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cmpe275_Term_Project_5 : Delete Menu Item</title>

</head>
<body>

	<form method="POST" action="deleteItem">
		<table>
			<tr>
				<td><label>Item Name</label></td>
				<td>${name}</td>
			</tr>

			<tr>
				<td><label>Picture</label></td>

				<td>${fileUpload}</td>

			</tr>
			<tr>
				<td><label>Unite Price</label></td>
				<td>${unitprice}</td>
			</tr>
			<tr>
				<td><label>Calories</label></td>
				<td>${calories}</td>
			</tr>
			<tr>
				<td><label>Preparation Time</label></td>
				<td>${preptime}</td>
			</tr>
			<tr>
				<td><input type="submit" value="Delete" /></td>
			</tr>
		</table>
	</form>
	<input type="button" class=button value="back" id="back" name="back"
		onclick="location.href = 'home';">

</body>
</html>