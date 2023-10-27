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
	<form action="register" method="post">
		<h3>Contact Details</h3>
		<%
		try{
			String rmsg = session.getAttribute("rmsg").toString();
		  	if (rmsg != null) {
    			out.println("<h4 class=\"userpass\">" + rmsg + "</h4>");
			}
		}catch(Exception e){}
		%>
		<label for="uname">Username</label> <input type="text" placeholder="Enter Username" id="uname" name="uname"> 
		<label for="pass">Password</label> <input type="password" placeholder="Enter Password" id="pass" name="pass">
		<label for="cpass">Confirm Password</label><input type="password" placeholder="Confirm Password" id="cpass" name="cpass">
		<div class="twobuttons">
			<button class="forbutton" type="submit">Register</button>
			<button class="forbutton" type="reset">Reset</button>
		</div>
	</form>
</body>
<%
session.setAttribute("mnumber",request.getParameter("mnumber"));
session.setAttribute("alnumber",request.getParameter("alnumber"));
session.setAttribute("email",request.getParameter("email"));
%>
</html>