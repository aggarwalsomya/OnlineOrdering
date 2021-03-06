

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:View All Orders</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#backgroundImage{z-index: 1;}

#backgroundImage:before {
   content: "";
   position: absolute;
   z-index: -1;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
  background-image:url('resources/images/spices.jpg');
 background-repeat: no-repeat;
    background-size: 100%;
    opacity: 0.9;
    filter:alpha(opacity=40);
    height:100%;
    width:100%;
 }


body {
  background-size:auto 100%;
	color: #000000;
  	background-image:url('resources/images/spices.jpg');
		font-family: Papyrus, fantasy;
		font-weight: bold;
	    background-repeat:repeat-y;
	    background-position: 10% 50%;
	    background-attachment: fixed;
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
	color:#ffffff;
}

 

.bodycontent {
	margin: auto;
	margin-top: 70px;
	width: 65%;
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
img{
height:100px;
width:100px;
}

input[type=checkbox] {
    zoom: 1.5;
}

.nav-tabs{
  background-color:#ffffff;
}
.tab-content{
    background-color:#ffffff;
min-width:1000px;
    padding:2px;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
{
background-color:#ffffff;
}

td{
min-width:70px;
text-align:center;
padding:7px;
}

tr{
padding:15px;
}
th{
padding:15px;
text-align:center;
background:#d15d10;
}

#custom-bootstrap-menu.navbar-default {
    font-size: 17px;
    background-color: rgba(223, 111, 18, 1);
    border-bottom-width: 1px;
}
#custom-bootstrap-menu.navbar-default .navbar-nav>li>a {
    color: rgba(0, 0, 0, 1);
    background-color: rgba(223, 111, 18, 1);
}
#custom-bootstrap-menu.navbar-default .navbar-nav>li>a:hover,
#custom-bootstrap-menu.navbar-default .navbar-nav>li>a:focus {
    color: rgba(51, 51, 51, 1);
    background-color: rgba(223, 111, 18, 1);
}
#custom-bootstrap-menu.navbar-default .navbar-nav>.active>a,
#custom-bootstrap-menu.navbar-default .navbar-nav>.active>a:hover,
#custom-bootstrap-menu.navbar-default .navbar-nav>.active>a:focus {
    color: rgba(0, 0, 0, 1);
    background-color: rgba(209, 93, 16, 1);
}
#custom-bootstrap-menu.navbar-default .navbar-toggle {
    border-color: #d15d10;
}
#custom-bootstrap-menu.navbar-default .navbar-toggle:hover,
#custom-bootstrap-menu.navbar-default .navbar-toggle:focus {
    background-color: #d15d10;
}
#custom-bootstrap-menu.navbar-default .navbar-toggle .icon-bar {
    background-color: #d15d10;
}
#custom-bootstrap-menu.navbar-default .navbar-toggle:hover .icon-bar,
#custom-bootstrap-menu.navbar-default .navbar-toggle:focus .icon-bar {
    background-color: #df6f12;
}
</style>


</head>
<body id="backgroundImage">
<!---navbar----->
<div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation" style="background:#df6f12; height:70px;">
    <div class="container-fluid" style="margin-top:15px; font-size:20px;margin-right:12px;">
        <div class="collapse navbar-collapse navbar-menubuilder" >
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/OnlineOrdering/AdminHome">Home</a>
                </li>
                <li><a href="/OnlineOrdering/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!---navbar----->
<div class="bodycontent">
<br><br><br><br>
<div id="title" style="margin-left:35%;"><b>View all orders</b></div>
<br><br>
	<div class="tab-content">
		<div id="Drinks" class="tab-pane fade in active">
			<table id="viewallorders">
			 <tr>
	<th>User Name</th>
    <th>User Email</th>
    <th>Order Id</th>
    <th>Order Date</th>
    <th>Status</th>
    <th>Pickup Date</th>
    <th>Pickup Time</th>
    <th>Prep Start Time</th>
    <th>Prep End Time</th>
    <th>Item Name</th>
    <th>Quantity</th>
    <th>Total Price</th>
   </tr>
				<c:forEach var="list1" items="${orderlist}" varStatus="status">
					<tr style="border: 2px solid #103F53;" >
						<td>${list1.username}</td>
						<td>${list1.email}</td>
						<td>${list1.orderid}</td>
						<td>${list1.orderdate}</td>
						<td>${list1.status}</td>
						<td>${list1.pickup_date}</td>
						<td>${list1.pickup_time}</td>
						<td>${list1.prepStartTime}</td>
						<td>${list1.prepEndTime}</td>
						<td colspan=2><c:forEach var="list" items="${list1.menumap}" varStatus="status">
								<table><tr>	<td>${list.key}</td>
								<td>${list.value}</td></tr></table>
						</c:forEach></td>
						<td>${list1.price}</td>			
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br><br>
	</div>
</body>
</html>