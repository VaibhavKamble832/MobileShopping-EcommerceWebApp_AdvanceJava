<%@page import="java.util.List"%>
<%@page import="com.pojo.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Category Details</title>
<% List<Category> categorylist = (List<Category>) session.getAttribute("categorylist");%>
</head>
<body>

	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>

	<!-- Header-->
	<jsp:include page="banner.jsp"></jsp:include>

	<br><br>
	

	<div align="center">

		<h1>ALL CATEGORY DETAILS</h1>

		<table border="2" cellspacing="15" cellpadding="15"
			style="border-collapse: collapse;">

			<tr>
				<th>ID</th>
				<th>CATEGORY_NAME</th>
				<th>DESCRIPTION</th>
				<th colspan="2">ACTION</th>
			</tr>

			<% for (Category category : categorylist) { %>
			<tr>
				<td><%= category.getId() %></td>
				<td><%= category.getCategory_name() %></td>
				<td><%= category.getDescription() %></td>
				<td><a
					href="CategoryServlet?action=delete&&id=<%=category.getId() %>">Delete</a></td>
				<td><a
					href="CategoryServlet?action=edit&&id=<%=category.getId()%>">Edit</a></td>

			</tr>

			<% }%>
		</table>

	</div>
	
	<br><br>

	<!-- Footer-->
	<jsp:include page="footer.jsp"></jsp:include>
	
	
</body>
</html>