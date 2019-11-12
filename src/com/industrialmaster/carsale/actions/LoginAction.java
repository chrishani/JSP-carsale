package com.industrialmaster.carsale.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.industrialmaster.carsale.db.DB;

@WebServlet("/log")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. Collect Form Field Values
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//2. Process Authentication
		try {
			Connection con = DB.getCon();
			String sql = "SELECT * FROM member WHERE email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				//Login Success
				
				HttpSession session = request.getSession();
				session.setAttribute("ID", rs.getInt("id"));
				session.setAttribute("NAME", rs.getString("name"));
				session.setAttribute("ROLE", rs.getString("role"));
				session.setAttribute("PHOTO", rs.getString("photo"));
				
				
				response.sendRedirect("index.jsp");
			}else {
				//Login Fail
				response.sendRedirect("login.jsp?msg=Username or Password Invalid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
