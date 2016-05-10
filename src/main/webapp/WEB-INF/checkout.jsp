<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
</head>
<body>


	<h2>Order Id:</h2>
	<h3 id="id">${orderid}</h3>

	<table>
		<c:forEach var="list" items="${menulist}" varStatus="status">
			<tr>
				<td>Item name : ${list.key}</td>
				<td>Item Value: ${list.value}</td>
			</tr>
		</c:forEach>
	</table>

	<p>Total Price: ${totalprice}</p>
	<input type="radio" style="margin-left: 20px" onclick="confirm()"
		name="pickup" value="confirm" />Earliest Pickup Time:
	${earliestpickuptime}
	<br>
	<br>
	<input type="radio" style="margin-left: 20px" onclick="custom()"
		name="pickup" value="custom" />Pick your own time
	<br>
	<br>


	<div id="datetimepicker" class="input-append date">
		<input type="text" id="in"></input> <span class="add-on"> <i
			data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
		</span>
	</div>

	<form method="post" action="finalCheckout">
		<input type="hidden" id="orderid" name="orderid" value="" /> <input
			type="hidden" id="type" name="type" value="" /> <input type="hidden"
			id="time" name="time" value="" /> <input type="submit" name="proceed"
			value="Proceed" />
	</form>

</body>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
</script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
</script>
<script type="text/javascript"
	src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
</script>
<script type="text/javascript"
	src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
</script>
<script type="text/javascript">
    $('#datetimepicker').datetimepicker({
        format: 'yyyy-MM-dd hh:mm',
        language: 'en'
    });
    var picker = $('#datetimepicker');
    picker.on('changeDate', function(e) {

        document.getElementById("time").value = document.getElementById("in").value;
    });
     
    document.getElementById("orderid").value = document.getElementById ('id').innerHTML; 
    
    function confirm() {
        document.getElementById("type").value = "confirm";
    }
    function custom() {
	   document.getElementById("type").value = "custom";
    }
 
</script>

</html>