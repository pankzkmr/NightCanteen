<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Order-History</title>
    <link rel = "icon" href =  
"/home/pradeep/Documents/miniproject/img/logo-title.webp" 
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
    }

    th{
      padding-top: 50px;  
      color: white;
      text-align: center;
      font-size: 127%;
    }
    td{
      color: white;
      text-align: center;
      padding-top: 20px;
      font-size: 120%;
    }
    table{
      width: 100%;
    }
    
    
  </style>
</head>


<body bgcolor='black'>
  <div class="topnav">
    <a href="index.jsp">Home</a>
    <a  href="itemsDAO">Items</a>
    <a  href="cartDAO">Cart</a>
    <a href="#wallet">Wallet</a>
    <a class="active" href="order_history.jsp">Order-History</a>

    <a class="myprofile" href="profileDAO">My Profile</a>
  </div>


  <div>
    <table>
      <tr>
        <th style=" text-shadow: 2px 2px 8px #FF0000;color: yellow;font-family:courier;">Date</th>
        <th style=" text-shadow: 2px 2px 8px #FF0000;color: yellow;font-family:courier;">Time</th>
        <th style=" text-shadow: 2px 2px 8px #FF0000;color: yellow;font-family:courier;">Order-ID</th>
        <th style=" text-shadow: 2px 2px 8px #FF0000;color: yellow;font-family:courier;">Total Amount</th>
        
      </tr>
      <c:forEach items="${orderhistory}" var="order">
      <tr>
        <td>${order.date }</td>
        <td>${order.time }</td>
        <td>${order.order_id }</td>
        <td>Rs.${order.total }</td>
      </tr>
		</c:forEach>
      </table>
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