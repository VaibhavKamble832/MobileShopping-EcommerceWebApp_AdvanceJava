<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
</head>
<body>

<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<br><br><br>

	<div align="center">
		
		<h1>ADD CATEGORY</h1>
		
		<form action="CategoryServlet" method="post">
			<input type="hidden" name="action" value="addCategory">
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				<tr>
					<td>Category Name:</td>
					<td><input type="text" name="category_name" required="required"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea rows="4" cols="20" name="description" required="required"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit"></td>
					<td><input type="reset" name="Reset"></td>
				</tr>
				
			</table>
			
		</form>
		<h2><a href="index.jsp">Home</a></h2>
	</div>

<br><br><br>	

<!-- Footer-->

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>