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

@WebServlet("/car_update")
public class CarUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				String id = request.getParameter("id");
				String model_id = request.getParameter("model_id");
				String title = request.getParameter("title");
				String description = request.getParameter("description");
				String price = request.getParameter("price");
				String milage = request.getParameter("milage");
				String fuel_type = request.getParameter("fuel_type");
				String location = request.getParameter("location");
				String year = request.getParameter("year");
				String photo = request.getParameter("photo");  
				String errors = ""; 
				if (title == null || title.length() < 10) {
					errors += "Name must have 10 Characters Minimum.<br/>";
				}

				if (errors.equals("")) { 
					try {
						Connection connection = DB.getCon(); 
						String sql = "UPDATE car "+
						" SET title=?, description=?, price=?, milage=?, fuel_type=?, location=?, year=?, photo=?, model_id=?  "+
								" WHERE id=? ";
						PreparedStatement ps = connection.prepareStatement(sql);
						ps.setString(1, title);
						ps.setString(2, description);
						ps.setString(3, price);
						ps.setString(4, milage);
						ps.setString(5, fuel_type);
						ps.setString(6, location);
						ps.setString(7, year);
						ps.setString(8, photo);
						ps.setString(9, model_id);
						ps.setString(10, id);
						ps.executeUpdate();

						response.sendRedirect("car/list.jsp");

					} catch (Exception e) {
						e.printStackTrace();
					}

				} else { 
					response.sendRedirect("car/edit.jsp?msg=" + errors);
				}
	}

}
