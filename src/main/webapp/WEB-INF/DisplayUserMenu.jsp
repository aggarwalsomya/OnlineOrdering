<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form method="POST" action="Menu/displayMenuItems">
		<table>
			<tr>
				<td><label>Select a Category</label></td>
				<td><select name = "category">
						<option value="drink">Drink</option>
						<option value="appetizer">Appetizer</option>
						<option value="maincourse">Main course</option>
						<option value="desert">Desert</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="Search" /></td>
			</tr>
		</table>
	</form>



</body>
</html>