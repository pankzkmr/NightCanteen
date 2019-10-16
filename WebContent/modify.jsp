<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit-Profile</title>
	<link rel = "icon" href =  
	"img/logo-title.webp" 
	type = "image/x-icon"> 
	<style>
		* {
			box-sizing: border-box
		}
		body {
			text-align: center;
			background-color: black;
			font-family: courier;
			color: white;
		}
		button {
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			cursor: pointer;
			width: 100%;
			opacity: 0.9;
		}
		form {
			display: inline-block;
			border: 3px solid #f1f1f1;
			width: 50%
		}

		lable {
			margin-top: 10px;
		}
		h1 {
			text-shadow: 2px 2px 8px red;
			font-size: 300%;
			color: green ;
		}
		input[type=text], input[type=password], select {
			width: 100%;
			padding: 10px;
			margin: 5px 0 22px 0;
			display: inline-block;
			border: none;
			background: #f1f1f1;
		}
		input[type=text]:focus, input[type=password]:focus {
			background-color: #ddd;
			outline: none;
		}
		hr {
			margin-bottom: 20px;
		}
		button:hover {
			opacity:1;
		}
		.container {
			padding: 16px;
		}
		.cancelbtn, .signupbtn {
			float: left;
			width: 50%;
		}
		.cancelbtn {
			padding: 14px 20px;
			background-color: #f44336;
		}
		.clearfix::after {
			content: "";
			clear: both;
			display: table;
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

		.profileimg:hover .image {
			opacity: 0.3;
		}

		.profileimg:hover .middle {
			opacity: 1;
		}
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
%>
	<form action="modifyDAO" method="post">
		<div class="container">
			<h1>Edit Profile</h1>
			<p>Edit the details</p>
			<hr>
			<div class="profileimg">
				<img src="img/user.jpeg" alt="John" style="padding-bottom:20px;width:50%;height:50%;border-radius: 50%;">
				<div class="middle"><div ><button>Change Photo</button></div></div>
			</div>
			<label for="name"><b>Name</b></label>
			<input type="text" value="${name}" name="name" required><br>
			<label for="regNo"><b>Registration Number</b></label>
			<input type="text" value="${reg_no}" name="regNo" required><br>
			<label for="branch"><b>Branch</b></label>
			<select name="branch" required >
				<option label=" "></option>
				<option ${branch == 'IT' ? 'selected' : ''} value="IT">IT</option>
				<option ${branch == 'E&TC' ? 'selected' : ''} value="E&TC">E&TC</option>
				<option ${branch == 'Mechanical' ? 'selected' : ''} value="Mechanical">Mechanical</option>
				<option ${branch == 'CSE' ? 'selected' : ''} value="CSE">CSE</option>
			</select><br>
			
			<label for="flank"><b>Flank</b></label>
			<select name="flank" required>
				<option label=" "></option>
				<option ${flank == 'A' ? 'selected' : ''} value="A">A-Flank</option>
				<option ${flank == 'B' ? 'selected' : ''} value="B">B-Flank</option>
				<option ${flank == 'C' ? 'selected' : ''} value="C">C-Flank</option>
				<option ${flank == 'D' ? 'selected' : ''} value="D">D-Flank</option>
			</select><br>
			<label for="roomNo"><b>Room No</b></label>
			<input value="${room}"type="text" placeholder="Enter Room Number" name="roomNo" required><br>
			<label for="phoneNo"><b>Phone No</b></label>
			<input placeholder="Enter only if you want to change" type="text" name="phoneNo" ><br>
			
			
			<div class="clearfix">
				<button type="submit" class="signupbtn">Save Profile</button>
				<a href="profile.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
			</div>
		</div>
	</form>
</body>
</html>