<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //1.1
response.setHeader("Pragma", "no-cache"); //1.0
response.setHeader("Expires", "0"); //proxies
%>
<%
if(session.getAttribute("uname")==null){
	response.sendRedirect("login.jsp");
}
%>

<%@ include file="header.jsp" %>
<div class="damain">
	<div class="daclass1 daborder">
		<%
    	Date now = new Date();
    	SimpleDateFormat stf = new SimpleDateFormat("hh:mm:ss a");
    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    	String formattedTime = stf.format(now);
    	String formattedDate = sdf.format(now);
  		%>
  		<h3><%= formattedTime %></h3>
  		<h3><%= formattedDate %></h3>
  		<%
  		try{
  		out.println("<h4>Creation Time:"+session.getCreationTime()+"</h4>");
  		out.println("<h4>Last Access Time :"+session.getLastAccessedTime()+"</h4>");
  		out.println("<h4>Remaining Time :"+Math.round((60000-(session.getLastAccessedTime()-session.getCreationTime()))/1000)+"</h4>");
  		}catch(Exception e){}
  		%>
	</div>
	
	<table class="daclass2 daborder">
		<tr class="dar">
			<th class="dat1">Name</th>
			<td class="dat2"><%=session.getAttribute("name") %></td>
		</tr>
		<tr class="dar">
			<th class="dat1">Mobile Number</th>
			<td class="dat2"><%=session.getAttribute("mnumber") %></td>
		</tr>
		<tr class="dar">
			<th class="dat1">Gender</th>
			<td class="dat2"><%=session.getAttribute("gender") %></td>
		</tr>
		<tr class="dar">
			<th class="dat1">Date Of Birth</th>
			<td class="dat2"><%=session.getAttribute("dob") %></td>
		</tr>
		<tr class="dar">
			<th class="dat1">Mail Id</th>
			<td class="dat2"><%=session.getAttribute("email") %></td>
		</tr>
	</table>
</div>
<%@ include file="footer.jsp" %>
<%
//set active timeout
if(session.getLastAccessedTime()-session.getCreationTime()>60*1000) {
	session.invalidate();
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>