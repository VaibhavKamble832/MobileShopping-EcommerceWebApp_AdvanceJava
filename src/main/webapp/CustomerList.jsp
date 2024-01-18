<%@page import="com.pojo.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Customer Details</title>

<% List<Customer> clist = (List<Customer>)session.getAttribute("customerlist"); %>

</head>
<body>

	<div align="center">

		<h1>ALL ACCOUNT DETAILS</h1>

		<table border="2" cellspacing="15" cellpadding="15"
			style="border-collapse: collapse;">

			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>CONTACT</th>
				<th>EMAIL</th>
				<th>PASSWORD</th>
				<th colspan="2">ACTION</th>
			</tr>

			<% for (Customer c : clist) { %>
			<tr>
				<td><%= c.getId() %></td>
				<td><%= c.getName() %></td>
				<td><%= c.getContact() %></td>
				<td><%= c.getEmail() %></td>
				<td><%= c.getPassword() %></td>
				<td><a href="CustomerServlet?action=delete&&id=<%=c.getId() %>">Delete</a></td>
				<td><a href="CustomerServlet?action=edit&&id=<%=c.getId() %>">Edit</a></td>
			
			</tr>

			<% }%>
		</table>

		<h2> <a href="index.jsp">Home</a> </h2>
	</div>

</body>
</html>