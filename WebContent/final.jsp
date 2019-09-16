<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<c:if test="${isEmptyOrder ==false}">
	<c:forEach items="${productOrdered}" var="product">
		<br>${product.product_name } : 
		<b>${product.price }</b> * <b>${product.quantity }</b><br>
	</c:forEach>
	${message}<br>
	Order Placed :)
	</c:if>
	
</body>
</html>