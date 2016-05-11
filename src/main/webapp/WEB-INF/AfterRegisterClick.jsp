<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5: After register click</title>
</head>
<body>
<form method="post" name="myform">
<p>${msg}</p>
<input class=button type="button" name="login" value="Login" onclick="location.href = 'http://127.0.0.1:8080/OnlineOrdering/';">
 <input class=button type="button" name="register" value="Register" onclick="location.href = 'register';">
</form>

</body>
</html>