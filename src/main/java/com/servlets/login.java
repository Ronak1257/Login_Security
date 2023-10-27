package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();

		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		
		if(uname=="" || pass=="") {
			session.setAttribute("lmsg","Username and Password is required");
			response.sendRedirect("login.jsp");
			return;
		}
		//sql connection from web.xml
		ServletContext ctx = request.getServletContext();
		String url = ctx.getInitParameter("url");
		String username = ctx.getInitParameter("username");
		String password = ctx.getInitParameter("password");
		
		try {
			Connection conn = DriverManager.getConnection(url, username, password);
			String query ="select pass from rbcoin where (uname= '"+uname+"')";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs1=ps.executeQuery();
			String passwords=null;
			if(rs1.next()) {
				passwords=rs1.getString("pass");;
			}
			if(passwords==null) {
				session.setAttribute("lmsg","Register First");
				response.sendRedirect("login.jsp");
			}
			else if(pass.equals(passwords.trim())) {
				String q ="select * from rbcoin where (uname= '"+uname+"' and pass= '"+pass+"')";
				PreparedStatement p=conn.prepareStatement(q);
				ResultSet rs=p.executeQuery();
				
				if(rs.next()) {
					session.setAttribute("uname", rs.getString("uname"));
					session.setAttribute("pass", rs.getString("pass"));
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("dob", rs.getString("dob"));
					session.setAttribute("gender", rs.getString("gender"));
					session.setAttribute("mnumber", rs.getString("mnumber"));
					session.setAttribute("time", session.getLastAccessedTime());
					response.sendRedirect("dashboard.jsp");
				}				
			}
			else {
				session.setAttribute("lmsg","Password is incorrect");
				response.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
