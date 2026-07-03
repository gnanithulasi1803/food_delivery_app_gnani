<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.food.model.User, com.food.model.Restaurant, com.food.model.Order" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodoraX | Admin Panel</title>

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
        linear-gradient(135deg, rgba(30, 41, 59, 0.94), rgba(255, 107, 53, 0.72)),
        url("https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1400&q=80");
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

.admin-wrap {
    width: min(1180px, 92%);
    margin: 0 auto 60px;
}

.stats {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 26px;
}

.stat-card {
    background: var(--white);
    border-radius: var(--radius);
    padding: 26px;
    box-shadow: var(--soft-shadow);
    animation: slideUp 0.7s ease both;
    display: flex;
    align-items: center;
    gap: 18px;
}

.stat-icon {
    width: 58px;
    height: 58px;
    flex-shrink: 0;
    border-radius: 16px;
    background: linear-gradient(135deg, var(--primary), var(--accent));
    display: grid;
    place-items: center;
    font-size: 26px;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
}

.stat-card h2 {
    margin: 0;
    color: var(--secondary);
    font-size: 32px;
    font-weight: 800;
}

.stat-card p {
    margin-top: 2px;
    color: var(--muted);
    font-weight: 700;
    font-size: 13.5px;
}

.panel {
    background: var(--white);
    border-radius: var(--radius);
    padding: 30px;
    margin-bottom: 26px;
    box-shadow: var(--soft-shadow);
    animation: slideUp 0.7s ease both;
}

.panel h2 {
    color: var(--secondary);
    font-size: 24px;
    margin-bottom: 6px;
}

.panel .panel-sub {
    color: var(--muted);
    font-size: 14px;
    margin-bottom: 16px;
}

.table-scroll {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 8px;
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
    padding: 15px;
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

.badge {
    background: #FFF7ED;
    color: var(--primary);
    padding: 6px 13px;
    border-radius: 999px;
    font-size: 12.5px;
    font-weight: 800;
    display: inline-block;
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

    .stats {
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

    .panel {
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
        🍔 Foodora<span>X</span> <span style="font-weight:600; font-size:15px; color:#64748B;">Admin</span>
    </a>

    <nav class="nav-links">
        <a href="callRestaurantServlet">Home</a>
        <a href="orderHistoryServlet">Orders</a>
        <a href="profile" class="login-btn">Profile</a>
    </nav>
</header>

<section class="hero">
    <span>Admin Panel</span>
    <h1>FoodoraX Dashboard</h1>
    <p>
        Monitor users, restaurants and orders across the platform at a glance.
    </p>
</section>

<main class="admin-wrap">

    <div class="stats">
        <div class="stat-card">
            <div class="stat-icon">👥</div>
            <div>
                <h2><%= users != null ? users.size() : 0 %></h2>
                <p>Total Users</p>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">🍽</div>
            <div>
                <h2><%= restaurants != null ? restaurants.size() : 0 %></h2>
                <p>Restaurants</p>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">🧾</div>
            <div>
                <h2><%= orders != null ? orders.size() : 0 %></h2>
                <p>Total Orders</p>
            </div>
        </div>
    </div>

    <section class="panel">
        <h2>Recent Orders</h2>
        <p class="panel-sub">Latest orders placed across all restaurants</p>

        <div class="table-scroll">
        <table>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Restaurant ID</th>
                <th>Payment</th>
                <th>Total</th>
                <th>Status</th>
            </tr>

            <%
                if (orders != null) {
                    for (Order order : orders) {
            %>
            <tr>
                <td>#<%= order.getOrderId() %></td>
                <td><%= order.getUserId() %></td>
                <td><%= order.getRestaurantId() %></td>
                <td><%= order.getPaymentMethod() %></td>
                <td>Rs. <%= order.getTotalAmount() %></td>
                <td><span class="badge"><%= order.getStatus() %></span></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        </div>
    </section>

    <section class="panel">
        <h2>Restaurants</h2>
        <p class="panel-sub">All restaurants currently on the platform</p>

        <div class="table-scroll">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Cuisine</th>
                <th>Rating</th>
                <th>Delivery</th>
            </tr>

            <%
                if (restaurants != null) {
                    for (Restaurant restaurant : restaurants) {
            %>
            <tr>
                <td>#<%= restaurant.getRestaurantId() %></td>
                <td><%= restaurant.getName() %></td>
                <td><%= restaurant.getCuisineType() %></td>
                <td><%= restaurant.getRating() %></td>
                <td><%= restaurant.getDeliveryTime() %> mins</td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        </div>
    </section>

</main>

<footer class="footer">
    <h3>Foodora<span>X</span></h3>
    <p>Fresh • Fast • Delicious</p>
    <p>© 2026 FoodoraX. All Rights Reserved.</p>
</footer>

</body>
</html>
