<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="img/logo-title.webp" type="image/x-icon">
	<meta charset="ISO-8859-1">
	<title>Order Placed</title>
	<style>
		body { box-sizing: border-box; 
			height: 11in; 
			margin: 0 auto; 
			overflow: hidden;
			padding: 0.5in; width: 8.5in;
		}
		body {
			background: #FFF;
			border-radius: 1px;
			box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
		}
		h1{ 
			font: bold 100% sans-serif; 
			letter-spacing: 0.5em;
			text-align: center;
			text-transform: uppercase;
		}
		h1 {
			background: #000; 
			border-radius: 0.25em; 
			color: #FFF; 
			margin: 0 0 1em; 
			padding: 0.5em 0; 
		}
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		td, th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {
			background-color: #dddddd;
		}
		table.balance th, table.balance td { width: 25%; }
		table.balance td { text-align: right; }   
	</style>
</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	if(session.getAttribute("name") == null) {
		request.setAttribute("login", true);
		request.setAttribute("message", "Please login first!");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	if(session.getAttribute("productOrdered") == null) {
		request.getRequestDispatcher("cartDAO").forward(request, response);
	}
%>
<c:if test="${isEmptyOrder == true}">
		${message}
	</c:if>
	
	<div align="center">
		<h1 style="margin-bottom:  50px;">Invoice</h1>
		
		<table >
			<tr>
				<th>Product-Name</th>
				<th>Rate</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
			<c:if test="${isEmptyOrder ==false}">
	<c:forEach items="${productOrdered}" var="product">
		<tr>
				<td>${product.product_name }</td>	 
				<td>${product.price }</td>
				<td>${product.quantity }</td>
				<td>${product.total }</td>
		</tr>
	</c:forEach>
	</c:if>	
		</table>
		<table class="balance" style="margin-top:50px;">
			<tr>
				<th>Total</th>
				<td>${message}</td>
			</tr>
			<tr>
				<th>Amount Paid</th>
				<td>${message}</td>
			</tr>
		</table>

		<h2 style="margin-top: 30px;">Order Placed</h2>

		<br>
		<a href="index.jsp" style="text-decoration: none;"><b>Back to shop</b></a>
	</div>
</body>
</html>