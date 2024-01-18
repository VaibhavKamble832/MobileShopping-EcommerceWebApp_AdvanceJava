<%@page import="com.pojo.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Customer Details</title>

<% Customer customer = (Customer)session.getAttribute("customer");%>

</head>
<body>

	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>

	<br><br><br>

	<div align="center">
		<h1>UPDATE CUSTOMER</h1>
		<form action="CustomerServlet" method="post">
			
			<input type="hidden" name="action" value="updateCustomer">
			
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				<tr>
					<td>Id:</td>
					<td><input type="text" name="id" value="<%=customer.getId() %>" required="required"></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="name" value="<%=customer.getName() %>" required="required"></td>
				</tr>
				<tr>
					<td>Contact:</td>
					<td><input type="text" name="contact" value="<%=customer.getContact() %>" required="required"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" value="<%=customer.getEmail() %>" required="required"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" value="<%=customer.getPassword() %>" required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit"></td>
					<td><input type="reset" name="Reset"></td>
				</tr>
				
			</table>
			
		</form>
	</div>
	
	<br><br><br>
	
	<!-- Footer-->

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>