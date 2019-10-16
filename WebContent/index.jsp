<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/logo-title.webp" type="image/x-icon">
<title>Night Canteen</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
html {
	scroll-behavior: smooth;
}

p {
	color: white;
	font-family: courier;
}

.column:hover {
	-ms-transform: scale(1.1); /* IE 9 */
	-webkit-transform: scale(1.1); /* Safari 3-8 */
	transform: scale(1.1);
}

.headerimg {
	background: url(img/header.jpg);
	height: 450px;
	background-size: cover;
	background-repeat: no-repeat;
}

.footerimg {
	background: url(img/footer.jpg);
	height: 150px;
	background-size: cover;
	background-repeat: no-repeat;
}

.ulaa {
	text-align: left;
	width: 80%;
	position: relative;
	left: 10%;
}

* {
	box-sizing: border-box;
}

.column {
	text-shadow: 2px 2px 8px #FF0000;
	float: left;
	width: 25%;
	padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
	content: "";
	clear: both;
	display: table;
}

.row {
	padding-top: 100px;
	margin-left: 60px;
	padding-bottom: 100px;
}

.column>a>img {
	height: 200px;
	width: 200px;
	border-radius: 50%;
}

.column p {
	padding-left: 23%;
}

.myprofile:hover {
	-ms-transform: scale(1.1); /* IE 9 */
	-webkit-transform: scale(1.1); /* Safari 3-8 */
	transform: scale(1.1);
}
</style>
</head>
<body bgcolor='black'>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		System.out.println("aaa");
		if (session.getAttribute("name") == null) {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	%>
	<div class="headerimg">
		<div>
			<img src='img/logo.jpg'
				style="margin-left: 50px; width: 275px; height: 125px;">
		</div>
		<div style="position: relative;">
			<a href="profileDAO"><img class="myprofile"
				style="border-radius: 50%; width: 13%; height: 13%; margin-right: 10px;"
				align="right" src="img/user.jpeg"></a>
		</div>
	</div>
	<div class="row">
		<div class="column">
			<a href="itemsDAO"><img src="img/patties.jpg" alt="Items"></a>
			<a href="itemsDAO" style="text-decoration: none; font-size: 125%;"><p>ITEMS</p></a>
		</div>
		<div class="column">
			<a href="cartDAO"><img src="img/cart.jpg" alt="cart"></a> <a
				href="cartDAO" style="text-decoration: none; font-size: 125%;"><p>CART</p></a>
		</div>
		<div class="column">
			<a href="##"><img src="img/wallet.jpeg" alt="wallet"></a> <a
				href="##.html" style="text-decoration: none; font-size: 125%;"><p>WALLET</p></a>
		</div>
		<div class="column">
			<a href="order_history"><img src="img/order-history.jpg"
				alt="order-history"></a> <a href="order_history"
				style="text-decoration: none; font-size: 125%;"><p>ORDER-HISTORY</p></a>
		</div>
	</div>
	<div style="padding-bottom: 100px;">
		<p
			style="text-shadow: 2px 2px 8px #FF0000; color: yellow; font-family: courier; font-size: 155%; text-align: center;">IN
			A HURRY? PICK UP A BITE FROM OUR GRAB & GO COUNTER, OPEN WEEKDAYS
			FROM 8AM!</p>
	</div>

	<footer class="footerimg"
		style="position: relative; height: 200px; padding: 0px; left: 0px; right: 0px; text-align: center; bottom: 0px;">
		<ul class="ulaa" style="list-style-type: none; padding-top: 20px;">
			<li style="float: left;">
				<p>
					<a
						style="color: black; font-family: courier; font-size: 125%; text-decoration: none;"
						href="##"><b> CONTACT US</b></a><br>
				</p>
			</li>
			<li style="float: left; padding-left: 80px;">
				<p ><a style="color: black;font-family:courier;font-size:125%;text-decoration: none;"href="##"><b>CONNECT WITH US</b></a><br><i style="color: #FF1414;"><a href="https://www.facebook.com/McDonalds/">Facebook</a>
<br><a href="https://twitter.com/McDonalds">Twitter</a><br><a href="https://www.instagram.com/mcdonalds">Instagram</a></i></p>	
			</li>
			<li style="float: left; padding-left: 80px;">
				<p>
					<a
						style="color: black; font-family: courier; font-size: 125%; text-decoration: none;"
						href="mailto:pk1999pankaj@gmail.com"><b>FEEDBACK</b></a>
				</p>
			</li>
			<li style="float: left; padding-left: 80px;">
				<p>
					<a
						style="color: black; font-family: courier; font-size: 125%; text-decoration: none;"
						href="faq.html"><b>LET US HELP YOU</b></a>
				</p>
			</li>
		</ul>
	</footer>
</body>
</html>