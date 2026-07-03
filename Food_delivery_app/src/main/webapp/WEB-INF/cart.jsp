<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.food.model.Cart, com.food.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="cart-container">
		<div class="cart-heading">
			<h1>Your Cart</h1>
			<p>Review your selected food item</p>
		</div>
		
		<%
			Cart cart=(Cart) session.getAttribute("cart");
			Integer restaurantId=(Integer) session.getAttribute("restaurantId");
			double grandTotal=0;
			if(cart!=null && !cart.getItems().isEmpty()){
				
		%>
		<div class="cart-box">
			<div class="cart-header">
				<div>Item</div>
				<div>Price</div>
				<div>Total</div>
				<div>Quantity</div>
				<div>Action</div>
								
			</div>
			<%
				for(CartItem item : cart.getItems().values()){
					
			%>
			<div class="cart=item">
				<div class="item-name">
					<%= item.getName() %>
				</div>
				<div class="item-price">
					<%= item.getPrice() %>
				</div>
				<div class="item-total">
					<%= item.getTotalPrice() %>
				</div>
				
				<div class="quantity-box">
					<form action="cart" method="post">
						<input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
						<input type="hidden" name="restaurantId" value="<%= restaurantId %>">
					</form>
				</div>
			</div>
			<% 
			}
		%>
		</div>
		<% 
			}
		%>
	</div>
	
</body>
</html>