<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp" import="java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>Night Canteen-Items</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
  html,body {
    	height: 100%;
	}
    p{
      color: white;
    }
    .footerimg{
      /*background: url(/home/pradeep/Documents/miniproject/img/foote./a.outr.png);*/
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
    }
    .sidebar {
     /*  margin: 20px; */
      padding: 20px;
      width: 15%;
      background-color: #f1f1f1;
      position: absolute;
      height: 100%;
      overflow: auto;
      
    }

    .sidebar a {
      display: block;
      color: black;
      padding: 25px;
      text-decoration: none;
    }

    .sidebar a.active {
      background-color: #893DFF;
      color: white;
    }

    .sidebar a:hover:not(.active) {
      background-color: #555;
      color: white;
    }

    .content {
      margin-left: 200px;
      padding: 1px 16px;
      height: 1000px;
    }
	.column {
		float: left;
		width: 50%;
		padding: 5px;
	}
    @media screen and (max-width: 700px) {
      .sidebar {
        width: 100%;
        height: 100%;
        position: relative;
      }
      .sidebar a {float: left;}
      /*div.content {margin-left: 0;}*/
    }
    .row {
    	display: grid;
  		grid-template-columns:auto auto auto;
  		padding: 10px;
    	position: relative;
		padding-top:50px;
		margin-left: 20%;
		padding-bottom: 10px;	
	}
	.column >img {
		height: 200px;
		width:200px;
		border-radius: 50%;
	}
    @media screen and (max-width: 400px) {
      .sidebar a {
        text-align: center;
        float: none;
      }
    }
  </style>
</head>
<body bgcolor="black">
  <div class="topnav">
    <a href="index.html">Home</a>
    <a class="active" href="itemsDAO">Items</a>
    <a href="#cart">Cart</a>
    <a href="#wallet">Wallet</a>
    <a href="#order-history">Order-History</a>

    <a class="myprofile" href="#My-profile">My Profile</a>
  </div>
  <div class="sidebar" style="margin-top: 15px;">
    <a class="active" href="#home">Home</a>
    <a href="#news">News</a>
    <a href="#contact">Contact</a>
    <a href="#about">About</a>
  </div>
  <div class="row">
	<c:forEach items="${productList}" var="product">
	<div class ="column" style="font-size:125%;">
		<p><img src="data:image/*;base64,${product.product_image}" width="100" height="100"/><br><br>${product.product_id} <br> ${product.product_name}  <br>M.R.P. : Rs.${product.price}</p>
	</div>
	</c:forEach>
  </div>
  <footer class="footerimg" style=" position: relative; height: 150px; padding: 0px; left: 0px; right: 0px; text-align: center; bottom: 0px;">
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
