package com.industrialmaster.carsale.actions;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.industrialmaster.carsale.db.DB;


@WebServlet("/reg")
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//1. Collect Input Field Values (Fillable)
		String name = null;
		String email = null;
		String password = null;
		String mobile = null;
		String photo = "images/default.png";
		
		//File Uploading...
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload uploader = new ServletFileUpload(factory);
		
		try {
			List<FileItem> fields = uploader.parseRequest(request);
			
			for (FileItem fileItem : fields) {
				if(!fileItem.isFormField()) {
					String imageName = fileItem.getName();
					System.out.println("Name="+imageName);
					String path = getServletContext().getRealPath("\\uploads\\");
					System.out.println("path="+path);
					File savedFile = new File(path+"/"+imageName);
					fileItem.write(savedFile);
					photo = "uploads/"+imageName;
				}else {
					
					String fieldName = fileItem.getFieldName();
					switch(fieldName) {
						case "name": name = fileItem.getString(); break;
						case "email": email = fileItem.getString(); break;
						case "password": password = fileItem.getString(); break;
						case "mobile": mobile = fileItem.getString(); break;
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
		if(email!=null && !email.matches(regex)) {
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
