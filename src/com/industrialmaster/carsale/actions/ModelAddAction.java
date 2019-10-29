package com.industrialmaster.carsale.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.industrialmaster.carsale.db.DB;

@WebServlet("/model_add")
public class ModelAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		//1. Collect Input Field Values (Fillable)
		String name = request.getParameter("name");
		String brand_id = request.getParameter("brand_id");
		
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
				String sql = "INSERT INTO model (name, brand_id)  VALUES (?,?)";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, brand_id);
				ps.executeUpdate();
				
				//response.sendRedirect("msg.jsp?msg=Model Saved Successfully.");
				response.sendRedirect("model/list.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			//InValid Form
			response.sendRedirect("model/add.jsp?msg="+errors);
		}
	}

}
