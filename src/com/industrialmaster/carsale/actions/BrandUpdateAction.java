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


@WebServlet("/brand_update")
public class BrandUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		String errors = ""; 
		if(name==null || name.length()<2) {
			errors+="Name must have 2 Characters Minimum.<br/>";
		}
		
		if(errors.equals("")) { 
			try {
				Connection connection = DB.getCon(); 
				String sql = "UPDATE brand SET name=? WHERE id=?";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, id);
				ps.executeUpdate();
				response.sendRedirect("brand/list.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			response.sendRedirect("brand/edit.jsp?msg="+errors);
		}
	}

}
