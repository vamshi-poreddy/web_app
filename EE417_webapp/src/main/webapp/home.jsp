<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--Linking the CSS document with this html file using below tag-->
<link rel="stylesheet" type="text/css" href="stylesheets\stylesheet1.css">
<script src="javascript\menu.js"></script>
<script src="javascript\domfinal.js"></script>
<script src="javascript/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--Code to change the H1 after the sale banner-->
<script>
        $(document).ready(function() {
 
            // Access with tag
            $("h1").css("color", "#cc0099");
            $("button").click(function() {
 
                // d1 gets replaced with d4.
                $("#d1")[0].outerHTML =
                "<h2 id='d4'>What You waiting for browse for Your Favorite Books</h2>";
                $("#d4").css("color", "#004080");
            });
        });
</script>
<style>
  #d4{
    font-family: Arial, Helvetica, sans-serif;
  }
</style>

</head>
<title > Books & Posters</title>
<body>


<!--Header of the website which contains the site name and account, cart and contact us links-->
<div class="header">
  <ul> <a href="<%=request.getAttribute("link")%>"><b><%=request.getAttribute("text")%></b></a></ul>
  <ul><a href="LogoutServlet" method="get" ><b>Logout</b></a></ul>
  <ul><a href="ProfileServlet?uname=<%=request.getAttribute("name")%>" target="_blank"><b><%=request.getAttribute("name")%></b></a></ul>
  <h1>BOOKS & POSTERS</h1>
</div>

<br>
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
  <a href="#" style= "color:#cc0099">Home</a><button class="openbtn" onclick="openNav2()" style="float:right;color:black;background-color:white;font-size:20px;">></button>
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
  <a href="magzines.html">Magazines</a>
  <a href="comics.html">Comics</a>
  <a href="posters.html">Posters</a>
  <a href="LogoutServlet"><b>Logout</b></a>
  <a href="<%=request.getAttribute("setpage")%>"><b><%=request.getAttribute("set")%></b></a>
</div>
<center style="font-family: Arial;"><b>Logged in as <%=request.getAttribute("name")%>!</b></center>
<div class="content">
<!--Sale banner after the header bar with defined width and height-->
<img src="Images\sale_banner.jpeg" alt="sale banner" width=100% height="300"><br>

<!--Heding in the Center which changes on the click-->
<center>
  <div>
      <h1 id="d1" style="font-family: Arial;font-style: italic;">Hello! Welcome to Biggest Collection of Books</h1>
      <button style="background-color: #404040; color: white;">Books&Posters</button>
      <br>
  </div>
</center>
<br>
<!--Best selling books block-->
<div class="bestsellers">
<span class="bs"><p>Best Selling Books of 2021</p></span>
</div>

<!--Creating one row with five columns which has five pictures-->
<div class="row">
  <div class="column" style="padding-left:150px;">
  
    <!--class for displaying the images as polaroid tile when hovered on them-->
    <div class="polaroid">
    <!--adding the image and alternate name with inline style-->
    <img src="Images\book3.jpg" alt="The Girl On The Train" style="width:100%; height:200px">
    <div class="container">
    <p>The Girl On The Train</p>
    </div>
    </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\book4.jpg" alt="The Silent Patient" style="width:100%; height:200px">
    <div class="container">
    <p>The Silent Patient</p>
    </div>
    </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\book6.jpg" alt="The Hobbit" style="width:100%; height:200px">
    <div class="container">
    <p>The Hobbit</p>
    </div>
    </div>
  </div>
  <div class="column">
  <div class="polaroid">
  <img src="Images\book7.jpg" alt="Waiting for the Night Song" style="width:100%; height:200px">
  <div class="container">
  <p>Waiting for the Night Song</p>
  </div>
  </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\book1.jpg" alt="Fit Mind" style="width:100%; height:200px">
    <div class="container">
    <p>Fit Mind</p>
    </div>
    </div>
   </div>
</div>

<!--Class with a picture and tooltip-->
<div class="banner">
<a href="#">
<img src="Images\book5.jpg" alt="Best Sellers" width=100% height="300">
<span>Best Sellers of NewYork Times</span></a>
</div>


<div class="bestsellers">
<span class="bs"><p style="width:35%">Popular Magzines in Circulation</p></span>
</div>

<div class="row">
  <div class="column" style="padding-left:150px;">
    <div class="polaroid">
    <img src="Images\sn1.jpg" alt="Science News" style="width:100%; height:200px">
    <div class="container">
    <p>Science News</p>
    </div>
    </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\f1.jpg" alt="Nat Geo" style="width:100%; height:200px">
    <div class="container">
    <p>Nat Geo</p>
    </div>
    </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\sn2.jpg" alt="Science News" style="width:100%; height:200px">
    <div class="container">
    <p>Science News</p>
    </div>
    </div>
  </div>
  <div class="column">
  <div class="polaroid">
  <img src="Images\f2.jpg" alt="Eating Well" style="width:100%; height:200px">
  <div class="container">
  <p>Eating Well</p>
  </div>
  </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\vogue1.jpg" alt="Vogue" style="width:100%; height:200px">
    <div class="container">
    <p>Vogue</p>
    </div>
    </div>
   </div>
</div>


<!--Adding a background Image to this comic section-->
<div style="background-image:url(Images/back.jpg)">
<div class="bestsellers" style="opacity:0.8">
<span class="bs"><p style="color:white">Top Comics of 2021</p></span>
</div>

<div class="row">
  <div class="column" style="padding-left:150px;">
    <div class="polaroid">
    <img src="Images\comic1.jpg" alt="Beta Ray Bill" style="width:100%; height:200px">
    <div class="container">
    <p>Beta Ray Bill</p>
    </div>
    </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\comic2.jpg" alt="Marvel X-Men" style="width:100%; height:200px">
    <div class="container">
    <p>Marvel X-Men</p>
    </div>
    </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\comic3.jpg" alt="DC Night Wing" style="width:100%; height:200px">
    <div class="container">
    <p>DC Night Wing</p>
    </div>
    </div>
  </div>
  <div class="column">
  <div class="polaroid">
  <img src="Images\comic4.jpg" alt="DC Batman" style="width:100%; height:200px">
  <div class="container">
  <p>DC Batman</p>
  </div>
  </div>
  </div>
  <div class="column">
    <div class="polaroid">
    <img src="Images\comic5.jpg" alt="Star Wars" style="width:100%; height:200px">
    <div class="container">
    <p>Star Wars</p>
    </div>
    </div>
   </div>
</div></div><br>

<!-- Below is the Dom tree display button -->
<button id="FINAL" class="button">Display DOM</button>
<!-- The DOM Tree DIV Element-->
<div id="dom" style="display: none;">
<ul>
    <li id="domch">
    <!-- <span id="disp" style="cursor: pointer; display:hidden;"> &plus; </span> BODY-->
    <ul>
    
    </ul>
    </li>
</ul>
</div>


<!--Information class which has the information about the store divided into three columns-->
<div class="inf">
        <div class="inf1">
            <ul>
                <p>
                    <label>Delivery</label>
                </p>
                <p>Delivery within Ireland</p>
                <p>2-3 Working Days</p>
                <p>Free delivery on orders over €20</p>
            </ul>
        </div>
        <div class="inf2">
            <ul>
                <p>
                    <label>Returns</label>
                </p>
                <p>Return your order within</p>
                <p>14 days for full refund, or</p>
                <p>within 28 days for store credit</p>
            </ul>
        </div>

        <div class="inf3">
            <ul>
                <p>
                    <label>Books&Posters Card</label>
                </p>
                <p>Earn 10 points with every €1 spent</p>
                <p>Card will be added to your account</p>
            </ul>
        </div>
</div><br><br>


<!--footer section which has the policies, account, social, and contact us details in unordered lists with lists items divided into 4 columns-->
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

<!--Footer section which has the copyright of the store-->
<div class="footer">
<p> &copy; Books & Posters 2022 unless otherwise stated</p>
</div>
</div>
</body>
<!--javascript to make the navigation bar sticky-->
<script>
  window.onscroll = function() {myFunction()};
  var navbar = document.getElementById("navbar");
  var sticky = navbar.offsetTop;
  function myFunction() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }</script>
</html>