<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML>
<html>
  <head>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  </head>
<body>
<h3>Order Id: ${orderid}<h3>
//Table for order details
<table>
     <c:forEach var="list" items="${menulist}" varStatus="status">
				<tr>
				<td>Item name : ${list.key}</td>
				<td>Item Value: ${list.value}</td>
				</tr>
			</c:forEach>
		</table>
		
		<p>Total Price: ${totalprice}</p>
		<p>Date for pickup : ${earlydate}</p>
		Earliest Pickup Time: ${earliestpickuptime}<br>
		<button>Place Order</button>
		 <div id="datetimepicker" class="input-append date">
      <input type="text"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
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
        format: 'dd/MM/yyyy hh:mm',
		pickDate: false, 
		pickSeconds: false,
        language: 'pt-BR'
      });
	  
	  $.fn.datetimepicker.defaults = {
  maskInput: true,           // disables the text input mask
  pickDate: false,            // disables the date picker
  pickTime: true,            // disables de time picker
  pick12HourFormat: false,   // enables the 12-hour format time picker
  pickSeconds: false,         // disables seconds in the time picker
  startDate: -Infinity,      // set a minimum date
  endDate: Infinity          // set a maximum date
};
    </script>
</body>
</html>