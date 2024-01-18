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

<% List<Category> clist = (List<Category>)session.getAttribute("categoryList"); %>
<% List<Vendor> vlist = (List<Vendor>)session.getAttribute("vendorList");  %>

</head>
<body>

<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<br><br><br>
	
<div align="center">
		
		<h1>ADD PRODUCT</h1>
		

		<form action="ProductServlet" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="action" value="addProduct">
			
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				<tr>
					<td>Product Name:</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td>Product Image:</td>
					<td><input type="file" name="image" required="required"></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="number" name="price" required="required"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea rows="3" cols="20" name="description"></textarea></td>
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