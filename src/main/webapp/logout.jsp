<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //1.1
response.setHeader("Pragma", "no-cache"); //1.0
response.setHeader("Expires", "0"); //proxies
session.invalidate();
response.sendRedirect("login.jsp");
%>
</body>
</html>