<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="stylesheets\stylesheet1.css">
<link rel="stylesheet" type="text/css" href="stylesheets\stylesheet2.css">
</head>
<title > Books & Posters</title>
<body>

<div class="header">
  <ul> <a href="cart.html"><b>Cart</b></a></ul>
  <ul><a href="#" style="color:black"><b>Account</b></a></ul>
  <ul><a href="contact.html" target="blank"><b>Contact Us</b></a></ul>
  <h1>BOOKS & POSTERS</h1>
</div>

<!--Creation of Navigation bar with unordered list and list elements-->
<div class="topnav" id="navbar"><b>
<ul>
  <li><button class="openbtn" onclick="openNav()">BnP Menu</button></li>
  <li><input type="text" placeholder="Search.."></li>
  </ul></b>
</div>

<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
  <a href="index.html" >Home</a>
  <span class="dropdown">
<!--Creation of Dropdown button with drop down elements as links-->
  <a href="books.html" class="dropbtn">Books</a>
  <div class="dropdown-content">
  <a href="#">Classics</a>
  <a href="#">Biographies</a>
  <a href="#">Fiction</a>
  </div></span>
  <a href="magzines.html">Magzines</a>
  <a href="comics.html">Comics</a>
  <a href="posters.html">Posters</a>
  <a href="#" style= "color:#cc0099"><b>Account</b></a>
  <a href="contact.html" target="blank"><b>Contact Us</b></a>
</div>

<div class="login" style="background-image:url(Images/back1.jpeg);background-size: cover;" ><br><br>

<p><%=request.getAttribute("name")%></p>

<div class="form">
<form method="post" action="LoginServlet">
    <label for="email">Username or Email</label>
    <input type="text" id="email" name="Email" placeholder="Enter Your Username.." />
    <label for="email">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter Your Password.." />
    <input type="submit" value="Login" />
</form>
<span class="inst"><a>Forgot Password?</a>
<a style="padding-left:250px;">Need help?</a></span>
</div><br><br>
<div class="new">
<div style="padding-left:100px"><botton class="button" onclick="window.location.href='register.html';">Click Here to Register</button></div>
<p><b>Not a member?</b> Register with us to become a part of one of the top online book stores currently.</p>
</div>
<br><br>
</div>


<div class="last">
        <div class="last1">
            <ul>
                <li>
                    <label><a href="#">My Account</a></label>
                </li>
                <li>Orders</li>
                <li>Track Order </li>
                <li>Frequently Asked Questions </li>
            </ul>
        </div>
        <div class="last2">
            <ul>
                <li>
                    <label>Policies</label>
                </li>
                <li>Offer Terms & Conditions</li>
                <li>Returns & Exchange Policy</li>
                <li>Privacy Policy</li>
            </ul>
        </div>

        <div class="last3">
            <ul>
                <li>
                    <label><a href="contact.html" target="_blank">Contact Us</a></label>
                </li><br>
                <li>
                    <label> About Us</label>
                </li>
                <li>Official Brand Store</li>
                <li>Careers</li>
            </ul>
        </div>
        <div class="last4">
            <ul>
                <li>
                    <label>Social</label>
                </li>
                <li>Facebook </li>
                <li>Twitter</li>
                <li>YouTube </li>
            </ul>
        </div>
</div>

<div class="footer">
<p> &copy; Books & Posters 2022 unless otherwise stated</p>
</div>

<script src="javascript\menu.js"></script>
</body>
</html>