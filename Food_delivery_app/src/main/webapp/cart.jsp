<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart, com.food.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodoraX | My Cart</title>

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap");

:root {
    --primary: #FF6B35;
    --secondary: #1E293B;
    --accent: #FFC107;
    --background: #F8FAFC;
    --white: #FFFFFF;
    --text: #334155;
    --muted: #64748B;
    --shadow: 0 18px 45px rgba(15, 23, 42, 0.12);
    --soft-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
    --radius: 22px;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Poppins", Arial, sans-serif;
    background: var(--background);
    color: var(--text);
}

a {
    text-decoration: none;
    color: inherit;
}

.navbar {
    position: sticky;
    top: 0;
    z-index: 100;
    padding: 14px 6%;
    min-height: 78px;
    background: rgba(255, 255, 255, 0.94);
    backdrop-filter: blur(16px);
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 22px;
    box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
}

.logo {
    font-size: 27px;
    font-weight: 800;
    color: var(--secondary);
    white-space: nowrap;
}

.logo span {
    color: var(--primary);
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 18px;
    font-weight: 600;
    flex-wrap: wrap;
}

.nav-links a {
    color: var(--secondary);
    transition: 0.3s;
}

.nav-links a:hover {
    color: var(--primary);
}

.login-btn {
    padding: 11px 21px;
    border-radius: 999px;
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: white !important;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
    transition: 0.3s;
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 0 0 6px rgba(255, 107, 53, 0.14),
                0 15px 30px rgba(255, 107, 53, 0.35);
}

.hero {
    width: min(1180px, 92%);
    margin: 42px auto 30px;
    padding: 44px;
    border-radius: 30px;
    background:
        linear-gradient(135deg, rgba(30, 41, 59, 0.92), rgba(255, 107, 53, 0.78)),
        url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1400&q=80");
    background-size: cover;
    background-position: center;
    color: white;
    box-shadow: var(--shadow);
}

.hero span {
    display: inline-block;
    padding: 9px 16px;
    background: rgba(255, 255, 255, 0.18);
    border-radius: 999px;
    backdrop-filter: blur(12px);
    font-weight: 700;
    margin-bottom: 16px;
}

.hero h1 {
    font-size: clamp(34px, 5vw, 56px);
    line-height: 1.08;
    margin-bottom: 14px;
}

.hero p {
    max-width: 650px;
    color: rgba(255, 255, 255, 0.9);
    line-height: 1.8;
}

.cart-wrapper {
    width: min(1180px, 92%);
    margin: 0 auto 60px;
}

.cart-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--soft-shadow);
    padding: 30px;
    animation: slideUp 0.7s ease both;
}

.cart-card h2 {
    color: var(--secondary);
    font-size: 26px;
    margin-bottom: 22px;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
}

.cart-table th {
    background: #FFF7ED;
    color: var(--primary);
    padding: 15px;
    text-align: center;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.4px;
}

.cart-table th:first-child {
    border-radius: 14px 0 0 14px;
    text-align: left;
    padding-left: 20px;
}

.cart-table th:last-child {
    border-radius: 0 14px 14px 0;
}

.cart-table td {
    padding: 16px 15px;
    text-align: center;
    border-bottom: 1px solid #E2E8F0;
    font-weight: 600;
}

.cart-table td:first-child {
    text-align: left;
    padding-left: 20px;
    color: var(--secondary);
    font-weight: 700;
}

.cart-table tr:hover td {
    background: #F8FAFC;
}

.quantity-box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}

.quantity-form {
    display: inline;
}

.qty-btn {
    width: 32px;
    height: 32px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: 18px;
    font-weight: 800;
    font-family: inherit;
    transition: 0.25s;
}

.minus-btn {
    background: #F1F5F9;
    color: var(--secondary);
}

.minus-btn:hover {
    background: #E2E8F0;
}

.plus-btn {
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: #fff;
    box-shadow: 0 8px 18px rgba(255, 107, 53, 0.28);
}

.plus-btn:hover {
    transform: translateY(-2px);
}

.quantity-text {
    min-width: 22px;
    display: inline-block;
    font-weight: 800;
    font-size: 16px;
    color: var(--secondary);
}

.remove-btn {
    background: #FEF2F2;
    color: #DC2626;
    border: none;
    padding: 9px 16px;
    border-radius: 999px;
    cursor: pointer;
    font-weight: 800;
    font-family: inherit;
    font-size: 13px;
    transition: 0.25s;
}

.remove-btn:hover {
    background: #FEE2E2;
}

.grand-total-row td {
    font-size: 17px;
    font-weight: 800;
    background: #FFF7ED;
    color: var(--secondary);
    border-bottom: none;
}

.grand-total-row td:first-child {
    border-radius: 14px 0 0 14px;
}

.grand-total-row td:last-child {
    border-radius: 0 14px 14px 0;
    color: var(--primary);
}

.grand-total-label {
    text-align: right !important;
}

.cart-actions {
    margin-top: 26px;
    display: flex;
    justify-content: space-between;
    gap: 14px;
    flex-wrap: wrap;
}

.action-link {
    padding: 13px 22px;
    border-radius: 999px;
    font-weight: 800;
    text-align: center;
    transition: 0.3s;
}

.add-more-btn {
    background: #FFF7ED;
    color: var(--primary);
}

.checkout-btn {
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: white;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
}

.add-more-btn:hover,
.checkout-btn:hover {
    transform: translateY(-2px);
}

.empty-card {
    width: min(680px, 92%);
    margin: 60px auto;
    text-align: center;
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--soft-shadow);
    padding: 50px 30px;
}

.empty-card .avatar {
    width: 90px;
    height: 90px;
    margin: 0 auto 22px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--primary), var(--accent));
    color: white;
    display: grid;
    place-items: center;
    font-size: 40px;
    box-shadow: 0 14px 30px rgba(255, 107, 53, 0.28);
}

.empty-card h2 {
    color: var(--secondary);
    margin-bottom: 10px;
}

.empty-card p {
    color: var(--muted);
    margin-bottom: 22px;
}

.primary-btn {
    display: inline-block;
    padding: 13px 22px;
    border-radius: 999px;
    font-weight: 800;
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: white;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
    transition: 0.3s;
}

.primary-btn:hover {
    transform: translateY(-2px);
}

.footer {
    margin-top: 70px;
    background: var(--secondary);
    color: white;
    text-align: center;
    padding: 34px 6%;
}

.footer h3 {
    font-size: 28px;
    margin-bottom: 8px;
}

.footer h3 span {
    color: var(--primary);
}

.footer p {
    color: #CBD5E1;
    margin-top: 8px;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(34px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@media (max-width: 900px) {
    .navbar {
        flex-wrap: wrap;
        justify-content: center;
    }

    .nav-links {
        justify-content: center;
    }
}

@media (max-width: 700px) {
    .navbar {
        padding: 14px 4%;
    }

    .nav-links {
        gap: 13px;
        font-size: 14px;
    }

    .hero {
        padding: 30px 24px;
        border-radius: 22px;
    }

    .hero h1 {
        font-size: 32px;
    }

    .cart-card {
        padding: 18px;
    }

    .cart-table {
        font-size: 13px;
    }

    .cart-table th,
    .cart-table td {
        padding: 10px 6px;
    }

    .cart-actions {
        flex-direction: column;
    }

    .action-link {
        width: 100%;
    }
}
</style>
</head>

<body>

<header class="navbar">
    <a href="callRestaurantServlet" class="logo">
        🍔 Foodora<span>X</span>
    </a>

    <nav class="nav-links">
        <a href="callRestaurantServlet">Home</a>
        <a href="callRestaurantServlet">Restaurants</a>
        <a href="orderHistoryServlet">Orders</a>
        <a href="cart.jsp">Cart</a>
        <a href="profile" class="login-btn">Profile</a>
    </nav>
</header>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    Integer restaurantId = (Integer) session.getAttribute("restaurantId");

    double grandTotal = 0;

    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
%>

<section class="hero">
    <span>Your Order</span>
    <h1>My Cart</h1>
    <p>
        Review your items, adjust quantities and proceed to checkout when
        you're ready.
    </p>
</section>

<main class="cart-wrapper">

    <section class="cart-card">
        <h2>Cart Items</h2>

        <table class="cart-table">
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>

            <%
                for (CartItem item : cart.getItems().values()) {
                    grandTotal += item.getTotalPrice();
            %>

            <tr>
                <td><%= item.getName() %></td>

                <td>₹ <%= item.getPrice() %></td>

                <td>
                    <div class="quantity-box">

                        <form action="cartServlet" method="post" class="quantity-form">
                            <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">

                            <button type="submit" class="qty-btn minus-btn">-</button>
                        </form>

                        <span class="quantity-text"><%= item.getQuantity() %></span>

                        <form action="cartServlet" method="post" class="quantity-form">
                            <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">

                            <button type="submit" class="qty-btn plus-btn">+</button>
                        </form>

                    </div>
                </td>

                <td>₹ <%= item.getTotalPrice() %></td>

                <td>
                    <form action="cartServlet" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                        <input type="hidden" name="restaurantId" value="<%= restaurantId %>">

                        <button type="submit" class="remove-btn">Remove</button>
                    </form>
                </td>
            </tr>

            <%
                }
            %>

            <tr class="grand-total-row">
                <td colspan="3" class="grand-total-label">Grand Total</td>
                <td colspan="2">₹ <%= grandTotal %></td>
            </tr>

        </table>

        <div class="cart-actions">
            <a href="menu?restaurantId=<%= restaurantId %>" class="action-link add-more-btn">
                Add More Items
            </a>

            <a href="checkout.jsp" class="action-link checkout-btn">
                Proceed to Checkout
            </a>
        </div>
    </section>

</main>

<%
    } else {
%>

<section class="empty-card">
    <div class="avatar">🛒</div>
    <h2>Your Cart is Empty</h2>
    <p>Add some delicious food to get started!</p>

    <a href="callRestaurantServlet" class="primary-btn">
        Browse Restaurants
    </a>
</section>

<%
    }
%>

<footer class="footer">
    <h3>Foodora<span>X</span></h3>
    <p>Fresh • Fast • Delicious</p>
    <p>© 2026 FoodoraX. All Rights Reserved.</p>
</footer>

</body>
</html>
