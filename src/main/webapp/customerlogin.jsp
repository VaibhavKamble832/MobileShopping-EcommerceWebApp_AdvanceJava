<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
</head>
<body>

	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Navigation-->
	<jsp:include page="banner.jsp"></jsp:include>	
	<br><br><br>

	<div align="center">
		
		<form action="LoginServlet" method="post">

			<input type="hidden" name="action" value="customerLogin">

			<table border="2" cellspacing="15" cellpadding="15"
				style="border-collapse: collapse;">
				<tr>
					<th>Email</th>
					<td><input type="email" name="uname"
						placeholder="Enter your email"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="passw"
						placeholder="Enter your password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login"></td>
					<td><button>
							<a href="addCustomer.jsp">Click here for Registration</a>
						</button></td>
				</tr>

			</table>

		</form>

	</div>

	<br><br><br>

	<!-- Footer-->

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>