
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cmpe275_Term_Project_5 Error- Order</title>
<style>
body {
	color: #103F53;
	background: #e6f3ff;
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

</style>
</head>
<body class="bodycontent">
	<h1>Error in Placing the order</h1>
	<br>
	<br>
	<p>Error in Placing the order for Orderid:<span id="id">${orderid}</span></p>
<form method="POST" name="myform" action="">
<input type="hidden" id="orderId" name="orderId"><br />
	<input type="submit" class=mybutton value="Cancel Order" id="back" name="Cancel Order"
		onclick="selected(this.value)">
	<input type="submit" class=mybutton value="Modify Order" id="back" name="Modify Order"
		onclick="selected(this.value)">
		</form>
		
		<script type="text/javascript">
	function selected(value){
		var orderid= ${orderid};
		var variable = value;	
		  if(variable == "Modify Order")
		  {
			  alert("here");
		   document.myform.action ="modifyOrder";
		  }
		  else
		  if(variable == "Cancel Order")
		  {
		    document.myform.action ="cancelOrder";
		  }
	
		  document.getElementById("orderId").value = orderid;
	}
	</script>
</body>
</html>