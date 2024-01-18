<%@page import="java.util.List"%>
<%@page import="com.pojo.Vendor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Vendor Details</title>

<% List<Vendor> vlist = (List<Vendor>)session.getAttribute("vendorList"); %>

</head>
<body>

<!-- Navigation-->
        <jsp:include page="navbar.jsp"></jsp:include>

<div align="center">

		<h1>ALL VENDOR DETAILS</h1>

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

			<% for (Vendor v : vlist) { %>
			<tr>
				<td><%= v.getId() %></td>
				<td><%= v.getName() %></td>
				<td><%= v.getContact() %></td>
				<td><%= v.getEmail() %></td>
				<td><%= v.getPassword() %></td>
				<td><a href="VendorServlet?action=delete&&id=<%=v.getId()%>">Delete</a></td>
				<td><a href="VendorServlet?action=edit&&id=<%=v.getId()%>">Edit</a></td>
			
			</tr>

			<% }%>
		</table>

	</div>

		<!-- Footer-->
        
        <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>