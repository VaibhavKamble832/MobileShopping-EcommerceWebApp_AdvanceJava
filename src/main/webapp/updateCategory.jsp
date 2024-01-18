<%@page import="com.pojo.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Category</title>

<% Category category = (Category)session.getAttribute("category"); %>

</head>
<body>

	<div align="center">
		
		<h1>ADD CATEGORY</h1>
		
		<form action="CategoryServlet" method="post">
			<input type="hidden" name="action" value="updateCategory">
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				<tr>
					<td>Category Id:</td>
					<td><input type="text" name="id" value="<%=category.getId() %>" required="required"></td>
				</tr>
				<tr>
					<td>Category Name:</td>
					<td><input type="text" name="category_name" value="<%=category.getCategory_name() %>" required="required"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea rows="4" cols="20" name="description"><%=category.getDescription() %></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit"></td>
					<td><input type="reset" name="Reset"></td>
				</tr>
				
			</table>
			
		</form>
		<h2><a href="home.html">Home</a></h2>
	</div>
	
	

</body>
</html>