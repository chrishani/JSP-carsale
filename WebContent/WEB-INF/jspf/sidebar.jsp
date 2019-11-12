
		<style type="text/css">
			.card {
			  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			  transition: 0.3s;
			}
			
			.card:hover {
			  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
			}
			
			.container {
			  padding: 2px 16px;
			}
		</style>
		<%
		if(session.getAttribute("ROLE")!=null){
		%>
		<div class="card">
		  <img src="<%=request.getContextPath() %>/<%=session.getAttribute("PHOTO") %>" alt="Avatar" style="width:100%">
		  <div class="container">
		    <h4><b><%=session.getAttribute("NAME") %></b></h4>
		    <p>
		    <%=(session.getAttribute("ROLE").toString().equals("a"))?"ADMIN":"MEMBER" %>
		    </p>
		  </div>
		</div>
		
		<ul class="list-group">
			<%
			if((session.getAttribute("ROLE")!=null && session.getAttribute("ROLE").toString().equals("a"))){
			%>
		  	<li class="list-group-item">
				<a href="<%=request.getContextPath() %>/brand/list.jsp"> Brands </a>
		  	</li>
		  	<li class="list-group-item">
				<a href="<%=request.getContextPath() %>/model/list.jsp"> Models </a>
		  	</li>
		  	<li class="list-group-item">
				<a href="<%=request.getContextPath() %>/car/list.jsp"> Cars </a>
		  	</li>
		  	<li class="list-group-item">
				<a href="<%=request.getContextPath() %>/member/list.jsp"> Members </a>
		  	</li>
		  	<%
			}else{
		  	%>
		  	<li class="list-group-item">
				<a href="<%=request.getContextPath() %>/member/profile.jsp"> My Profile </a>
		  	</li>
		  	
		  	<li class="list-group-item">
				<a href="<%=request.getContextPath() %>/member/cars.jsp"> My Cars </a>
		  	</li>
		  	<%
		  	}
		  	%>
		</ul> 
	<%
	}else{
		%>
		<img src="<%=request.getContextPath() %>/images/banner.jpg" width="250"/>
		<%
	}
	%>