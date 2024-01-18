<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register user</title>

<% String message = (String)request.getAttribute("message"); %>

</head>
<body>

	<!-- Navigation-->
        <jsp:include page="navbar.jsp"></jsp:include>

	<div align="center">
		
		<h1>REGISTER CUSTOMER</h1>
		
		<% if(message!=null) {%>
			
			<script type="text/javascript">
				alert("Email and Contact already Exists")
			</script>
			
		<%} %>
		<form action="CustomerServlet" method="post">
			
			<input type="hidden" name="action" value="addCustomer">
			
			<table border="2" cellpadding="15" cellspacing="15" style="border-collapse: collapse;">
				
				<tr>
					<td>Name:</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td>Contact:</td>
					<td><input type="text" name="contact" required="required"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit"></td>
					<td><input type="reset" name="Reset"></td>
				</tr>
				
			</table>
			
		</form>
	</div>
	
		
		<!-- Footer-->
        
        <jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>