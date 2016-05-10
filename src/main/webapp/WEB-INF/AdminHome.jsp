<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Cmpe275_Term_Project_5 : Admin Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
body {
	color: #103F53;
	background: #e6f3ff;
}

.col2 {
	width: 195px;
	height: 31px;
	display: block;
	float: left;
	margin: 0;
	
}

.mybutton{
	background-color: #7EB2C8;
	color:black;
	border: 1px solid #031E2A;
	border-radius: 4px;
	padding: 5px 12px;
	font-size: 16px;
	width:150px;
	text-align:center;
}

.mybutton:hover {
    background-color: #031E2A;
    color: #7EB2C8;
}

.bodycontent {
	margin: auto;
	margin-top: 50px;
	width: 40%;
}
</style>

</head>


<body>

                 <div style="margin-left:70px;">   <h2>Welcome Admin!</h2></div>


   
           <div class="bodycontent">
          					<input type="button" class=mybutton value="Add Menu Item"
					id="addMenuItem" name="addMenuItem" onclick="location.href = 'addIt';">
					<br><br>
			
					<input type="button" class=mybutton value="Delete Menu Item"
					id="delete" name="delete" onclick="location.href = 'AdminDelete';">
		<br><br>
					<input type="button" class=mybutton value="System Reset"
					id="reset" name="reset" onclick="location.href = 'reset';">
				<br><br>
					<input type="button" class=mybutton value="View Orders"
					id="vieworders" name="vieworders" onclick="location.href = 'vieworders';">
				
</div>
</body>


</html>
