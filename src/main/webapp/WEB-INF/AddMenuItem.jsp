<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cmpe275_Term_Project_5 : Add New Menu Item</title>
</head>
<body>

	<h1>Add New Menu Item</h1>
	<form method="POST" action="addItem" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label>Item Name</label></td>
				<td><input type="text" name="name"
					placeholder="enter item name" required /></td>
			</tr>
			<tr>
				<td><label>Category</label></td>
				<td><select>
  							<option value="drink">Drink</option>
  							<option value="appetizer">Appetizer</option>
  							<option value="maincourse">Main course</option>
  							<option value="desert">Desert</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>Picture</label></td>
				<td><input type="file" name="fileUpload" size="50" required/></td>
			</tr>
			<tr>
				<td><label>Unite Price</label></td>
				<td><input type="text" name="unitprice" placeholder="enter price for 1 item" required/></td>
			</tr>
			<tr>
				<td><label>Calories</label></td>
				<td><input type="text" name="calories" placeholder="enter calories in item" required/></td>
			</tr>
			<tr>
				<td><label>Preparation Time (in mins)</label></td>
				<td><input type="text" name="preptime" placeholder="enter preparation time (in mins)" required/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add" /></td>
			</tr>
		</table>
	</form>
</body>
</html>