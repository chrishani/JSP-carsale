package com.industrialmaster.carsale.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.industrialmaster.carsale.db.DB;


@WebServlet("/reg")
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//1. Collect Input Field Values (Fillable)
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mobile = request.getParameter("mobile");
		String photo = request.getParameter("photo");
		
		//2. Generate Non Fillables
		Date date = new Date();
		int status = 1;
		String role = "u";
		
		String errors = "";
		//3. Process Data (Validations)
		if(name==null || name.length()<5) {
			errors+="Name must have 5 Characters Minimum.<br/>";
		}
		
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
		if(!email.matches(regex)) {
			errors+="Email is Invalid.<br/>";
		}
		
		if(password==null || password.length()<5) {
			errors+="Password must have 5 Characters Minimum.<br/>";
		}
		
		if(errors.equals("")) {
			//Valid Form
			//4. Database Connection
			
			try {
				Connection connection = DB.getCon();
				//5. SQL & Execution
				String sql = "INSERT INTO member "+
						" (name, email, password, photo,mobile, date, status, role) "+
						" VALUES (?,?,?,?,?,?,?,?)";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setString(4, photo);
				ps.setString(5, mobile);
				ps.setDate(6, new java.sql.Date(date.getTime()));
				ps.setInt(7, status);
				ps.setString(8, role);
				ps.executeUpdate();
				
				response.sendRedirect("msg.jsp?msg=Thank You for Registering with us.");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			//InValid Form
			response.sendRedirect("register.jsp?msg="+errors);
		}
		
		
	}

}
