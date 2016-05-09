<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMPE275_TermProject_Group5:Place Order</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<p>hello ${user} ! </p>
		<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#Drinks">Drinks</a></li>
  <li><a data-toggle="tab" href="#Appetizers">Appetizers</a></li>
  <li><a data-toggle="tab" href="#Maincourse">Main Course</a></li>
  <li><a data-toggle="tab" href="#Deserts">Deserts</a></li>
</ul>          
<br>

 <div class="tab-content">
    <div id="Drinks" class="tab-pane fade in active">
    <table id="drinktable">
     <c:forEach var="list1" items="${list_drink}" varStatus="status">
				<tr style="border:1px solid black;" >
				<td><input id="cb1" type="checkbox" name="checker1"/>
				<td style="border:1px solid black;"><img alt="" src="data:image/jpeg;base64,${list1.picpath}" style="width:304px;height:228px;"></td>
				<td style="border:1px solid black;">${list1.name}</td>
				<td style="border:1px solid black;">${list1.unitprice}</td>
				<td style="border:1px solid black;">${list1.calories}</td>
				<td style="border:1px solid black;"><select class="1-100" id="quan_1"></select></td>
				</tr>
			</c:forEach>
		</table>
	 </div>
	 
    <div id="Appetizers" class="tab-pane fade">
	 <table  id="appetizertable">
     <c:forEach var="list2" items="${list_appetizer}" varStatus="status">
				<tr style="border:1px solid black;" ><td>
				<input id="cb1" type="checkbox" name="checker1"/>
				<td style="border:1px solid black;"><img alt="" src="data:image/jpeg;base64,${list2.picpath}" style="width:304px;height:228px;"></td>
				<td style="border:1px solid black;">${list2.name}</td>
				<td style="border:1px solid black;">${list2.unitprice}</td>
				<td style="border:1px solid black;">${list2.calories}</td>
				<td style="border:1px solid black;"><select class="1-100" id="quan_2"></select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="Maincourse" class="tab-pane fade">
	 <table  id="maincoursetable">
     <c:forEach var="list3" items="${list_maincourse}" varStatus="status">
				<tr style="border:1px solid black;" >
				<td><input id="cb1" type="checkbox" name="checker1"/>
				<td style="border:1px solid black;"><img alt="" src="data:image/jpeg;base64,${list3.picpath}" style="width:304px;height:228px;"></td>
				<td style="border:1px solid black;">${list3.name}</td>
				<td style="border:1px solid black;">${list3.unitprice}</td>
				<td style="border:1px solid black;">${list3.calories}</td>
				<td style="border:1px solid black;"><select class="1-100" id="quan_3"></select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="Deserts" class="tab-pane fade">
	 <table  id="deserttable">
     <c:forEach var="list4" items="${list_desert}" varStatus="status">
				<tr style="border:1px solid black;" >
				<td><input id="cb1" type="checkbox" name="checker1"/>
				<td style="border:1px solid black;"><img alt="" src="data:image/jpeg;base64,${list4.picpath}" style="width:304px;height:228px;"></td>
				<td style="border:1px solid black;">${list4.name}</td>
				<td style="border:1px solid black;">${list4.unitprice}</td>
				<td style="border:1px solid black;">${list4.calories}</td>
				<td style="border:1px solid black;"><select class="1-100" id="quan_4"></select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
  </div>
  <button id="jqcc">Add to cart</button>
  
  <form action="Checkout" method="POST">
  	<input type="hidden" id="itemData" name="itemData">
  	<input type="submit" id="next" value="Proceed to checkout"/>
  </form>
   
  <div id="demo1"></div>

<script>

$(function(){
	var $select= $(".1-100");
	for(i=1;i<=100;i++){
		$select.append($('<option></option>').val(i).html(i));
	}
var tableControl1= document.getElementById('drinktable');
var tableControl2= document.getElementById('appetizertable');
var tableControl3= document.getElementById('maincoursetable');
var tableControl4= document.getElementById('deserttable');
var arrayOfDrinks = [];
var arrayOfAppetizers = [];
var arrayOfMaincourse = [];
var arrayOfDeserts = [];
$('#jqcc').click(function() {
    $('input:checkbox:checked', tableControl1).each(function() {
        arrayOfDrinks.push($(this).closest('tr').find('td').eq(2).text()+'::'+$(this).closest('tr').find('td select#quan_1 option:selected').text());
    }).get();


    $('input:checkbox:checked', tableControl2).each(function() {
        arrayOfAppetizers.push($(this).closest('tr').find('td').eq(2).text()+'::'+$(this).closest('tr').find('td select#quan_2 option:selected').text());
    }).get();


    $('input:checkbox:checked', tableControl3).each(function() {
        arrayOfMaincourse.push($(this).closest('tr').find('td').eq(2).text()+'::'+$(this).closest('tr').find('td select#quan_3 option:selected').text());
    }).get();
    

    $('input:checkbox:checked', tableControl4).each(function() {
        arrayOfDeserts.push($(this).closest('tr').find('td').eq(2).text()+'::'+$(this).closest('tr').find('td select#quan_4 option:selected').text());
    }).get();
    
    $('input:checkbox').removeAttr('checked');
    var arrayOfItemNames= arrayOfDrinks.concat(arrayOfAppetizers,arrayOfMaincourse,arrayOfDeserts);
    var dataToSend= arrayOfItemNames.join(";;");
    document.getElementById("demo1").innerHTML = dataToSend;
    
    $('#next').click(function() {
    	document.getElementById("itemData").value = dataToSend;	
    });
});
});


</script>	
</body>
</html>