<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.food.model.Order, com.food.model.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodoraX | Order History</title>

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
        url("https://images.unsplash.com/photo-1526367790999-0150786686a2?auto=format&fit=crop&w=1400&q=80");
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

.container {
    width: min(1180px, 92%);
    margin: 0 auto 60px;
}

.success-msg {
    background: #ECFDF5;
    color: #15803D;
    border: 1px solid #BBF7D0;
    padding: 14px 18px;
    border-radius: 16px;
    margin-bottom: 22px;
    font-weight: 700;
    font-size: 14.5px;
}

.user-card,
.orders-card,
.empty-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--soft-shadow);
    padding: 30px;
    margin-bottom: 26px;
    animation: slideUp 0.7s ease both;
}

.user-card h2,
.orders-card h2 {
    margin: 0 0 20px;
    font-size: 24px;
    color: var(--secondary);
}

.user-details {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
}

.detail-box {
    background: #F8FAFC;
    border: 1px solid #E2E8F0;
    padding: 16px;
    border-radius: 16px;
    transition: 0.3s;
}

.detail-box:hover {
    box-shadow: var(--soft-shadow);
}

.detail-label {
    color: var(--muted);
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 6px;
}

.detail-value {
    font-weight: 700;
    color: var(--secondary);
    font-size: 15.5px;
    word-break: break-word;
}

.orders-card {
    padding: 30px;
}

.table-scroll {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #FFF7ED;
    color: var(--primary);
    padding: 15px;
    text-align: left;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.4px;
    white-space: nowrap;
}

th:first-child {
    border-radius: 14px 0 0 14px;
    padding-left: 18px;
}

th:last-child {
    border-radius: 0 14px 14px 0;
}

td {
    padding: 16px 15px;
    border-bottom: 1px solid #E2E8F0;
    font-weight: 600;
    color: var(--text);
}

td:first-child {
    padding-left: 18px;
    color: var(--secondary);
    font-weight: 700;
}

tr:hover td {
    background: #F8FAFC;
}

.status {
    padding: 7px 14px;
    border-radius: 999px;
    font-size: 12.5px;
    font-weight: 800;
    display: inline-block;
}

.status-pending {
    background: #FEF9C3;
    color: #854D0E;
}

.status-delivered {
    background: #DCFCE7;
    color: #15803D;
}

.status-cancelled {
    background: #FEE2E2;
    color: #B91C1C;
}

.empty-card {
    text-align: center;
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

    .user-details {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 620px) {
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

    .user-card,
    .orders-card,
    .empty-card {
        padding: 20px;
    }

    table {
        font-size: 13.5px;
    }

    th,
    td {
        padding: 10px;
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
    User user = (User) request.getAttribute("user");
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    String success = request.getParameter("success");
%>

<section class="hero">
    <span>Your Orders</span>
    <h1>Order History</h1>
    <p>
        Track all your previous and current food orders in one place.
    </p>
</section>

<main class="container">

<% if ("true".equals(success)) { %>
    <div class="success-msg">✔ Your order has been placed successfully.</div>
<% } %>

    <section class="user-card">
        <h2>User Details</h2>

        <div class="user-details">
            <div class="detail-box">
                <div class="detail-label">User ID</div>
                <div class="detail-value"><%= user.getUserId() %></div>
            </div>

            <div class="detail-box">
                <div class="detail-label">Name</div>
                <div class="detail-value"><%= user.getUserName() %></div>
            </div>

            <div class="detail-box">
                <div class="detail-label">Email</div>
                <div class="detail-value"><%= user.getEmail() %></div>
            </div>
        </div>
    </section>

<% if (orders != null && !orders.isEmpty()) { %>

    <section class="orders-card">
        <h2>Your Orders</h2>

        <div class="table-scroll">
        <table>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Restaurant ID</th>
                <th>Payment</th>
                <th>Total</th>
                <th>Status</th>
            </tr>

            <%
                for (Order order : orders) {
                    String statusClass = "status-pending";

                    if ("Delivered".equalsIgnoreCase(order.getStatus())) {
                        statusClass = "status-delivered";
                    } else if ("Cancelled".equalsIgnoreCase(order.getStatus())) {
                        statusClass = "status-cancelled";
                    }
            %>

            <tr>
                <td>#<%= order.getOrderId() %></td>
                <td><%= order.getOrderDate() %></td>
                <td><%= order.getRestaurantId() %></td>
                <td><%= order.getPaymentMethod() %></td>
                <td>₹ <%= order.getTotalAmount() %></td>
                <td>
                    <span class="status <%= statusClass %>">
                        <%= order.getStatus() %>
                    </span>
                </td>
            </tr>

            <%
                }
            %>
        </table>
        </div>
    </section>

<% } else { %>

    <section class="empty-card">
        <div class="avatar">📦</div>
        <h2>No Orders Yet</h2>
        <p>You have not placed any orders.</p>

        <a href="callRestaurantServlet" class="primary-btn">
            Browse Restaurants
        </a>
    </section>

<% } %>

</main>

<footer class="footer">
    <h3>Foodora<span>X</span></h3>
    <p>Fresh • Fast • Delicious</p>
    <p>© 2026 FoodoraX. All Rights Reserved.</p>
</footer>

</body>
</html>
