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
	<form action="register3.jsp" method="post">
		<h3>Contact Details</h3>

		<label for="mnumber">Mobile Number</label> <input type="text" placeholder="Enter Mobile Number" id="mnumber"name="mnumber"> 
		<label for="alnumber">Alternative Number</label> <input type="text" placeholder="Enter Last Name" id="alnumber"name="alnumber">
		<label for="email">Email</label><input type="email" placeholder="Enter Email Id" id="email" name="email">
		<div class="twobuttons">
			<button class="forbutton" type="submit">Next</button>
			<button class="forbutton" type="reset">Reset</button>
		</div>
	</form>
</body>
<%
session.setAttribute("name",request.getParameter("fname")+" "+request.getParameter("lname"));
session.setAttribute("dob",request.getParameter("dob"));
session.setAttribute("gender",request.getParameter("gender"));
%>
</html>