<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/logo-title.webp" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Sign Up</title>
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
		text-shadow: 2px 2px 8px green;
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
</style>
</head>
<body>
	<form action="registerUser" method="post">
	<div class="container">
	<h1>Sign Up</h1>
	<p>Please fill in this form to create an account.</p>
	<hr>
	<label for="pic"><b>Profile Picture(optional):</b></label>
	<input type="file" name="pic" accept="image/*" style="margin-bottom: 20px;"><br>
	<label for="name"><b>Name</b></label>
	<input type="text" placeholder="Enter Your Name" name="name" required><br>
	<label for="regNo"><b>Registration Number</b></label>
	<input type="text" placeholder="Enter Registration Number" name="regNo" required><br>
	<label for="branch"><b>Branch</b></label>
	<select name="branch" required>
				<option label=" "></option>
				<option value="IT">IT</option>
				<option value="E&TC">E&TC</option>
				<option value="Mechanical">Mechanical</option>
				<option value="CSE">CSE</option>
			</select><br>
	<label for="flank"><b>Flank</b></label>
	<select name="flank" required>
				<option label=" "></option>
				<option value="A">A-Flank</option>
				<option value="B">B-Flank</option>
				<option value="C">C-Flank</option>
				<option value="D">D-Flank</option>
			</select><br>
	<label for="roomNo"><b>Room No</b></label>
	<input type="text" placeholder="Enter Room Number" name="roomNo" required><br>
	<label for="phoneNo"><b>Phone No</b></label>
	<input type="text" placeholder="Enter Phone Number" name="phoneNo" required><br>
	<label for="password"><b>Password</b></label>
	<input type="password" placeholder="Enter Password" name="password" required><br>
	<label for="password2"><b>Re-enter Password</b></label>
	<input type="password" placeholder="Re-enter Password" name="password2" required><br>
	<p>By creating an account you agree to our <a href="itemsDAO.txt" style="color:dodgerblue">Terms & Privacy</a>.</p>
	<div class="clearfix">
	<button type="submit" class="signupbtn">Sign Up</button>
	<a href="login.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
	</div>
	</div>
	</form>
</body>
</html>