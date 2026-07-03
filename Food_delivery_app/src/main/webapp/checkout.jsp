<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart, com.food.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodoraX | Checkout</title>

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
        url("https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?auto=format&fit=crop&w=1400&q=80");
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

.checkout-wrapper {
    width: min(1180px, 92%);
    margin: 0 auto 60px;
}

.checkout-layout {
    display: grid;
    grid-template-columns: 1.4fr 0.9fr;
    gap: 26px;
    align-items: start;
}

.checkout-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--soft-shadow);
    padding: 30px;
    animation: slideUp 0.7s ease both;
}

.section-title {
    margin: 0 0 22px;
    color: var(--secondary);
    font-size: 24px;
    padding-bottom: 14px;
    border-bottom: 1px solid #E2E8F0;
}

.section-title.spaced {
    margin-top: 32px;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: var(--secondary);
    font-weight: 700;
    font-size: 13.5px;
}

.form-control {
    width: 100%;
    padding: 13px 14px;
    border: 1px solid #E2E8F0;
    border-radius: 14px;
    font-family: inherit;
    font-size: 15px;
    font-weight: 600;
    color: var(--secondary);
    background: #F8FAFC;
    outline: none;
    transition: 0.25s;
}

.form-control:focus {
    border-color: var(--primary);
    background: white;
    box-shadow: 0 0 0 4px rgba(255, 107, 53, 0.12);
}

textarea.form-control {
    min-height: 90px;
    resize: vertical;
}

.two-column {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
}

.payment-options {
    display: grid;
    gap: 12px;
    margin-top: 4px;
}

.payment-option {
    border: 1px solid #E2E8F0;
    border-radius: 16px;
    padding: 14px 16px;
    display: flex;
    align-items: center;
    gap: 12px;
    cursor: pointer;
    background: #F8FAFC;
    font-weight: 700;
    font-size: 14.5px;
    color: var(--secondary);
    transition: 0.25s;
}

.payment-option:hover {
    border-color: var(--primary);
    background: #FFF7ED;
}

.payment-option input {
    accent-color: var(--primary);
    width: 17px;
    height: 17px;
    cursor: pointer;
}

.summary-item {
    display: grid;
    grid-template-columns: 1fr auto auto;
    gap: 12px;
    align-items: center;
    padding: 14px 0;
    border-bottom: 1px solid #E2E8F0;
}

.item-name {
    font-weight: 700;
    color: var(--secondary);
}

.item-qty {
    background: #F1F5F9;
    color: var(--muted);
    padding: 5px 11px;
    border-radius: 999px;
    font-size: 12.5px;
    font-weight: 700;
    white-space: nowrap;
}

.item-total {
    font-weight: 800;
    color: var(--secondary);
    white-space: nowrap;
}

.bill-row {
    display: flex;
    justify-content: space-between;
    margin: 13px 0;
    color: var(--muted);
    font-size: 14.5px;
    font-weight: 600;
}

.bill-row.total {
    border-top: 1px dashed #E2E8F0;
    padding-top: 18px;
    margin-top: 18px;
    font-size: 21px;
    font-weight: 800;
    color: var(--secondary);
}

.bill-row.total span:last-child {
    color: var(--primary);
}

.place-order-btn {
    width: 100%;
    margin-top: 24px;
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: #fff;
    border: none;
    padding: 15px 18px;
    border-radius: 999px;
    font-family: inherit;
    font-size: 16px;
    font-weight: 800;
    cursor: pointer;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
    transition: 0.3s;
}

.place-order-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 0 0 6px rgba(255, 107, 53, 0.14),
                0 15px 30px rgba(255, 107, 53, 0.35);
}

.back-cart {
    display: block;
    text-align: center;
    margin-top: 16px;
    color: var(--primary);
    font-weight: 700;
    font-size: 14.5px;
}

.back-cart:hover {
    text-decoration: underline;
}

.empty-card {
    width: min(680px, 92%);
    margin: 0 auto;
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

    .checkout-layout {
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

    .two-column {
        grid-template-columns: 1fr;
    }

    .checkout-card {
        padding: 22px;
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
    double deliveryFee = 40;
    double platformFee = 5;

    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {

        for (CartItem item : cart.getItems().values()) {
            grandTotal += item.getTotalPrice();
        }

        double finalAmount = grandTotal + deliveryFee + platformFee;
%>

<section class="hero">
    <span>Almost There</span>
    <h1>Checkout</h1>
    <p>
        Confirm your delivery details and payment method, then place your
        order.
    </p>
</section>

<main class="checkout-wrapper">

    <div class="checkout-layout">

        <section class="checkout-card">
            <h2 class="section-title">Delivery Details</h2>

            <form action="orderServlet" method="post">

                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="totalAmount" value="<%= finalAmount %>">

                <div class="form-group">
                    <label for="customerName">Full Name</label>
                    <input type="text"
                           id="customerName"
                           name="customerName"
                           class="form-control"
                           placeholder="Enter your full name"
                           required>
                </div>

                <div class="two-column">
                    <div class="form-group">
                        <label for="phone">Mobile Number</label>
                        <input type="tel"
                               id="phone"
                               name="phone"
                               class="form-control"
                               placeholder="10-digit mobile number"
                               pattern="[0-9]{10}"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="pincode">Pincode</label>
                        <input type="text"
                               id="pincode"
                               name="pincode"
                               class="form-control"
                               placeholder="Area pincode"
                               pattern="[0-9]{6}"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Delivery Address</label>
                    <textarea id="address"
                              name="address"
                              class="form-control"
                              placeholder="House no, street, area, city"
                              required></textarea>
                </div>

                <div class="form-group">
                    <label for="landmark">Landmark</label>
                    <input type="text"
                           id="landmark"
                           name="landmark"
                           class="form-control"
                           placeholder="Nearby landmark">
                </div>

                <h2 class="section-title spaced">Payment Method</h2>

                <div class="payment-options">
                    <label class="payment-option">
                        <input type="radio" name="paymentMode" value="CASH" checked>
                        Cash on Delivery
                    </label>

                    <label class="payment-option">
                        <input type="radio" name="paymentMode" value="UPI">
                        UPI Payment
                    </label>

                    <label class="payment-option">
                        <input type="radio" name="paymentMode" value="CARD">
                        Debit / Credit Card
                    </label>

                    <label class="payment-option">
                        <input type="radio" name="paymentMode" value="NET_BANKING">
                        Net Banking
                    </label>
                </div>

                <button type="submit" class="place-order-btn">
                    Place Order
                </button>

            </form>
        </section>

        <section class="checkout-card">
            <h2 class="section-title">Order Summary</h2>

            <%
                for (CartItem item : cart.getItems().values()) {
            %>

            <div class="summary-item">
                <div class="item-name"><%= item.getName() %></div>
                <div class="item-qty">Qty: <%= item.getQuantity() %></div>
                <div class="item-total">₹ <%= item.getTotalPrice() %></div>
            </div>

            <%
                }
            %>

            <div style="margin-top:18px;">
                <div class="bill-row">
                    <span>Item Total</span>
                    <span>₹ <%= grandTotal %></span>
                </div>

                <div class="bill-row">
                    <span>Delivery Fee</span>
                    <span>₹ <%= deliveryFee %></span>
                </div>

                <div class="bill-row">
                    <span>Platform Fee</span>
                    <span>₹ <%= platformFee %></span>
                </div>

                <div class="bill-row total">
                    <span>To Pay</span>
                    <span>₹ <%= finalAmount %></span>
                </div>
            </div>

            <a href="cart.jsp" class="back-cart">← Back to Cart</a>
        </section>

    </div>

</main>

<%
    } else {
%>

<section class="empty-card">
    <div class="avatar">🧾</div>
    <h2>Your Cart is Empty</h2>
    <p>Please add food items before checkout.</p>

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
