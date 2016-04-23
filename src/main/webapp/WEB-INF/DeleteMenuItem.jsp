<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cmpe275_Term_Project_5 : Delete Menu Item</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#Delete').click(function() {
			$.ajax({
				url : 'http://localhost:8081/profile/' + $('#name').val(),
				type : 'DELETE',
	            success: function(msg){
            		window.location.href = "/profile"
	            }
			});
		});
	});
</script>
</head>
<body>

<form method="POST" action="deleteMenuItem">
		<table>
			<tr>
				<td><label>Item Name</label></td>
				<td><input type="text" name="name" value="${name}" /></td>
			</tr>

			<tr>
				<td><label>Picture</label></td>

				<td><input type="file" name="fileUpload" size="50" value="${fileUpload}"/></td>

			</tr>
			<tr>
				<td><label>Unite Price</label></td>
				<td><input type="text" name="unitprice" value="${unitprice}" /></td>
			</tr>
			<tr>
				<td><label>Calories</label></td>
				<td><input type="text" name="calories" value="${calories}"/></td>
			</tr>
			<tr>
				<td><label>Preparation Time</label></td>
				<td><input type="text" name="preptime" value="${preptime}"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Delete" /></td>
			</tr>
		</table>
	</form>


</body>
</html>