<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="lostyles.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="background">
		<div class="shape"></div>
		<div class="shape"></div>
	</div>
	<form action="login" method="post" class="fullform">
		<h3>Login Here</h3>
		<%
		try{
			String lmsg = session.getAttribute("lmsg").toString();
		
		  	if (lmsg != null) {
    			out.println("<h4 class=\"logpass\">" + lmsg + "</h4>");
			}
		}
		catch(Exception e){}
		%>
		<label for="uname">Username</label> <input type="text"
			placeholder="Email or Phone" id="uname" name="uname"> <label
			for="pass">Password</label> <input type="password"
			placeholder="Password" id="pass" name="pass">
		<div class="twobuttons">
			<button class="forbutton" type="submit">Log in</button>
			<button class="forbutton" type="reset">Reset</button>
		</div>
		<div class="register">
			<a href="register.jsp">Create an account</a>
		</div>
	</form>
</body>
</html>