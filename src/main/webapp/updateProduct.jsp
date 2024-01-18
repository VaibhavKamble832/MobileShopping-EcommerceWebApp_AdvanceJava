<%@page import="com.pojo.Product"%>
<%@page import="com.pojo.Vendor"%>
<%@page import="com.pojo.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>

<% List<Category> clist = (List<Category>)session.getAttribute("clist"); %>
<% List<Vendor> vlist = (List<Vendor>)session.getAttribute("vlist");  %>

<% Product product = (Product)session.getAttribute("product"); %>

</head>
<body>

<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<br><br><br>
	
<div align="center">
		
		<h1>ADD PRODUCT</h1>
		

		<form action="ProductServlet" method="post">
			
			<input type="hidden" name="action" value="updateProduct">
			
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				
				<tr>
					<td>Product Id:</td>
					<td><input type="text" name="id" value="<%=product.getId() %>" required="required"></td>
				</tr>
				<tr>
					<td>Product Name:</td>
					<td><input type="text" name="name" value="<%=product.getName() %>" required="required"></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="number" name="price"  value="<%=product.getPrice() %>" required="required"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><input type="text" name="description" value="<%=product.getDescription() %>" required="required"></td>
				</tr>
				
				<tr>
					<td>Category:</td>
					<td>
						<select name="category_id">
							<option value="0">--- Select ---</option>
							<% for(Category c:clist) {%>
								<option value="<%=c.getId()%>"><%=c.getCategory_name() %></option>								
							<%} %>
						</select> 
					</td>
				</tr>
				<tr>
					<td>Vendor:</td>
					<td>
					<select name="vendor_id">
							<option value="0">--- Select ---</option>
							<% for(Vendor v:vlist) {%>
								<option value="<%=v.getId() %>"><%=v.getName() %></option>
							<%} %>
						</select> 
					</td>
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