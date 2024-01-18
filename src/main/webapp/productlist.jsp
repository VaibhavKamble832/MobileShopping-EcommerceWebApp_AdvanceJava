<%@page import="com.dao.ProductDao"%>
<%@page import="com.pojo.Vendor"%>
<%@page import="com.pojo.Customer"%>
<%@page import="com.pojo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Product List</title>

<% List<Product> plist = (List<Product>)session.getAttribute("productList"); 
	
	Customer customer = (Customer)session.getAttribute("customer"); 
	Vendor vendor = (Vendor)session.getAttribute("vendor");
	
	if(vendor!=null){
		plist = new ProductDao().getAllProductsByVendor(vendor.getId());
		
		plist = (List<Product>)session.getAttribute("productList");
	}
	
%>

</head>


<style>
	.search{
		text-align: center;
		margin: 40px 0 0 0;
	}
	.search input{
		outline: none;
		padding: 7px 50px;
	}
</style>


<body>

	<!-- Navigation-->
        <jsp:include page="navbar.jsp"></jsp:include>

	<!-- Header-->
        <jsp:include page="banner.jsp"></jsp:include>

			
			<%if(vendor!=null) {%>
				<form action="ProductServlet" method="post">
			  	  <input type="hidden" name="action" value="searchProductByVendor">
				   <div class="search">
					   <input type="hidden" name="vendorid" value="<%=vendor.getId()%>">
					   <input type="text" name="searchName" placeholder="Search Your product ...">
					   <input type="submit" value="Search">
				   </div>
		   		</form>
									
			<%}else{ %>
				<form action="ProductServlet" method="post">
				   <input type="hidden" name="action" value="searchProduct">
					   <div class="search">
						   <input type="text" name="searchName" placeholder="Search product...">
					   	<input type="submit" value="Search">
					   </div>
			   </form>	
			<%} %>


	<!-- Section -->
	<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                   <% for(Product p : plist) {%>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=p.getName()%></h5>
                                    <!-- Product Description -->
                                    <%=p.getDescription() %>
                                    <hr>
                                    <!-- Product price-->                                    
                                    Price: <%=p.getPrice() %>
                                    
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add To Cart</a></div>
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
	
	<!-- Footer-->
        
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>