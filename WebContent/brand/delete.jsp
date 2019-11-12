<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.industrialmaster.carsale.db.DB"%>
<%@include file="../WEB-INF/jspf/admin_only.jsp" %>
<%
	
	String id = request.getParameter("id");
	Connection con = DB.getCon();
	String sql = "DELETE FROM brand WHERE id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, id);
	ps.executeUpdate();
	
	response.sendRedirect("list.jsp");

%>