<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Login</title>
</head>
<body>

	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Banner-->
	<jsp:include page="banner.jsp"></jsp:include>

	<div align="center">

		<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                    <div class="col mb-5">
                        <div class="card h-100">                            
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"></h5>
                                    <h2><a href="vendorLogin.jsp">Login</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">                            
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"></h5>
                                    <h2><a href="addvendor.jsp">Register</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	
		
	</div>

	<!-- Footer-->

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>