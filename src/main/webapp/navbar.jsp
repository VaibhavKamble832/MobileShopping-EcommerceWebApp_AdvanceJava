<%@page import="com.pojo.Vendor"%>
<%@page import="com.pojo.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="Resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="Resources/css/styles.css" rel="stylesheet" />
        
        
        <style>
        	form button i a{
        		text-decoration: none;
        		font-weight:bolder;
        		color: black; 
        	}
        	form button i a:hover{
        		color: white;
        	}
        </style>

<%
	Customer customer = (Customer)session.getAttribute("customer"); 
	Vendor vendor = (Vendor)session.getAttribute("vendor");
	String admin = (String)session.getAttribute("admin");
%>


</head>
<body>

<div>


		<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            
            	<%if(customer==null && vendor==null && admin==null) {%>
	                <a class="navbar-brand" href="#!" style="font-weight: bolder;">DeveLearn Mobiles</a>
            	<%} if(customer!=null && vendor==null && admin==null) {%>
	                <a class="navbar-brand" href="#!" >WELCOME <span style="font-weight: bolder;"><%=customer.getName() %></span></a>
            	<%} if(vendor!=null && customer==null && admin==null) {%>
	                <a class="navbar-brand" href="#!" >WELCOME <span style="font-weight: bolder;"><%=vendor.getName() %></span></a>
            	<%} if(admin!=null && customer==null && vendor==null) {%>
	                <a class="navbar-brand" href="#!" style="font-weight: bolder;">WELCOME <span style="font-weight: bolder;">Admin</span></a>
            	<%} %>
            
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="CategoryServlet">Category List</a></li>
                        
                        <% if(customer!=null) {%>
                        	<li class="nav-item"><a class="nav-link" href="updateCustomer.jsp">Edit Profile</a></li>
	                        <li class="nav-item"><a class="nav-link" href="CartServlet">Cart List</a></li>
                        <%} 
                        
                       	if(customer==null && admin==null && vendor==null){%>
                            <li class="nav-item"><a class="nav-link" href="ProductServlet">Search Product</a></li>
                        	<li class="nav-item"><a class="nav-link" href="addCustomer.jsp">Register</a></li>
                        	<li class="nav-item"><a class="nav-link" href="customerlogin.jsp">Login</a></li>
                        <%} %>
		
						<% if(vendor!=null) {%>
                       		<li class="nav-item"><a class="nav-link" href="addCategory.jsp">Add Category</a></li>
                        	<li class="nav-item"><a class="nav-link" href="ProductServlet?action=addProduct">Add Product</a></li>
                        <%} %>
						
						

						<% if(admin!=null) {%>
                        	<li class="nav-item"><a class="nav-link" href="CustomerServlet">Customer List</a></li>
                        	<li class="nav-item"><a class="nav-link" href="addvendor.jsp">Add Vendor</a></li>
                        	<li class="nav-item"><a class="nav-link" href="VendorServlet">Vendor List</a></li>
						<%} if(customer!=null || admin!=null || vendor!=null){%>
							<li class="nav-item"><a class="nav-link" href="ProductServlet">Search Product</a></li>
                        	<li class="nav-item"><a class="nav-link" href="LoginServlet?action=logout">Log Out</a></li>
						<%} %>

                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                          <i><a href="seller.jsp">Become Seller</a></i>
                          
                        </button>
                    </form>
                </div>
            </div>
        </nav>



</body>
</html>