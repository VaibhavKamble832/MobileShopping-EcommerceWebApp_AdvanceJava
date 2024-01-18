<!DOCTYPE html>
<%@page import="com.pojo.Cart"%>
<%@page import="java.util.List"%>
<html lang="en">
    <head>
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
        
        <% List<Cart> cartList = (List<Cart>)session.getAttribute("cartList"); %>
        
    </head>
    <body>
        
        <!-- Navigation-->
        <jsp:include page="navbar.jsp"></jsp:include>
        
        <!-- Header-->
        <jsp:include page="banner.jsp"></jsp:include>
        
        <!-- Section-->
		<br><br>
		
		<div align="center">
			<%--<table class="table table-bordered border-primary" style="display: inline;">
				<tr>
					<th>ID</th>
					<th>PRODUCT NAME</th>
					<th>PRICE</th>
					<th>DESCRIPTION</th>
				</tr>
				
				<% for(Cart cr:cartList) {%>
					<tr>
						<td><%=cr.getId() %></td>
						<td><%=cr.getName() %></td>
						<td><%=cr.getPrice() %> Rs</td>
						<td><%=cr.getDescription() %></td>
					</tr>
				<%} %>
			</table> --%>
			
<style>

.cart {
  border: 1px solid #ccc;
  padding: 20px;
  width: 300px;
}

.product {
  margin-bottom: 20px;
}

button {
  padding: 5px 10px;
  cursor: pointer;
}

.quantity {
  margin-bottom: 10px;
}

input[type="number"] {
  width: 50px;
  text-align: center;
}

</style>
			
			<% for (Cart cr : cartList) { %>
    			<div class="cart">
  					<div class="product">
    					<h2><%=cr.getName() %></h2>
    					<p>Price: <%=cr.getPrice() %></p>
    					<div class="quantity">
      						<label for="quantity1">Quantity:</label>
      						<button class="decrease-btn">-</button>
      						<input type="number" id="quantity1" value="1" min="1">
      						<button class="increase-btn">+</button>
    					</div>
    					<p>Total: <span class="total" id="total1"><%=cr.getPrice() %></span></p>
  				    </div>

  					 <p>Total Amount: <span id="overallTotal">25</span></p>
 					 <button id="placeOrderBtn">Place Order</button>
				</div>
			<% } %>
			
</body>
<script>
    const increaseBtns = document.querySelectorAll('.increase-btn');
    const decreaseBtns = document.querySelectorAll('.decrease-btn');
    const quantityInputs = document.querySelectorAll('.quantity-input');
    const totalAmounts = document.querySelectorAll('.total-amount');
    const addToCartBtns = document.querySelectorAll('.add-to-cart-btn');
    const prices = [<% for (Cart cr : cartList) { %><%= cr.getPrice() %>,<% } %>];

    function updateTotal(index) {
        const quantity = parseInt(quantityInputs[index].value);
        const total = prices[index] * quantity;
        totalAmounts[index].textContent = total + ' Rs.';
    }

    function handleQuantityChange(index) {
        updateTotal(index);
    }

    function handleAddToCart(index) {
        const quantity = parseInt(quantityInputs[index].value);
        const total = prices[index] * quantity;
        alert(`Added ${quantity} item(s) to cart. Total amount: ${total} Rs.`);
    }

    increaseBtns.forEach((btn, index) => {
        btn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInputs[index].value);
            currentValue++;
            quantityInputs[index].value = currentValue;
            handleQuantityChange(index);
        });
    });

    decreaseBtns.forEach((btn, index) => {
        btn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInputs[index].value);
            if (currentValue > 1) {
                currentValue--;
                quantityInputs[index].value = currentValue;
                handleQuantityChange(index);
            }
        });
    });

    quantityInputs.forEach((input, index) => {
        input.addEventListener('change', () => {
            handleQuantityChange(index);
        });
    });

    addToCartBtns.forEach((btn, index) => {
        btn.addEventListener('click', () => {
            handleAddToCart(index);
        });
    });
</script>

</html>
