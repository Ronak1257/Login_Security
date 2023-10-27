<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" href="restyles.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="background">
		<div class="shape"></div>
		<div class="shape"></div>
	</div>
	<form action="register2.jsp" method="post">
		<h3>Basic Details</h3>

		<label for="fname">First Name</label> <input type="text" placeholder="Enter First Name" id="fname" name="fname"> 
		<label for="lname">Last Name</label> <input type="text" placeholder="Enter Last Name" id="lname" name="lname">
		<label for="dob">Date Of Birth</label> <input type="date" placeholder="dd-mm-yyyy" id="dob" name="dob">
		<div class="gender">
			<div class="gender1">
				<label for="">GENDER</label>			
			</div>
			<div class="gender2">
			<div>
				<input type="radio" name="gender" value="male" id="gender-male">
				<label for="gender-male">Male</label>
			</div>
			<div>
				<input type="radio" name="gender" value="female" id="gender-female">
				<label for="gender-female">Female</label>			
			</div>
			</div>
		</div>
		<div class="twobuttons">
			<button class="forbutton" type="submit">Next</button>
			<button class="forbutton" type="reset">Reset</button>
		</div>
	</form>
</body>
</html>