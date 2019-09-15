<%@ page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<style type="text/css">
	input[type=text], input[type=password] {
	  	width: 100%;
	  	padding: 12px 20px;
	  	margin: 8px 0;
	  	display: inline-block;
	  	border: 1px solid #ccc;
	  	box-sizing: border-box;
	}
	body {
		text-align: center;
		background-color: black;
		font-family: courier;
		color: white;
	}
	.error {
		text-align: center;
		position: relative;
		color: red;
	}
	form {
		display: inline-block;
		border: 3px solid #f1f1f1;
		width: 40%
	}
	h1 {
		text-shadow: 2px 2px 8px #FF0000;
		font-size: 400%;
		color: #FFC300 ;
	}
	.imgcontainer {
  		text-align: center;
 		margin: 24px 0 30px 0;
	}
	img.avatar {
		width: 20%;
		border-radius: 50%;
	}
	.psw {
  		float: right;
  		padding-top: 16px;
	}
	button:hover {
  		opacity: 0.8;
	}
	button {
		align: center;
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 18px 0;
		border: none;
		cursor: pointer;
		width: 50%;
	}
	.reg {
		padding: 10px 10px;
	}
</style>
</head>
<body>
	<h1 style="">WELCOME!</h1>
	<div class="error">
	<c:if test="${login = true}">
		${message }
	</c:if>
	</div>
	<form action="log_check" method="post">
	<div class="imgcontainer">
    <img src="img/img_avatar.png" alt="Avatar" class="avatar">
  	</div>
  	<div class="container">
  	<label for="reg_no"><b>Registration Id</b></label>
	<input type="text" placeholder="Enter Registration Number" name="reg_no" required><br>
	<label for="password"><b>Password</b></label>
	<input type="password" placeholder="Enter Password" name="password" required><br>
	</div>
	<button type="submit"><b>Login</b></button>
	<!-- <input type="submit" name="button" value="Login"> -->
	<div class="container" style="background-color:#f1f1f1">
	<div class="reg"><a href="register.jsp"><b>Register</b></a></div>
	<div class="psw">Forgot <a href="#">password?</a></div>
	</div>
	</form>
</body>
</html>