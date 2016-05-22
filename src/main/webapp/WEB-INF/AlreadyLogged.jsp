<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Status</title>
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
  background-image:url('resources/images/userhome.jpg');
 background-repeat: no-repeat;
    background-size: 100%;
    opacity: 0.9;
    filter:alpha(opacity=40);
    height:100%;
    width:100%;
 }

body {
  background-size: 100%;
    background-repeat:repeat-y;
	color: #000000;
	font-family: Papyrus, fantasy;
	font-weight: bold;

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

<p>You have already logged in!</p>
<input type="button" class=mybutton id="home" value="Home" onclick="location.href = 'home';">
</body>
</html>