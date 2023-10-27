package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class register extends HttpServlet{

	
	public boolean registerClient(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String url, username, password;

		ServletContext ctx = req.getServletContext();

		url = ctx.getInitParameter("url");
		username = ctx.getInitParameter("username");
		password = ctx.getInitParameter("password");

		try {
			HttpSession s=req.getSession(false);
			
			Connection con = DriverManager.getConnection(url, username, password);
			String query = "insert into rbcoin(uname,pass,name,email,dob,gender,mnumber,alnumber) values(?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement st = con.prepareStatement(query);
			
			st.setString(1, (String) s.getAttribute("uname"));
			st.setString(2, (String) s.getAttribute("pass"));
			st.setString(3, (String) s.getAttribute("name"));
			st.setString(4, (String) s.getAttribute("email"));
			st.setString(5, (String) s.getAttribute("dob"));
			st.setString(6, (String) s.getAttribute("gender"));
			st.setString(7, (String) s.getAttribute("mnumber"));
			st.setString(8, (String) s.getAttribute("alnumber"));

			int row = st.executeUpdate();
			return row>0;
		} 
		catch (SQLException e) {
			PrintWriter out=resp.getWriter();
			
			out.println(e);
			return false;
		}
	}	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
		session.removeAttribute("rmsg");
		if(uname=="" || pass=="" || cpass=="") {
			session.setAttribute("rmsg","Username and Password is required");
			response.sendRedirect("register3.jsp");
		}
		else if(pass.equals(cpass)) {
			session.setAttribute("uname",request.getParameter("uname"));
			session.setAttribute("pass",request.getParameter("pass"));
			session.removeAttribute("rmsg");
			
			PrintWriter out = response.getWriter();
	        
			boolean isRegister = registerClient(request,response);
			if(isRegister) {
				response.sendRedirect("dashboard.jsp");
			}
			else {
				out.println("<h1>Error</h1>");
			}
	        
		}
		else {
			session.setAttribute("rmsg","Please Reenter Password");
			response.sendRedirect("register3.jsp");
		}
	}
	
}