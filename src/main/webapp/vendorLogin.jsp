<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>

	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Banner-->
	<jsp:include page="banner.jsp"></jsp:include>

  <br><br>

	<div align="center">

		<form action="VendorServlet" method="post">

			<input type="hidden" name="action" value="vendorLogin">

			<table border="2" cellspacing="15" cellpadding="15"
				style="border-collapse: collapse;">
				<tr>
					<th>Email</th>
					<td><input type="email" name="email"
						placeholder="Enter your email"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="password"
						placeholder="Enter your password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login"></td>
					<td><button>
							<a href="addvendor.jsp">Click here for Registration</a>
						</button></td>
				</tr>

			</table>

		</form>

	</div>

	<br><br>

	<!-- Footer-->

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>