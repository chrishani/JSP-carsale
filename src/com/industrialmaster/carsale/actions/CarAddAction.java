package com.industrialmaster.carsale.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.industrialmaster.carsale.db.DB;

@WebServlet("/car_add")
public class CarAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. Collect Input Field Values (Fillable)
		String model_id = request.getParameter("model_id");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String milage = request.getParameter("milage");
		String fuel_type = request.getParameter("fuel_type");
		String location = request.getParameter("location");
		String year = request.getParameter("year");
		String photo = request.getParameter("photo"); 
		
		// 2. Generate Non Fillable
		Date date = new Date();
		int imp_count = 0;
		int view_count = 0;
		int sold = 0;
		int member_id = 1; //After Login Created this will Change
		
		String errors = "";
		// 3. Process Data (Validations)
		if (title == null || title.length() < 10) {
			errors += "Name must have 10 Characters Minimum.<br/>";
		}

		if (errors.equals("")) {
			// Valid Form
			try {
				Connection connection = DB.getCon();
				// 4. SQL & Execution
				String sql = "INSERT INTO car "+
				" (title, description, price, milage, fuel_type, location, year, photo, date, imp_count, view_count, sold, model_id, member_id) "+
						" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, description);
				ps.setString(3, price);
				ps.setString(4, milage);
				ps.setString(5, fuel_type);
				ps.setString(6, location);
				ps.setString(7, year);
				ps.setString(8, photo);
				ps.setDate(9, new java.sql.Date(date.getTime()) );
				ps.setInt(10, imp_count);
				ps.setInt(11, view_count);
				ps.setInt(12, sold);
				ps.setString(13, model_id);
				ps.setInt(14, member_id);
				ps.executeUpdate();

				response.sendRedirect("msg.jsp?msg=Car Saved Successfully.");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			// InValid Form
			response.sendRedirect("car/add.jsp?msg=" + errors);
		}
	}

}
