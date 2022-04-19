<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Data</title>
   <link rel="stylesheet" type="text/css" href="stylesheets\stylesheet1.css">
   <script src="javascript\menu.js"></script>
</head>
<body>

<div class="header">
  <ul> <a href="cart"><b>Cart</b></a></ul>
  <ul> <a href="contact.html" target="blank"><b>Contact Us</b></a></ul>
  <ul> <a href="#" style= "color:black"><b>Customer Data</b></a></ul>
  <h1>BOOKS & POSTERS</h1>
</div>

<!--Creation of Navigation bar with unordered list and list elements-->
<div class="topnav" id="navbar"><b>
  <ul>
    <li><button class="openbtn" onclick="openNav()">BnP Menu</button></li>
    <li><input type="text" placeholder="Search.."></li>
    </ul></b>
  </div>

<!--Dynamic Menu bar creation-->
<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
  <a href="index.html">Home</a><button class="openbtn" onclick="openNav2()" style="float:right;color:black;background-color:white;font-size:20px;">></button>
  <span class="dropdown">
<!--Creation of Dropdown button with drop down elements as links-->
  <a href="books.html" class="dropbtn">Books</a>
  <div class="sidebar" id="mySidebar2">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav2()"><</a>
  <a style= "color:#cc0099">Books</a>
  <a href="#">Classics</a>
  <a href="#">Biographies</a>
  <a href="#">Fiction</a>
  </div></span>
  <a href="magzines.html">Magzines</a>
  <a href="comics.html">Comics</a>
  <a href="posters.html">Posters</a>
  <a href="account.html"><b>Account</b></a>
  <a href="#" style= "color:#cc0099"><b>Customer Data</b></a>
</div><br>

<!-- Assigning the datasource by providing the link for database with username and password -->
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://database-1.cdh305awjour.eu-west-1.rds.amazonaws.com:3306/mydatabase"
  		  user = "admin"  password = "ee417web"/>
 
 <!-- Writing an SQL query for selecting columns from the table from mydatabase.customers -->
      <sql:query dataSource = "${snapshot}" var = "result">
SELECT lastname, firstname, email, address, phone, gender, card FROM mydatabase.customers      </sql:query>


<!-- creating a new html table with column names and looping through each column in the database table for values in these columns  -->
<div class="info">
<p><b>Data of the Existing Customers</b></p>
</div>
<center>
      <table class="tab">
         <tr>
            <th>First Name</th>
            <th>Lastname</th>
            <th>Email</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>BnP Card</th>
         </tr>
        <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.firstname}"/></td>
               <td><c:out value = "${row.lastname}"/></td>
               <td><c:out value = "${row.email}"/></td>
               <td><c:out value = "${row.address}"/></td>
               <td><c:out value = "${row.phone}"/></td>
               <td><c:out value = "${row.gender}"/></td>
               <td><c:out value = "${row.card}"/></td>
            </tr>
         </c:forEach>
      </table></center>
<div style="padding:10px"></div>

<div class="last">
        <div class="last1">
            <ul>
                <li>
                    <label><a href="account.html">My Account</a></label>
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
                    <label><a href="#">Contact Us</a></label>
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
</div>

<script src="javascript\menu.js"></script>
<script>window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}</script>

</body>
<style>
.tab{
  width: 10in;
  border-collapse: collapse;
  border-radius: 50px;
  margin: auto;
  border: 1px solid;
  }
  
  .tab td, .tab tr{
  border: 1px solid black;
  padding: 10px 10px;
  border-radius: 5px;
  }
  
  .tab th{
  background-color: #b30086;
  color: white;
  padding: 5px; 
  border: 1px solid black;
  border-radius: 5px;
  }
  
  .tab tr:nth-child(even) {
    background-color: #f2f2f2;
  }
  
  .tab tr:hover{
  background-color: #ddd;
  }
  
  .info{
  text-align:center;
  color:#cc0099;
  font-family: Arial;
  font-size: 20px;
  padding: 20px;
}
 
 </style>



</html>