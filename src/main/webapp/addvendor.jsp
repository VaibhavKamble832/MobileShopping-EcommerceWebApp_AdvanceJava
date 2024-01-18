<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Vendor</title>

</head>
<body>

	<div align="center">

		<h1>REGISTER VEDNOR</h1>

		<form action="VendorServlet" method="post">

			<input type="hidden" name="action" value="addVendor">

			<table border="2" cellpadding="15" cellspacing="15"
				style="border-collapse: collapse;">

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
		<h2>
			<a href="index.jsp">Home</a>
		</h2>
	</div>

</body>
</html>