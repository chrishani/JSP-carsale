	<%
	final String BASE_URL = request.getContextPath();
	%>
	
	<div class="jumbotron" style="background-image: url(<%=BASE_URL %>/images/bg.jpg)">
			<!-- START OF HEADER -->
			<h1> Car Sale</h1>
			<p> Find Your Dream Car </p>
			<hr/>
			<%
			Object id = session.getAttribute("ID");
			if(id==null){
			%>
				<a href="<%=BASE_URL %>/login.jsp" class="btn btn-success"> LOGIN  </a>
				<a href="<%=BASE_URL %>/register.jsp" class="btn btn-warning"> REGISTER  </a>
			<%
			}else {
			%>
				<p> Welcome  <%=session.getAttribute("NAME") %> </p>
				<a href="<%=BASE_URL %>/logout.jsp" class="btn btn-success"> LOGOUT  </a>
				<a href="<%=BASE_URL %>/car/add.jsp" class="btn btn-warning pull-right"> POST YOUR CAR  </a>
			<%
			}
			%>
			<!-- END OF HEADER -->
	</div>