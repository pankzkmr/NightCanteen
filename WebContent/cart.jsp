<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Night Canteen-Cart</title>
<link rel="icon" href="img/logo-title.webp" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
p {
	color: white;
}

.footerimg {
	/*background: url(img/footer.png);*/
	background-color: #DAF7A6;
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
	font-family: courier;
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

.add-b {
	
}

.add-button {
	border: 0;
	padding: 15px 10px;
	background-color: green;
	color: #fff;
	font-family: $ font-bold;
	font-size: 12px;
	border-radius: 3px;
}

img:hover {
	-ms-transform: scale(1.1); /* IE 9 */
	-webkit-transform: scale(1.1); /* Safari 3-8 */
	transform: scale(1.1);
}

.add-button:hover {
	background-color: #a44;
}

.place-order-button {
	border: 0;
	padding: 25px 40px;
	background-color: orange;
	color: #fff;
	font-family: $ font-bold;
	font-size: 20px;
	border-radius: 3px;
}

.place-order-button:hover {
	background-color: #a44;
}

th {
	padding-top: 50px;
	color: white;
	text-align: center;
	font-size: 127%;
}

td {
	color: white;
	text-align: center;
	padding-top: 20px;
	font-size: 120%;
}

table {
	width: 100%;
}

.product-quantity {
	
}

input {
	width: 40px;
}

.remove-product {
	border: 0;
	padding: 7px 15px;
	background-color: #c66;
	color: #fff;
	font-family: $ font-bold;
	font-size: 12px;
	border-radius: 3px;
}

.remove-product:hover {
	background-color: #a44;
}
</style>
</head>


<body bgcolor='black' style="color:white">
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	if(session.getAttribute("name") == null) {
		request.setAttribute("login", true);
		request.setAttribute("message", "Please login first!");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	if(session.getAttribute("productList2") == null) {
		out.println("Nothing is in cart");
	}
%>
	<div class="topnav">
		<a href="index.jsp">Home</a> <a href="items.html">Items</a> <a
			class="active" href="cart.html">Cart</a> <a href="#wallet">Wallet</a>
		<a href="order-history.html">Order-History</a> <a class="myprofile"
			href="my-profile.html">My Profile</a>
	</div>


	<div>
		<table>
			<tr>
				<th
					style="text-shadow: 2px 2px 8px #FF0000; color: yellow; font-family: courier;">Product</th>
				<th
					style="text-shadow: 2px 2px 8px #FF0000; color: yellow; font-family: courier;">Product
					Name</th>
				<th
					style="text-shadow: 2px 2px 8px #FF0000; color: yellow; font-family: courier;">Price</th>
				<th
					style="text-shadow: 2px 2px 8px #FF0000; color: yellow; font-family: courier;">Quantity</th>
				<th>Remove</th>
			</tr>
			<form action="finalDAO" method="post">
			<c:forEach items="${productList2}" var="product">
			<tr>
				<td><img src="data:image/*;base64,${product.product_image}"
						height="100" width="100" style="border-radius: 50%;"></td>
				<td>${product.product_name}</td>
				<td>Rs.${product.price}</td>
				<td class="product-quantity"><input type="number" value="2"
					min="1">
				<td>
				<td><input type="checkbox" class="add-button"
					name="${product.product_id}" value="REMOVE"></td>
			</tr>
			</c:forEach>

		</table>
	</div>
	<div style="position: relative; margin-left: 44%;">
		<button class="place-order-button">
			<b>Place Order</b>
		</button>
		</form>
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
				<p>
					<a
						style="color: black; font-family: courier; font-size: 125%; text-decoration: none;"
						href="##"><b>CONNECT WITH US</b></a><br>
					<i style="color: #FF1414;">Facebook<br>Twitter<br>Instagram
					</i>
				</p>
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
						href="##"><b>LET US HELP YOU</b></a><br>
					<i style="color: #FF1414;">Help<br>FAQ's
					</i>
				</p>
			</li>
		</ul>
	</footer>
</body>
</html>