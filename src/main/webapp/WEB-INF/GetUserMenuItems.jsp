<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>CMPE275_TermProject_Group5:Place Order</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<style type="text/css">
html { height: 100%; font-size: 62.5% }

body {
height: 100%;
background-color: #696969;
text-align: center;
font: 1.2em Verdana, Arial, Helvetica, sans-serif;
}

a:link, a:visited {
color: #004F8B;
text-decoration: underline;
font-weight: bolder;
}

a:hover {
text-decoration: none;
}
.noscreen {
display: none;
}


/* Cleaner */

.cleaner {
clear: both;
height: 0;
font-size: 0;
visibility: hidden;
}


/* Skip menu */

.hidden {
position: absolute;
top: -10000px;
left: 0;
width: 1px;
height: 1px;
overflow: hidden;
}


/* Images */



/* Wrapper */

#wrapper {
width: 850px;
margin: 60px auto 0 auto;
padding-bottom: 90px;
text-align: left;
}


/* Headings, paragraphs */
/*title box*/
.title {
background-color: #282828;
letter-spacing: 1px;
width: 39em;
}



.title p {
color: #FFFFFF;
margin: 4px 0 0 21px;
padding-bottom: 12px;
}

h1 {
font: normal 2.4em Georgia, "Times New Roman", Times, serif;
color: #FFFFFF;
padding-top: 25px;
margin-left: 20px;
}

h1 a:link, h1 a:visited {
color: #FFFFFF;
text-decoration: none;
font-weight: normal;
}

h1 span {
color: #FFB849;
}

h2 {
font: normal 1.5em Georgia, "Times New Roman", Times, serif;
color: #004F8B;
letter-spacing: 1px;
padding-left: 25px;
margin-bottom: 7px;
}


/* Menu */

ul.menu {
list-style-type: none;
}

ul.menu li {
padding: 18px 0;
}

ul.menu li a, ul.menu li a:visited {
color: #FFFFFF;
font-weight: normal;
text-decoration: none;
padding: 4px 7px;
}

ul.menu li a:hover, ul.menu li a.active {
background-color: #002F53;
}

ul.menu li.last {
background: none;
}


/* Content box */

.content {
width: 850px;
margin: 19px auto 0 auto;
}

.column-left {
float: left;
width: 170px;
text-align: center;
color: #FFFFFF;
}

.column-left h3 {
font: normal 1.5em Georgia, "Times New Roman", Times, serif;
margin: 10px 0 7px 0;
letter-spacing: 1px;
}

.column-right {
margin: 0 0 0 191px;
width: 900px;
}

.box-top {
height: 15px;
}

.box {
}

.box-in {
background-color: #FFFFFF;
padding: 0.8em 0 5em 0;
margin: 0 6em 0 2em;
}

.box-in p {
line-height: 1.6;
margin: 0 0 10px 25px;
color: #242424;
}

.box-bottom {
height: 48px;
}

ul.main-list {
list-style-type: none;
margin: 14px 0 20px 25px;
}

ul.main-list li {
line-height: 1.3;
margin-bottom: 12px;
color: #004F8B;

padding-left: 27px;
}


/* Footer */

.footer-info-left, .footer-info-right {
font-size: 0.8em;
color: #626262;
position: relative;
top: -7px;
display: inline;
}

.footer-info-left {
float: left;
margin-left: 17px;
}

.footer-info-right {
float: right;
margin-right: 40px;
}

.footer-info-left a, .footer-info-left a:visited, .footer-info-right a, .footer-info-right a:visited {
font-weight: normal;
color: #626262;
}



#body {
font-family: "Times New Roman", Times, serif;
line-height: 1.3;
}

#h1, h2, h3, h4, h5, h6 {
font-family: Verdana, Arial, Helvetica, sans-serif;
color: #595959;
}

#h1 {
font-size: 16pt;
}

#h2 {
font-size: 14pt;
}

#h3, #h4, #h5, #h6 {
font-size: 11pt;
}

#h3 {
margin-top: 30px;
}

#a:link, #a:visited {
text-decoration: underline;
font-weight: bolder;
}

#a img {
border: 1px solid #595959;
}

#hidden {
position: absolute;
top: -10000px;
left: 0;
width: 1px;
height: 1px;
overflow: hidden;
}

#menu, .column-left h3, .footer-info-right {
display: none;
}


#quest { left:53%; top:30%;    position:absolute;}
#option1 { height:200px; left:55%; top:50%;   position:absolute; }
#option2 { height:200px; left:75%; top:50%;   position:absolute; }
#option3 { height:200px; left:55%; top:60%;   position:absolute; }
#option4 { height:200px; left:75%; top:58%;   position:absolute; }

#btn1 { left:55%; top:65%;   font-size: 10px; position:absolute; 
         &nbsp;&nbsp;&nbsp; background-color:white;<br>
      &nbsp;&nbsp;&nbsp; color:black;<br>
      &nbsp;&nbsp;&nbsp; text-align:center;<br>
      &nbsp;&nbsp;&nbsp; padding:5px;<br>}


#btn2 { left:75%; top:65%;   position:absolute; 
        &nbsp;&nbsp;&nbsp; background-color:white;<br>
      &nbsp;&nbsp;&nbsp; color:black;<br>
      &nbsp;&nbsp;&nbsp; text-align:center;<br>
      &nbsp;&nbsp;&nbsp; padding:5px;<br>
      height: 100px}  

#td.upper_line { border-top:solid 1px black; }
    #table.fraction { text-align: center; vertical-align: middle;
        margin-top:0.5em; margin-bottom:0.5em; line-height: 2em; }

</style>


<div id="wrapper">
  <div class="title">
    <div class="title-top">
      <div class="title-left">
        <div class="title-right">
          <div class="title-bottom">
            <div class="title-top-left">
              <div class="title-bottom-left">
                <div class="title-top-right">
                  <div class="title-bottom-right">
                    <h1>Admin<span> Add New Item</span> page</h1>
                    <p>Cmpe275 Term Project 5</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <hr class="noscreen" />
  <div class="content">
    <div class="column-left">
      <h3>MENU</h3>
      <a href="#skip-menu" class="hidden">Skip menu</a>
      <ul class="menu">
        <li><a class="active">Home</a></li>
        <li>order</li>
        <li class="last">Checkout</li>
      </ul>
    </div>
    <div id="skip-menu"></div>
    <div class="column-right">
      <div class="box">
        <div class="box-top"></div>
        <div class="box-in">
      
      
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
  
  <form action="Checkout" method="post">
    <input type="hidden" id="itemData" name="itemData">
    <input type="submit" id="next" value="Proceed to checkout"/>
  </form>
   


      <div class="box-bottom">
        <hr class="noscreen" />
        
    </div>
    <div class="cleaner">&nbsp;</div>
  </div>
</div>
</body>
</html>
