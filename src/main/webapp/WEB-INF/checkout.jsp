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
	margin-left:90px;
}

form {
	width: 335px;
}

.col1 {
	text-align: left;
	width: 250px;
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

div.row {
	clear: both;
	width: 675px;
}


.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 40%;
}

.mybutton{
	background-color: #7EB2C8;
	color:black;
	border: 1px solid #031E2A;
	border-radius: 4px;
	padding: 5px 12px;
	font-size: 14px;
}
.mybutton:hover {
    background-color: #031E2A;
    color: #7EB2C8;
}


input[type=checkbox] {
    zoom: 1.5;
}
td{

}

</style>


</head>
<body>
<div class="bodycontent">


	<div class="row">
	<label class="col1"><b>Order Id: </b></label>
	<span class="col2" id="id">${orderid}</span>
	</div>

	<table>
	<tr><th style="text-align:left;">Item Name</th>
	<th>Quantity</th></tr>
		<c:forEach var="list" items="${menulist}" varStatus="status">
			<tr>
				<td>${list.key}</td>
				<td style="text-align:center;">${list.value}</td>
			</tr><br>
		</c:forEach>
	</table>
	<br><br>
	<div class="row">
	<label class="col1">Total Price:&nbsp;&nbsp;</label>
	<span class="col2">$ ${totalprice}</span>
	</div>
	
	<div class="row">
	<label class="col1"><input type="radio" onclick="confirm()"
		name="pickup" value="confirm"/>&nbsp;&nbsp;Earliest Pickup Time: &nbsp;&nbsp;</label>
		<span class="col2" id="early">${earliestpickuptime}</span>
	</div>
	
	<div class="row">
	<label class="col1">
	<input type="radio" onclick="custom()"
		name="pickup" value="custom" />&nbsp;&nbsp;<span>Pick your own date & time.(Between 6am-9pm, within next 30 days.)</span>&nbsp;&nbsp;</label>
		<span class="col2">
	<div id="datetimepicker" class="input-append date">
		<input type="text" id="in"></input> <span class="add-on" id="in1"> <i
			data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
		</span>
	</div></span></div>
<br><br><br><br>
	<form method="post" action="finalCheckout">
		<input type="hidden" id="orderid" name="orderid" value="" /> <input
			type="hidden" id="type" name="type" value="" /> <input type="hidden"
			id="time" name="time" value="" /> <input type="hidden"
			id="earlypickuptime" name="early" value="" /> <input type="submit"
			name="proceed" class=mybutton value="Proceed" />

	</form>
</div>
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

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth(); 
var yyyy = today.getFullYear();
var future = new Date();
future.setDate(future.getDate() + 30);
var ddf = future.getDate();
var mmf = future.getMonth(); 
var yyyyf = future.getFullYear();

    $('#datetimepicker').datetimepicker({
        format: 'yyyy-MM-dd hh:mm',
        language: 'en',
        startDate: new Date(yyyy, mm, dd),
        endDate: new Date(yyyyf, mmf, ddf),
        pickSeconds: false
    });
    var picker = $('#datetimepicker');
    picker.on('changeDate', function(e) {
    	 var time = document.getElementById("in").value;
         var spl = time.split(" ");
         var hour = spl[1].split(":");
         var date = spl[0].split("-");
         
         var now = new Date(); 
		 var setDate = e.date;
         
         if (parseInt(hour[0]) < 6 || parseInt(hour[0]) > 21 )  {
             alert("Please select a valid time between 06:00 and 21:00 ");
             document.getElementById("in").value = "";
         } else if(parseInt(hour[0]) == 21) {
        	 if(parseInt(hour[1]) > 0) {
        		 alert("Please select a valid time between 06:00 and 21:00 ");
                 document.getElementById("in").value = "";
        	 }
         } /*else if (now.getTime() > setDate.getTime()) {
			 alert("Selected time is in past. Try Again!");
             document.getElementById("in").value = "";
         }*/
         
        document.getElementById("time").value = document.getElementById("in").value;
    });
     
    document.getElementById("orderid").value = document.getElementById ('id').innerHTML;
    document.getElementById("earlypickuptime").value = document.getElementById ('early').innerHTML;
    function confirm() {
        document.getElementById("type").value = "confirm";
        document.getElementById("in").disabled=true;
        document.getElementById("in1").style.visibility = "hidden";
    }
    function custom() {
	   document.getElementById("type").value = "custom";
	   document.getElementById("in").disabled=false;
       document.getElementById("in1").style.visibility = "visible";
    }
 
</script>

</html>