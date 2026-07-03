<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.food.model.Restaurant, com.food.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("user");
    List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("allRestaurants");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="FoodoraX - Premium food delivery website for fast, fresh and delicious meals.">
<title>FoodoraX | Delicious Food Delivered Fast</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
  --primary: #ff6b35;
  --secondary: #1e293b;
  --accent: #ffc107;
  --bg: #f8fafc;
  --white: #ffffff;
  --text: #334155;
  --muted: #64748b;
  --shadow: 0 18px 45px rgba(15, 23, 42, 0.12);
  --radius: 18px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  font-family: "Poppins", sans-serif;
  background: var(--bg);
  color: var(--text);
}

a {
  text-decoration: none;
  color: inherit;
}

img {
  width: 100%;
  display: block;
}

.navbar {
  position: sticky;
  top: 0;
  z-index: 100;
  min-height: 78px;
  padding: 14px 6%;
  background: rgba(255, 255, 255, 0.92);
  backdrop-filter: blur(16px);
  display: flex;
  align-items: center;
  gap: 24px;
  box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
}

.logo {
  font-size: 26px;
  font-weight: 800;
  color: var(--secondary);
  white-space: nowrap;
}

.logo span,
.footer h2 span {
  color: var(--primary);
}

.logo-icon {
  color: var(--primary);
  margin-right: 6px;
}

.nav-search,
.hero-search,
.newsletter {
  display: flex;
  align-items: center;
  background: var(--white);
  border: 1px solid #e2e8f0;
  border-radius: 999px;
  padding: 10px 14px;
}

.nav-search {
  flex: 1;
  max-width: 430px;
}

.nav-search input,
.hero-search input,
.newsletter input {
  border: 0;
  outline: 0;
  background: transparent;
  width: 100%;
  font-family: inherit;
}

.nav-search i,
.hero-search i {
  color: var(--primary);
  margin-right: 10px;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 18px;
  font-weight: 600;
  flex-wrap: wrap;
}

.nav-links a {
  transition: 0.3s;
}

.nav-links a:hover {
  color: var(--primary);
}

.cart-link {
  position: relative;
  font-size: 20px;
}

.cart-badge {
  position: absolute;
  top: -10px;
  right: -12px;
  background: var(--accent);
  color: var(--secondary);
  font-size: 11px;
  width: 19px;
  height: 19px;
  display: grid;
  place-items: center;
  border-radius: 50%;
  font-weight: 800;
}

.login-btn,
.primary-btn,
.secondary-btn,
.order-btn,
.add-btn,
.hero-search button,
.offer-card a {
  border: 0;
  cursor: pointer;
  border-radius: 999px;
  font-family: inherit;
  font-weight: 700;
  transition: 0.3s;
}

.login-btn,
.primary-btn,
.order-btn,
.add-btn,
.hero-search button {
  background: linear-gradient(135deg, var(--primary), #ff8f3f);
  color: var(--white);
  box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
}

.login-btn {
  padding: 10px 20px;
}

.hero {
  min-height: calc(100vh - 78px);
  padding: 70px 6%;
  display: grid;
  grid-template-columns: 1.05fr 0.95fr;
  align-items: center;
  gap: 50px;
  overflow: hidden;
}

.hero-content {
  animation: slideLeft 0.8s ease both;
}

.hero-badge {
  display: inline-flex;
  gap: 8px;
  align-items: center;
  background: #fff7ed;
  color: var(--primary);
  padding: 10px 16px;
  border-radius: 999px;
  font-weight: 700;
  margin-bottom: 20px;
}

.hero h1 {
  font-size: clamp(40px, 6vw, 72px);
  line-height: 1.05;
  color: var(--secondary);
  margin-bottom: 20px;
}

.hero p {
  max-width: 620px;
  color: var(--muted);
  font-size: 18px;
  line-height: 1.8;
  margin-bottom: 28px;
}

.hero-search {
  max-width: 620px;
  padding: 8px 8px 8px 18px;
  box-shadow: var(--shadow);
  margin-bottom: 24px;
}

.hero-search button {
  padding: 13px 24px;
}

.hero-actions {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.primary-btn,
.secondary-btn {
  padding: 14px 26px;
  display: inline-block;
}

.primary-btn {
  animation: pulse 2s infinite;
}

.secondary-btn {
  background: var(--white);
  color: var(--secondary);
  border: 1px solid #e2e8f0;
}

.hero-image-wrap {
  position: relative;
  animation: fadeIn 1s ease both;
}

.hero-image {
  height: 520px;
  object-fit: cover;
  border-radius: 36px;
  box-shadow: var(--shadow);
  animation: floatFood 4s ease-in-out infinite;
}

.floating-icon,
.mini-card {
  position: absolute;
  background: rgba(255, 255, 255, 0.82);
  backdrop-filter: blur(14px);
  box-shadow: var(--shadow);
}

.floating-icon {
  width: 58px;
  height: 58px;
  border-radius: 18px;
  display: grid;
  place-items: center;
  color: var(--primary);
  font-size: 24px;
  animation: floatFood 3s ease-in-out infinite;
}

.icon-1 {
  top: 40px;
  left: -18px;
}

.icon-2 {
  right: -12px;
  bottom: 135px;
}

.mini-card {
  border-radius: 18px;
  padding: 14px 18px;
}

.mini-card strong {
  display: block;
  color: var(--secondary);
}

.mini-card span {
  color: var(--muted);
  font-size: 13px;
}

.mini-card-one {
  left: -30px;
  bottom: 70px;
}

.mini-card-two {
  right: 20px;
  top: 80px;
}

.section {
  padding: 70px 6%;
}

.section-heading {
  text-align: center;
  margin-bottom: 38px;
}

.section-heading span,
.app-section span {
  color: var(--primary);
  font-weight: 800;
}

.section-heading h2,
.app-section h2 {
  color: var(--secondary);
  font-size: clamp(28px, 4vw, 44px);
}

.category-grid,
.restaurant-grid,
.food-grid,
.features-grid,
.review-grid,
.offers {
  display: grid;
  gap: 24px;
}

.category-grid {
  grid-template-columns: repeat(7, 1fr);
}

.category-card {
  background: var(--white);
  border-radius: 24px;
  padding: 26px 12px;
  text-align: center;
  box-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
  transition: 0.3s;
}

.category-card i {
  width: 72px;
  height: 72px;
  display: grid;
  place-items: center;
  margin: 0 auto 14px;
  border-radius: 50%;
  background: #fff7ed;
  color: var(--primary);
  font-size: 28px;
  transition: 0.3s;
}

.category-card:hover,
.restaurant-card:hover,
.food-card:hover,
.feature-card:hover,
.review-card:hover {
  transform: translateY(-10px);
  box-shadow: var(--shadow);
}

.category-card:hover i {
  transform: scale(1.12);
  background: var(--primary);
  color: var(--white);
}

.restaurant-grid,
.food-grid {
  grid-template-columns: repeat(3, 1fr);
}

.restaurant-card,
.food-card,
.feature-card,
.review-card {
  background: var(--white);
  border-radius: var(--radius);
  overflow: hidden;
  box-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
  transition: 0.3s;
}

.image-box {
  position: relative;
  overflow: hidden;
  height: 230px;
}

.image-box img {
  height: 100%;
  object-fit: cover;
  transition: 0.4s;
}

.restaurant-card:hover img {
  transform: scale(1.08);
}

.offer-badge {
  position: absolute;
  top: 16px;
  left: 16px;
  z-index: 2;
  background: var(--accent);
  color: var(--secondary);
  padding: 7px 12px;
  border-radius: 999px;
  font-size: 13px;
  font-weight: 800;
}

.card-body {
  padding: 22px;
}

.card-body h3,
.food-card h3,
.feature-card h3 {
  color: var(--secondary);
}

.card-body p {
  color: var(--muted);
  margin: 8px 0 14px;
}

.meta,
.food-meta {
  display: flex;
  justify-content: space-between;
  color: var(--muted);
  margin-bottom: 18px;
}

.meta i,
.food-meta i {
  color: var(--accent);
}

.order-btn,
.add-btn {
  display: inline-block;
  padding: 11px 20px;
}

.order-btn:hover,
.add-btn:hover,
.primary-btn:hover,
.hero-search button:hover {
  box-shadow: 0 0 0 6px rgba(255, 107, 53, 0.14), 0 15px 30px rgba(255, 107, 53, 0.35);
  transform: translateY(-2px);
}

.offers {
  grid-template-columns: repeat(3, 1fr);
}

.offer-card {
  color: var(--white);
  padding: 34px;
  border-radius: 24px;
  min-height: 210px;
  box-shadow: var(--shadow);
}

.offer-card h3 {
  font-size: 34px;
}

.offer-card p {
  margin: 10px 0 24px;
}

.offer-card a {
  background: rgba(255, 255, 255, 0.22);
  color: var(--white);
  padding: 10px 18px;
  display: inline-block;
}

.orange {
  background: linear-gradient(135deg, #ff6b35, #ff9f1c);
}

.navy {
  background: linear-gradient(135deg, #1e293b, #334155);
}

.yellow {
  background: linear-gradient(135deg, #ffc107, #ff7a00);
}

.features-grid {
  grid-template-columns: repeat(4, 1fr);
}

.feature-card {
  padding: 30px;
  text-align: center;
}

.feature-card i {
  color: var(--primary);
  font-size: 34px;
  margin-bottom: 18px;
}

.feature-card p,
.review-card p,
.app-section p,
.footer p {
  color: var(--muted);
}

.review-grid {
  grid-template-columns: repeat(3, 1fr);
}

.review-card {
  padding: 28px;
}

.review-card p {
  line-height: 1.8;
  margin-bottom: 18px;
}

.review-card strong {
  color: var(--secondary);
}

.app-section {
  margin: 50px 6%;
  padding: 46px;
  border-radius: 28px;
  background: linear-gradient(135deg, #1e293b, #334155);
  color: var(--white);
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 24px;
}

.app-section h2 {
  color: var(--white);
}

.store-buttons {
  display: flex;
  gap: 14px;
  flex-wrap: wrap;
}

.store-buttons a {
  background: var(--white);
  color: var(--secondary);
  padding: 13px 20px;
  border-radius: 999px;
  font-weight: 700;
}

.empty-state {
  width: min(680px, 92%);
  margin: 0 auto;
  padding: 50px 30px;
  background: var(--white);
  border-radius: 22px;
  text-align: center;
  box-shadow: var(--shadow);
}

.empty-state h2 {
  color: var(--secondary);
  margin-bottom: 10px;
}

/* ===== FOOTER FIX =====
   Original footer used a fixed 4-column grid (2fr 1fr 1fr 1.4fr) with no
   wrapping rule for small/medium screens, which is why it looked broken
   ("not fitting"). It now collapses to 2 columns on tablets and 1 column
   on phones, and every column has a min-width so text/inputs don't get
   crushed. */
.footer {
  background: var(--secondary);
  color: var(--white);
  padding: 55px 6% 40px;
  display: grid;
  grid-template-columns: minmax(220px, 2fr) repeat(2, minmax(120px, 1fr)) minmax(220px, 1.4fr);
  gap: 36px;
}

.footer h2 {
  font-size: 30px;
}

.footer h3 {
  margin-bottom: 16px;
  font-size: 16px;
}

.footer a {
  display: block;
  color: #cbd5e1;
  margin-bottom: 10px;
  transition: 0.3s;
  word-break: break-word;
}

.footer a:hover {
  color: var(--primary);
}

.socials {
  display: flex;
  gap: 12px;
  margin-top: 18px;
  flex-wrap: wrap;
}

.socials a {
  width: 38px;
  height: 38px;
  display: grid;
  place-items: center;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 50%;
  margin-bottom: 0;
}

.newsletter {
  background: #334155;
  border-color: #475569;
  max-width: 280px;
}

.newsletter input {
  color: var(--white);
}

.newsletter button {
  border: 0;
  background: var(--primary);
  color: var(--white);
  width: 42px;
  height: 42px;
  border-radius: 50%;
  flex-shrink: 0;
}

.footer-bottom {
  grid-column: 1 / -1;
  border-top: 1px solid rgba(255, 255, 255, 0.12);
  margin-top: 30px;
  padding-top: 22px;
  text-align: center;
  color: #94a3b8;
  font-size: 13.5px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slideLeft {
  from {
    opacity: 0;
    transform: translateX(-45px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes floatFood {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-16px);
  }
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 rgba(255, 107, 53, 0.35);
  }
  70% {
    box-shadow: 0 0 0 14px rgba(255, 107, 53, 0);
  }
  100% {
    box-shadow: 0 0 0 0 rgba(255, 107, 53, 0);
  }
}

@media (max-width: 1100px) {
  .navbar {
    flex-wrap: wrap;
  }

  .nav-search {
    order: 3;
    max-width: 100%;
    flex-basis: 100%;
  }

  .hero,
  .restaurant-grid,
  .offers,
  .review-grid {
    grid-template-columns: 1fr 1fr;
  }

  .category-grid,
  .features-grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .footer {
    grid-template-columns: 1fr 1fr;
  }

  .newsletter {
    max-width: 100%;
  }
}

@media (max-width: 760px) {
  .navbar {
    padding: 14px 4%;
  }

  .nav-links {
    width: 100%;
    justify-content: center;
    flex-wrap: wrap;
    font-size: 14px;
  }

  .hero {
    grid-template-columns: 1fr;
    padding: 45px 4%;
  }

  .hero-search {
    flex-direction: column;
    align-items: stretch;
    border-radius: 22px;
    gap: 12px;
  }

  .hero-search button {
    width: 100%;
  }

  .hero-image {
    height: 360px;
    border-radius: 24px;
  }

  .restaurant-grid,
  .offers,
  .features-grid,
  .review-grid,
  .category-grid {
    grid-template-columns: 1fr;
  }

  .app-section {
    margin: 35px 4%;
    padding: 30px;
    flex-direction: column;
    align-items: flex-start;
  }

  .footer {
    grid-template-columns: 1fr;
  }

  .mini-card,
  .floating-icon {
    display: none;
  }
}
</style>
</head>

<body>

<header class="navbar">
  <a href="callRestaurantServlet" class="logo">
    <span class="logo-icon"><i class="fa-solid fa-burger"></i></span>
    Foodora<span>X</span>
  </a>

  <form class="nav-search" action="callRestaurantServlet" method="get">
    <i class="fa-solid fa-magnifying-glass"></i>
    <input type="search" name="search" placeholder="Search food or restaurants">
  </form>

  <nav class="nav-links">
    <a href="callRestaurantServlet">Home</a>
    <a href="#restaurants">Restaurants</a>
    <a href="orderHistoryServlet">Orders</a>
    <a href="cart.jsp" class="cart-link">
      <i class="fa-solid fa-cart-shopping"></i>
    </a>

    <% if (loggedUser != null) { %>
        <a href="profile" class="login-btn">Profile</a>
    <% } else { %>
        <a href="register.html">Register</a>
        <a href="login.html" class="login-btn">Login</a>
    <% } %>
  </nav>
</header>

<main>

<section class="hero">
  <div class="hero-content">
    <span class="hero-badge">
      <i class="fa-solid fa-bolt"></i>
      Fresh • Fast • Delicious
    </span>

    <h1>Delicious Food Delivered Fast</h1>

    <p>
      Discover premium restaurants near you and get your favorite meals
      delivered hot, fresh and right on time.
    </p>

    <form class="hero-search" action="callRestaurantServlet" method="get">
      <i class="fa-solid fa-location-dot"></i>
      <input type="text" name="search" placeholder="Search by restaurant or food">
      <button type="submit">Search</button>
    </form>

    <div class="hero-actions">
      <a href="#restaurants" class="primary-btn">Order Now</a>
      <a href="#restaurants" class="secondary-btn">Explore Restaurants</a>
    </div>
  </div>

  <div class="hero-image-wrap">
    <div class="floating-icon icon-1"><i class="fa-solid fa-motorcycle"></i></div>
    <div class="floating-icon icon-2"><i class="fa-solid fa-pizza-slice"></i></div>

    <img
      src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=900&q=80"
      alt="Fresh food bowl"
      class="hero-image"
    >

    <div class="mini-card mini-card-one">
      <strong>30 min</strong>
      <span>Fast delivery</span>
    </div>

    <div class="mini-card mini-card-two">
      <strong>4.9 ★</strong>
      <span>Top rated</span>
    </div>
  </div>
</section>

<section class="section">
  <div class="section-heading">
    <span>Categories</span>
    <h2>Explore Popular Cravings</h2>
  </div>

  <div class="category-grid">
    <div class="category-card"><i class="fa-solid fa-pizza-slice"></i><p>Pizza</p></div>
    <div class="category-card"><i class="fa-solid fa-burger"></i><p>Burger</p></div>
    <div class="category-card"><i class="fa-solid fa-bowl-rice"></i><p>Biryani</p></div>
    <div class="category-card"><i class="fa-solid fa-bowl-food"></i><p>Chinese</p></div>
    <div class="category-card"><i class="fa-solid fa-utensils"></i><p>South Indian</p></div>
    <div class="category-card"><i class="fa-solid fa-ice-cream"></i><p>Desserts</p></div>
    <div class="category-card"><i class="fa-solid fa-mug-hot"></i><p>Drinks</p></div>
  </div>
</section>

<section class="section" id="restaurants">
  <div class="section-heading">
    <span>Restaurants</span>
    <h2>Popular Restaurants Near You</h2>
  </div>

  <% if (allRestaurants != null && !allRestaurants.isEmpty()) { %>

  <div class="restaurant-grid">

    <% for (Restaurant restaurant : allRestaurants) { %>

    <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>&restaurantName=<%= restaurant.getName() %>">
        <article class="restaurant-card">
            <div class="image-box">
                <span class="offer-badge">Flat 50% OFF</span>
                <img src="<%= restaurant.getImagePath() %>" alt="<%= restaurant.getName() %>">
            </div>

            <div class="card-body">
                <h3><%= restaurant.getName() %></h3>
                <p><%= restaurant.getCuisineType() %> • <%= restaurant.getAddress() %></p>

                <div class="meta">
                    <span><i class="fa-solid fa-star"></i> <%= restaurant.getRating() %></span>
                    <span><i class="fa-solid fa-clock"></i> <%= restaurant.getDeliveryTime() %> mins</span>
                </div>

                <span class="order-btn">View Menu</span>
            </div>
        </article>
    </a>

    <% } %>

  </div>

  <% } else { %>

  <div class="empty-state">
    <h2>No Restaurants Available</h2>
    <p>Please check again later.</p>
  </div>

  <% } %>
</section>

<section class="section offers" id="offers">
  <div class="offer-card orange">
    <h3>50% OFF</h3>
    <p>On your first food order</p>
    <a href="#restaurants">Claim Offer</a>
  </div>

  <div class="offer-card navy">
    <h3>Free Delivery</h3>
    <p>On orders above ₹299</p>
    <a href="#restaurants">Order Now</a>
  </div>

  <div class="offer-card yellow">
    <h3>Combo Offers</h3>
    <p>Meals starting from ₹199</p>
    <a href="#restaurants">Explore</a>
  </div>
</section>

<section class="section">
  <div class="section-heading">
    <span>Why FoodoraX</span>
    <h2>Why Choose Us</h2>
  </div>

  <div class="features-grid">
    <div class="feature-card"><i class="fa-solid fa-truck-fast"></i><h3>Fast Delivery</h3><p>Hot food delivered quickly.</p></div>
    <div class="feature-card"><i class="fa-solid fa-leaf"></i><h3>Fresh Food</h3><p>Quality meals from trusted kitchens.</p></div>
    <div class="feature-card"><i class="fa-solid fa-shield-halved"></i><h3>Secure Payment</h3><p>Safe checkout every time.</p></div>
    <div class="feature-card"><i class="fa-solid fa-headset"></i><h3>24/7 Support</h3><p>Friendly support whenever needed.</p></div>
  </div>
</section>

<section class="section reviews">
  <div class="section-heading">
    <span>Reviews</span>
    <h2>Happy Customers</h2>
  </div>

  <div class="review-grid">
    <div class="review-card"><p>"Food arrived hot and super fast. The design feels premium and simple."</p><strong>Rahul Sharma</strong></div>
    <div class="review-card"><p>"Great offers and smooth ordering experience. My favorite delivery site."</p><strong>Ananya Rao</strong></div>
    <div class="review-card"><p>"Clean interface, reliable restaurants and very quick checkout."</p><strong>Priya Mehta</strong></div>
  </div>
</section>

<section class="app-section">
  <div>
    <span>Mobile App</span>
    <h2>Download the FoodoraX App</h2>
    <p>Order faster, track live, and unlock app-only offers.</p>
  </div>

  <div class="store-buttons">
    <a href="#"><i class="fa-brands fa-apple"></i> App Store</a>
    <a href="#"><i class="fa-brands fa-google-play"></i> Google Play</a>
  </div>
</section>

</main>

<footer class="footer">
  <div>
    <h2>Foodora<span>X</span></h2>
    <p>Fresh • Fast • Delicious</p>
    <div class="socials">
      <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
      <a href="#"><i class="fa-brands fa-instagram"></i></a>
      <a href="#"><i class="fa-brands fa-x-twitter"></i></a>
      <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
    </div>
  </div>

  <div>
    <h3>Company</h3>
    <a href="#">About</a>
    <a href="#">Careers</a>
    <a href="#">Contact</a>
  </div>

  <div>
    <h3>Legal</h3>
    <a href="#">Privacy</a>
    <a href="#">Terms</a>
    <a href="#">Refund Policy</a>
  </div>

  <div>
    <h3>Newsletter</h3>
    <form class="newsletter">
      <input type="email" placeholder="Your email">
      <button type="submit"><i class="fa-solid fa-paper-plane"></i></button>
    </form>
  </div>

  <div class="footer-bottom">
    © 2026 FoodoraX. All Rights Reserved.
  </div>
</footer>

</body>
</html>
