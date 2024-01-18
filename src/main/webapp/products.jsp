<%@page import="com.pojo.Vendor"%>
<%@page import="com.pojo.Customer"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.pojo.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<% List<Product> products = new ProductDao().getAllProducts(); 
	Customer customer = (Customer)session.getAttribute("customer"); 
    Vendor vendor = (Vendor)session.getAttribute("vendor");
	
    if(vendor!=null){
    	products = new ProductDao().getAllProductsByVendor(vendor.getId()); 
    }
    
%>

</head>

<body>


	<!-- Section -->
	<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                   <% for(Product p : products) {%>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="Resources/assets/<%=p.getImage()%>">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=p.getName()%></h5>
                                    <!-- Product Description -->
                                    <%=p.getDescription() %>
                                    <hr>
                                    <!-- Product price-->                                    
                                    Price:<%=p.getPrice() %>
                                    
                                </div>
                            </div>
                            <!-- Product actions-->
                            <%if(vendor!=null && customer==null){ %>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent" align="center">
                                <span ><a class="btn btn-outline-dark mt-auto" href="ProductServlet?action=delete&&id=<%=p.getId()%>">Delete</a></span>
                                <span style="padding-left:25px; " ><a class="btn btn-outline-dark mt-auto" href="ProductServlet?action=edit&&id=<%=p.getId()%>">Edit</a></span>
                            </div>
                            <%}if(customer!=null && vendor==null) {%>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="CartServlet?action=add&&pid=<%=p.getId()%>&&cid=<%=customer.getId()%>">Add To Cart</a></div>
                            </div>
                            <%}if(customer==null && vendor==null) {%>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="customerlogin.jsp">Add To Cart</a></div>
                            </div>
                            <%} %>
                        </div>
                    </div>
				<%} %>
                </div>
            </div>
        </section>
	

</body>
</html>