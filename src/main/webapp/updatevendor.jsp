<%@page import="com.pojo.Vendor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Vendor</title>

<% Vendor vendor = (Vendor)session.getAttribute("vendor");  %>

</head>
<body>

	<div align="center">
		<h1>UPDATE CUSTOMER</h1>
		<form action="VendorServlet" method="post">
			
			<input type="hidden" name="action" value="updateVendor">
			
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				<tr>
					<td>Id:</td>
					<td><input type="text" name="id" value="<%=vendor.getId() %>" required="required"></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="name" value="<%=vendor.getName() %>" required="required"></td>
				</tr>
				<tr>
					<td>Contact:</td>
					<td><input type="text" name="contact" value="<%=vendor.getContact() %>" required="required"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" value="<%=vendor.getEmail() %>" required="required"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" value="<%=vendor.getPassword() %>" required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit"></td>
					<td><input type="reset" name="Reset"></td>
				</tr>
				
			</table>
			
		</form>
		<h2><a href="index.jsp">Home</a></h2>
	</div>
	

</body>
</html>