<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.2.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="http://trentrichardson.com/examples/timepicker/jquery-ui-timepicker-addon.js"></script> 
</head>
<body>


		<form method="post" action="popularityReport" >
		Start Date:
		<input type="text" id="startDate" /><br><br>
		End Date: 
		<input type="text" id="endDate" /><br><br>
		<button type="submit" onclick="myfunc();">Generate</button>
		
		</form>
		<script>
    $(function () {
    	
        $('#startDate').datepicker({	   
		   dateFormat: 'dd-mm-yy',
		});
        
        
        $('#endDate').datepicker({	   
 		   dateFormat: 'dd-mm-yy',
 		});
       
        function myfunc(){
          	 var dateObject1 = $('#startDate').val();
          	 var dateObject2 = $('#endDate').val();   
          	document.getElementById("startDate").value = dateObject1;
          	document.getElementById("endDate").value = dateObject2;
          }
      }); 
    
    
</script>  

</body>
</html>