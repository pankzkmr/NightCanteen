<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  
  <title>Night Canteen-MY-Profile</title>
    <link rel = "icon" href =  
"img/logo-title.webp" 
        type = "image/x-icon"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    p{
      color: white;
    }
    .footerimg{
      /*background: url(/home/pradeep/Documents/miniproject/img/footer.png);*/
      background-color: #DAF7A6;
      height: 150px;
      background-size: cover;
      background-repeat: no-repeat;
    }
    .ulaa{
      text-align: left;
      width: 80%;
      position:relative;
      left: 10%;
    }
    .topnav {
      overflow: hidden;
      background-color: #333;
      position: relative;
    }

    .topnav a {
      float: left;
      color: #f2f2f2;
      text-align: center;
      padding: 14px 30px;
      text-decoration: none;
      font-size: 17px;
      font-family:courier;
    }

    .topnav a:hover {
      background-color: #ddd;
      color: black;
    }

    .topnav a.active {
      background-color: #4CAF50;
      color: white;
    }
    .topnav .myprofile {
      float: right;
      background-color: #4CAF50;
    }
    img{
      height:15%;
      width: 15%;
      border-radius: 50%; 
    }
    .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: red;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}
  </style>
</head>


<body bgcolor='black'>
  <div class="topnav">
    <a href="index.jsp">Home</a>
    <a href="items.jsp">Items</a>
    <a href="cart.jsp">Cart</a>
    <a href="#wallet">Wallet</a>
    <a href="order-history.html">Order-History</a>

    <a class="myprofile" href="my-profile.html">My Profile</a>
  </div>

  <h2 style="margin-top: 50px; text-shadow: 2px 2px 8px #FF0000;color: yellow;font-family:courier;text-align:center;">My Profile </h2>

<div class="card" style="margin-bottom: 50px;">
  <div class="container">
  <img src="/home/pradeep/Documents/miniproject/img/user.jpeg" alt="John" style="width:100%">
  <div class="middle"><div ><button>Change Photo</button></div></div>
  </div>
  <h1 style="color: white;">${name}</h1>
  <p class="title">${rer_no}</p>
  <p>${branch }</p>
  <p>${room_no}</p>
  <p>${phone_no}</p>
  <p><button>Edit</button></p>
  <a href="" style="color: blue;">Change Password?</a>
</div>
  

    <footer class="footerimg" style=" position: relative; height: 200px; padding: 0px; left: 0px; right: 0px; text-align: center; bottom: 0px;">
      <ul class="ulaa" style="list-style-type: none;padding-top: 20px;">
        <li style="float:left;">
          <p ><a style="color: black;font-family:courier;font-size:125%;text-decoration: none;"href="##"><b> CONTACT US</b></a><br></p>
        </li>
        <li style="float:left;padding-left: 80px;">
          <p ><a style="color: black;font-family:courier;font-size:125%;text-decoration: none;"href="##"><b>CONNECT WITH US</b></a><br><i style="color: #FF1414;">Facebook<br>Twitter<br>Instagram</i></p>
        </li>
        <li style="float:left;padding-left: 80px;">
          <p ><a style="color: black;font-family:courier;font-size:125%;text-decoration: none;" href="mailto:pk1999pankaj@gmail.com"><b>FEEDBACK</b></a></p>
        </li>
        <li style="float:left;padding-left: 80px;">
          <p ><a style="color: black;font-family:courier;font-size:125%;text-decoration: none;"href="##"><b>LET US HELP YOU</b></a><br><i style="color: #FF1414;">Help<br>FAQ's</i></p>
        </li>
      </ul>
    </footer>
  </body>
  </html>