<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Cmpe275_Term_Project_5 : Add New Menu Item</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	text-align: right;
	width: 170px;
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

.col2comment {
	width: 195px;
	height: 98px;
	margin: 0;
	display: block;
	float: left;
	
}

.col1comment {
	text-align: right;
	width: 135px;
	height: 98px;
	float: left;
	display: block;
	margin-right: 2px;
	
}

div.row {
	clear: both;
	width: 435px;
}

.input {
	margin: 4px 0 5px 8px;
	padding: 1px;
	border: 1px solid #8595B2;
	height:30px;
}

.textarea {
	border: 1px solid #8595B2;
	margin: 4px 0 5px 8px;
}

.button:hover {
    background-color: #031E2A;
    color: #7EB2C8;
} 


.button{
margin-left : 100px;
background-color: #7EB2C8;
color:black;
border: 1px solid #031E2A;
border-radius: 6px;
padding: 5px 12px;
font-size: 18px;
}

.bodycontent {
	margin: auto;
	margin-top: 20px;
	width: 40%;
}
.exist{
margin-left : 155px;
}

.footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: #e6f3ff;
  text-align: center;
  align: center;
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
<body>



<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
$("document").ready(function(){
    $("#fileUpload").change(function() {
    	  var filesize = this.files[0].size;
    	  if(filesize > 1024 * 1024) {
    		  alert('Image size too big, max is 1MB');
    		  $("#fileUpload").val('');
    	  }
            });
});
</script>




                   
                    
 
<div class="bodycontent">
<div id="title">Add an Item</div>
 <hr />
          <form method="post" action="addItem" enctype="multipart/form-data">
        
          
          <div class="bodycontent">
    <div class="row">
        <label class="col1">Item Name: &nbsp;&nbsp;</label>
        <span class="col2"><input type="text" name="name"
          placeholder="enter item name" required /></span>
      </div>
      
      <div class="row">
      <label class="col1">Category: &nbsp;&nbsp;</label>
         <span class="col2"><select name="category" style="width:145px;">
                <option name="drink" value="drink">Drink</option>
                <option name="appetizer" value="appetizer">Appetizer</option>
                <option name="maincourse" value="maincourse">Main course</option>
                <option name="desert" value="desert">Desert</option>
          </select></span>
            </div>
        
      <div class="row">
        <label class="col1">Picture: &nbsp;&nbsp;</label>
        <span class="col2"><input type="file" id="fileUpload" name="fileUpload" size="500000" style="width:145px;" required/>

     </div>
      <div class="row">
        <label class="col1">Unite Price: &nbsp;&nbsp;</label><span class="col2">
        <input type="text" name="unitprice" placeholder="enter price for 1 item" required/></span>
     </div>
      <div class="row">
        <label class="col1">Calories: &nbsp;&nbsp;</label>
        <span class="col2"><input type="text" name="calories" placeholder="enter calories in item" required/></span>
      </div>
      <div class="row">
        <label class="col1" >Preparation Time (in mins): &nbsp;&nbsp;</label>        
        <span class="col2" style="width:190px;"><input type="text" name="preptime" placeholder="enter preparation time (in mins)" required/></span>
     </div>
      <div class="row">
        <input type="submit" class=mybutton value="Add" style="margin-left:170px;"required>
      </div>
      

    </div>
  </form>
 <br><br><br><br>
 
 
  <input type="button" class=mybutton value="Admin Home" style="margin-left:280px;"
          id="back" name="back" onclick="location.href = 'AdminHome';">
</div>
</body>
</html>
