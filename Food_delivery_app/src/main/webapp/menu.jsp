<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "com.food.model.Menu, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodoraX | Menu</title>

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
    --success: #16A34A;
    --danger: #EF4444;
    --shadow: 0 18px 45px rgba(15, 23, 42, 0.12);
    --soft-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
    --radius: 18px;
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

.logo-icon {
    color: var(--primary);
    margin-right: 6px;
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
    margin: 42px auto 20px;
    padding: 44px;
    border-radius: 30px;
    background:
        linear-gradient(135deg, rgba(30, 41, 59, 0.92), rgba(255, 107, 53, 0.78)),
        url("https://images.unsplash.com/photo-1559847844-5315695dadae?auto=format&fit=crop&w=1400&q=80");
    background-size: cover;
    background-position: center;
    color: white;
    box-shadow: var(--shadow);
    animation: fadeIn 0.8s ease both;
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

.page-header {
    width: min(1180px, 92%);
    margin: 54px auto 28px;
    text-align: center;
    animation: slideUp 0.8s ease both;
}

.page-header span {
    color: var(--primary);
    font-weight: 800;
}

.page-header h2 {
    color: var(--secondary);
    font-size: clamp(31px, 4vw, 46px);
    margin-top: 5px;
}

.page-header p {
    color: var(--muted);
    margin-top: 8px;
}

.menu-grid {
    width: min(1180px, 92%);
    margin: 0 auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 26px;
}

.menu-card {
    background: var(--white);
    border-radius: var(--radius);
    overflow: hidden;
    box-shadow: var(--soft-shadow);
    transition: 0.3s;
    animation: slideUp 0.8s ease both;
    position: relative;
}

.menu-card:hover {
    transform: translateY(-10px);
    box-shadow: var(--shadow);
}

.image-box {
    height: 220px;
    overflow: hidden;
    position: relative;
}

.image-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: 0.45s;
}

.menu-card:hover .image-box img {
    transform: scale(1.08);
}

.favorite {
    position: absolute;
    top: 16px;
    right: 16px;
    width: 42px;
    height: 42px;
    display: grid;
    place-items: center;
    border-radius: 50%;
    background: white;
    color: var(--primary);
    font-size: 20px;
    box-shadow: 0 10px 24px rgba(15, 23, 42, 0.16);
}

.food-badge {
    position: absolute;
    top: 16px;
    left: 16px;
    z-index: 2;
    background: var(--accent);
    color: var(--secondary);
    padding: 7px 13px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
}

.menu-content {
    padding: 22px;
}

.menu-content h3 {
    color: var(--secondary);
    font-size: 22px;
    margin-bottom: 9px;
}

.description {
    color: var(--muted);
    min-height: 54px;
    line-height: 1.7;
    margin-bottom: 16px;
}

.menu-meta {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 14px;
    margin-bottom: 18px;
}

.price {
    color: var(--primary);
    font-size: 23px;
    font-weight: 800;
}

.available {
    background: #DCFCE7;
    color: var(--success);
    padding: 7px 12px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
}

.add-btn {
    width: 100%;
    border: none;
    cursor: pointer;
    border-radius: 999px;
    padding: 13px 20px;
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: white;
    font-family: inherit;
    font-size: 15px;
    font-weight: 800;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.24);
    transition: 0.3s;
}

.add-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 0 0 6px rgba(255, 107, 53, 0.14),
                0 15px 30px rgba(255, 107, 53, 0.35);
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

@keyframes fadeIn {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
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

@media (max-width: 1050px) {
    .navbar {
        flex-wrap: wrap;
        justify-content: center;
    }

    .menu-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 680px) {
    .navbar {
        padding: 14px 4%;
    }

    .nav-links {
        justify-content: center;
        gap: 13px;
        font-size: 14px;
    }

    .hero {
        width: 92%;
        padding: 30px 24px;
        border-radius: 22px;
    }

    .hero h1 {
        font-size: 36px;
    }

    .menu-grid {
        grid-template-columns: 1fr;
    }

    .image-box {
        height: 210px;
    }
}
</style>
</head>

<body>

<header class="navbar">
    <a href="callRestaurantServlet" class="logo">
        <span class="logo-icon">🍔</span>Foodora<span>X</span>
    </a>

    <nav class="nav-links">
        <a href="callRestaurantServlet">Home</a>
        <a href="callRestaurantServlet">Restaurants</a>
        <a href="cart.jsp">Cart</a>
        <a href="profile">Profile</a>
        <a href="login.html" class="login-btn">Login</a>
    </nav>
</header>

<section class="hero">
    <span>Chef Selected • Freshly Prepared</span>
    <h1>Our Special Menu</h1>
    <p>
        Pick your favorites from this restaurant and add them to your cart in one click.
        Fresh meals, premium taste and fast delivery with FoodoraX.
    </p>
</section>

<section class="page-header">
    <span>Best Selling Food</span>
    <h2>Explore Delicious Items</h2>
    <p>Choose from freshly prepared dishes and order instantly.</p>
</section>

<section class="menu-grid">
    
    <%
    	List <Menu> allMenusByRestaurant=(List<Menu>)request.getAttribute("allMenusByRestaurant");
    
    	for(Menu menu : allMenusByRestaurant){
     %>

    <article class="menu-card">

        <div class="image-box">
            <span class="food-badge">Popular</span>
            <span class="favorite">♡</span>

           <img src="<%= menu.getImagePath() %>"
     alt="<%= menu.getItemName() %>">
        </div>

        <div class="menu-content">

            <h3><%= menu.getItemName() %></h3>

            <p class="description">
                <%= menu.getDescription() %>
            </p>

            <div class="menu-meta">
                <p class="price">
                   ₹ <%= menu.getPrice() %>
                </p>

                
            </div>

            <form action="cartServlet" method="post">
                <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
                <input type="hidden" name="quantity" value="1">
                <input type="hidden" name="action" value="add">
                	
                <button class="add-btn">
                    Add to Cart
                </button>
            </form>

        </div>

    </article>

    <%
    	}
    %>

</section>

<footer class="footer">
    <h3>Foodora<span>X</span></h3>
    <p>© 2026 FoodoraX | Fresh Food Delivered Fast</p>
</footer>

</body>
</html>