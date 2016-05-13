<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Cmpe275_Term_Project_5 : Add New Menu Item</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="assets/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/modernizr.custom.js"></script>
	

	
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet' type='text/css'>
<style type="text/css">
/*
 * Author: Ojas Kale
 */

body {
  background-color: #f2f2f2;
    font-family: 'EB Garamond', serif;
    font-weight: 300;
    font-size: 16px;
    color: #555;

    -webkit-font-smoothing: antialiased;
    -webkit-overflow-scrolling: touch;
}

/* Titles */
h1, h2, h3, h4, h5, h6 {
    font-family: 'Oswald', sans-serif;
    font-weight: 300;
    color: #333;
}


/* Paragraph & Typographic */
p {
    line-height: 28px;
    margin-bottom: 25px;
}

.centered {
    text-align: center;
}

/* Links */
a {
    color: #f85c37;
    word-wrap: break-word;

    -webkit-transition: color 0.1s ease-in, background 0.1s ease-in;
    -moz-transition: color 0.1s ease-in, background 0.1s ease-in;
    -ms-transition: color 0.1s ease-in, background 0.1s ease-in;
    -o-transition: color 0.1s ease-in, background 0.1s ease-in;
    transition: color 0.1s ease-in, background 0.1s ease-in;
}

a:hover,
a:focus {
    color: #7b7b7b;
    text-decoration: none;
    outline: 0;
}

a:before,
a:after {
    -webkit-transition: color 0.1s ease-in, background 0.1s ease-in;
    -moz-transition: color 0.1s ease-in, background 0.1s ease-in;
    -ms-transition: color 0.1s ease-in, background 0.1s ease-in;
    -o-transition: color 0.1s ease-in, background 0.1s ease-in;
    transition: color 0.1s ease-in, background 0.1s ease-in;
}

 hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}


/* ==========================================================================
   Wrap Sections
   ========================================================================== */

#headerwrap {
	background: url(https://i.ytimg.com/vi/8DJU5-D2BYQ/maxresdefault.jpg) no-repeat center top;
	margin-top: -10px;
	padding-top:20px;
	text-align:center;
	background-attachment: relative;
	background-position: center center;
	min-height: 700px;
	width: 100%;
	
    -webkit-background-size: 100%;
    -moz-background-size: 100%;
    -o-background-size: 100%;
    background-size: 100%;

    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

#headerwrap h1 {
	margin-top: 150px;
	color: white;
	font-size: 70px;
	font-weight: 700;
}

#headerwrap h3 {
	color: white;
	font-size: 30px;
	font-weight: 100;
    font-family: 'EB Garamond', serif;
    font-style: oblique;
}

#headerwrap .logo {
	text-align: left;
	margin-left: 20px;
	margin-top: 15px;
}


/* Footer Wrap */

#f {
	background: #1a1a1a;
	padding-top: 70px;
	padding-bottom: 70px;
	text-align: center
}

#f h3 {
	color: white;
	font-size: 28px;
	font-weight: 700;
	letter-spacing: 1px;	
}

#f i {
	font-size: 8px;
	color: #fff;
    padding: 3px;
}

#f p {
	font-size: 20px;
	color: #f2f2f2;
}

#f img {
	text-align: center;
}


/* MENU CONF*/

.menu {
	position: fixed;
	right: -200px;
	width: 260px;
	height: 100%;
	top: 0;
	z-index: 10;
	text-align: left;
}

.menu.menu-open {
	right: 0px;
}

.menu-wrap {
	position: absolute;
	top: 0;
	left: 60px;
	background: #1a1a1a;
	width: 200px;
	height: 100%;
}

.menu h1.logo a {
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 700;
	letter-spacing: 0.15em;
	line-height: 40px;
	text-transform: uppercase;
	color: #ffffff;
	margin-top: 20px;
}

.menu h1.logo a:hover {
	color: #f85c37;
}

.menu img.logo {
	margin: 20px 0;
	max-width: 160px;
}

.menu a {
	margin-left: 20px;
	color: #808080;
	display: block;
	font-size: 12px;
	font-weight: 700;
	line-height: 40px;
	letter-spacing: 0.1em;
	text-transform: uppercase;
}

.menu a:hover {
	color: #ffffff;
}

.menu a:active {
	color: #ffffff;
}

.menu a > i {
	float: left;
	display: inline-block;
	vertical-align: middle; 
	text-align: left;
	width: 25px;
	font-size: 14px;
	line-height: 40px;
	margin: 25px 2px;
}

.menu-close {
	cursor: pointer;
	display: block;
	position: absolute;
	font-size: 14px;
	color: #808080;
	width: 40px;
	height: 40px;
	line-height: 40px;
	top: 20px;
	right: 5px;
	-webkit-transition: all .1s ease-in-out;
	   -moz-transition: all .1s ease-in-out;
		-ms-transition: all .1s ease-in-out;
		 -o-transition: all .1s ease-in-out;
			transition: all .1s ease-in-out;
}

.menu-close:hover {
	color: #ffffff;
	-webkit-transition: all .1s ease-in-out;
	   -moz-transition: all .1s ease-in-out;
		-ms-transition: all .1s ease-in-out;
		 -o-transition: all .1s ease-in-out;
			transition: all .1s ease-in-out;
}

/* Push the body after clicking the menu button */
.body-push {
	overflow-x: hidden;
	position: relative;
	left: 0;
}

.body-push-toright {
	left: 200px;
}

.body-push-toleft {
	left: -200px;
}

.menu,
.body-push {
	-webkit-transition: all .3s ease;
	   -moz-transition: all .3s ease;
		-ms-transition: all .3s ease;
		 -o-transition: all .3s ease;
			transition: all .3s ease;
}

#menuToggle {
	position: absolute;
	top: 20px;
	left: 0;
	z-index: 11;
	display: block;
	text-align: center;
	font-size: 14px;
	color: #ffffff;
	width: 40px;
	height: 40px;
	line-height: 40px;
	cursor: pointer;
	background: rgba(0,0,0,0.25);
	-webkit-transition: all .1s ease-in-out;
	   -moz-transition: all .1s ease-in-out;
		-ms-transition: all .1s ease-in-out;
		 -o-transition: all .1s ease-in-out;
			transition: all .1s ease-in-out;
}

#menuToggle:hover {
	color: #ffffff;
	background: rgba(0,0,0,0.2);
	-webkit-transition: all .1s ease-in-out;
	   -moz-transition: all .1s ease-in-out;
		-ms-transition: all .1s ease-in-out;
		 -o-transition: all .1s ease-in-out;
			transition: all .1s ease-in-out;
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


<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			
			<br>
			<div class="row">
				<h1>SJSU Food Mart</h1>
				<br>
				<h3>CmpE 275 Project - Team 5</h3>
				<br>
				<h3>Take away food delivery system</h3>
				<br>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->
	
	

    <section id="about" name="about"></section>
	<div id="f">
		<div class="container">
			<div class="row">
				<h3>Add Menu Item</h3>
				<p class="centered"><i class="icon icon-circle"></i></p>
				
				<div class="col-lg-6 col-lg-offset-3">
					<form method="post" action="addItem" enctype="multipart/form-data">
        
          
         				<table>
					   	<tr>
					        <td><label>Item Name: </label></td>
					        <td><span><input type="text" name="name" placeholder="enter item name" required/></span></td>
					    </tr>
					    <tr>
					      <td> <label>Category:</label></td>
					         <td><span><select name="category" >
					                <option name="drink" value="drink">Drink</option>
					                <option name="appetizer" value="appetizer">Appetizer</option>
					                <option name="maincourse" value="maincourse">Main course</option>
					                <option name="desert" value="desert">Desert</option>
					          </select></span></td>
					       </tr>
					       <tr>
					        <td><label>Picture: &nbsp;</label></td>
					        <td><span><input type="file" id="fileUpload" name="fileUpload" size="500000" style="width:145px;" required/></span></td>
						</tr>
						<tr>
					       <td> <label>Unite Price: &nbsp;&nbsp;</label></td><td><span>
					        <input type="text" name="unitprice" placeholder="enter price for 1 item" required/></span></td>
					     </tr>
					     <tr>
					        <td><label>Calories: &nbsp;&nbsp;</label></td>
					        <td><span><input type="text" name="calories" placeholder="enter calories in item" required/></span></td>
					     </tr>
					     <tr>
					        <td><label>Preparation Time (in mins): &nbsp;&nbsp;</label>        </td>
					        <td><span style="width:190px;"><input type="text" name="preptime" placeholder="enter preparation time (in mins)" required/></span></td>
					    </tr>

					    </table>  
					        
					    
					   




					    <input type="submit" class=mybutton value="Add" style="margin-left:170px;" required>
					      
					      
					  </form>
				
				</div>								
			</div>
		</div> 
	</div>                
           
           
           <script src="assets/js/classie.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/smoothscroll.js"></script>
	<script src="assets/js/main.js"></script>         
 
</body>
</html>
