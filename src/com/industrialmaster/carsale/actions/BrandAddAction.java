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

@WebServlet("/brand_add")
public class BrandAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		//1. Collect Input Field Values (Fillable)
		String name = request.getParameter("name");
		
		//2. Generate Non Fillables
		
		String errors = "";
		//3. Process Data (Validations)
		if(name==null || name.length()<2) {
			errors+="Name must have 2 Characters Minimum.<br/>";
		}
		
		if(errors.equals("")) {
			//Valid Form
			try {
				Connection connection = DB.getCon();
				//4. SQL & Execution
				String sql = "INSERT INTO brand (name)  VALUES (?)";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, name);
				ps.executeUpdate();
				
//				response.sendRedirect("msg.jsp?msg=Brand Saved Successfully.");
				response.sendRedirect("brand/list.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			//InValid Form
			response.sendRedirect("brand/add.jsp?msg="+errors);
		}
	}

}
