<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User" %>

<%
    // IMPORTANT: This page must be reached via the "profile" servlet
    // (e.g. <a href="profile">Profile</a>), which does:
    //     User user = userDao.getUserById(loggedInId); // fetch fresh from DB
    //     request.setAttribute("user", user);
    //     request.getRequestDispatcher("profile.jsp").forward(request, response);
    //
    // Because it's a FORWARD (not sendRedirect), request.getAttribute("user")
    // survives here. If someone lands on profile.jsp directly, user will be
    // null and we bounce them back to the servlet, which will re-populate it.

    User user = (User) request.getAttribute("user");

    if (user == null) {
        response.sendRedirect("profile");
        return;
    }

    String updated = request.getParameter("updated");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodoraX | Profile</title>

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
        url("https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=1400&q=80");
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

.profile-wrapper {
    width: min(1180px, 92%);
    margin: 0 auto 60px;
    display: grid;
    grid-template-columns: 360px 1fr;
    gap: 26px;
}

.profile-card,
.details-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--soft-shadow);
    padding: 30px;
    animation: slideUp 0.7s ease both;
}

.profile-card {
    text-align: center;
    align-self: start;
}

.avatar {
    width: 116px;
    height: 116px;
    margin: 0 auto 18px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--primary), var(--accent));
    color: white;
    display: grid;
    place-items: center;
    font-size: 46px;
    font-weight: 800;
    box-shadow: 0 14px 30px rgba(255, 107, 53, 0.28);
}

.profile-card h2 {
    color: var(--secondary);
    font-size: 26px;
    margin-bottom: 8px;
}

.profile-card p {
    color: var(--muted);
    margin-bottom: 18px;
    word-break: break-word;
}

.role-badge {
    display: inline-block;
    background: #FFF7ED;
    color: var(--primary);
    padding: 8px 14px;
    border-radius: 999px;
    font-weight: 800;
    font-size: 13px;
}

.details-card h2 {
    color: var(--secondary);
    margin-bottom: 22px;
    font-size: 28px;
}

.success-msg {
    background: #ECFDF5;
    color: #15803D;
    border: 1px solid #BBF7D0;
    padding: 13px 16px;
    border-radius: 14px;
    margin-bottom: 20px;
    font-weight: 700;
    font-size: 14px;
}

.detail-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 18px;
}

.form-group.full {
    grid-column: 1 / 3;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.detail-label {
    color: var(--muted);
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 8px;
}

.detail-box {
    padding: 18px;
    border-radius: 18px;
    background: #F8FAFC;
    border: 1px solid #E2E8F0;
    transition: 0.3s;
}

.detail-box:hover {
    box-shadow: var(--soft-shadow);
}

.detail-value {
    color: var(--secondary);
    font-size: 16px;
    font-weight: 700;
    word-break: break-word;
}

input.field,
textarea.field {
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

input.field:focus,
textarea.field:focus {
    border-color: var(--primary);
    background: white;
    box-shadow: 0 0 0 4px rgba(255, 107, 53, 0.12);
}

input.field[readonly] {
    color: var(--muted);
    background: #F1F5F9;
    cursor: not-allowed;
}

textarea.field {
    resize: vertical;
    min-height: 90px;
}

.action-row {
    display: flex;
    gap: 14px;
    flex-wrap: wrap;
    margin-top: 26px;
}

.primary-btn,
.secondary-btn {
    display: inline-block;
    padding: 13px 22px;
    border: none;
    border-radius: 999px;
    font-weight: 800;
    font-family: inherit;
    font-size: 15px;
    cursor: pointer;
    transition: 0.3s;
}

.primary-btn {
    background: linear-gradient(135deg, var(--primary), #FF8F3F);
    color: white;
    box-shadow: 0 12px 25px rgba(255, 107, 53, 0.28);
}

.secondary-btn {
    background: #FFF7ED;
    color: var(--primary);
}

.primary-btn:hover,
.secondary-btn:hover {
    transform: translateY(-2px);
}

.empty-card {
    width: min(680px, 92%);
    margin: 60px auto;
    text-align: center;
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--soft-shadow);
    padding: 40px;
}

.empty-card h2 {
    color: var(--secondary);
    margin-bottom: 10px;
}

.empty-card p {
    color: var(--muted);
    margin-bottom: 22px;
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

    .profile-wrapper {
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
        font-size: 34px;
    }

    .detail-grid {
        grid-template-columns: 1fr;
    }

    .form-group.full {
        grid-column: auto;
    }

    .profile-card,
    .details-card {
        padding: 24px;
    }

    .action-row a,
    .action-row button {
        width: 100%;
        text-align: center;
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

        <% if (user != null && "SUPERADMIN".equalsIgnoreCase(user.getRole())) { %>
            <a href="admin">Admin</a>
        <% } %>
    </nav>
</header>

<% if (user != null) { %>

<section class="hero">
    <span>My Account</span>
    <h1>Welcome, <%= user.getUserName() %></h1>
    <p>
        Manage your FoodoraX account details, track your orders and continue
        ordering your favorite meals.
    </p>
</section>

<main class="profile-wrapper">

    <section class="profile-card">
        <div class="avatar">
            <%= user.getUserName().substring(0, 1).toUpperCase() %>
        </div>

        <h2><%= user.getUserName() %></h2>
        <p><%= user.getEmail() %></p>

        <span class="role-badge">
            <%= user.getRole() %>
        </span>
    </section>

    <section class="details-card">
        <h2>Profile Details</h2>

        <% if ("true".equals(updated)) { %>
            <div class="success-msg">✔ Profile updated successfully.</div>
        <% } %>

        <!-- Posts back to the "profile" servlet, which should update the DB
             then redirect to profile?updated=true (redirect-after-post) -->
        <form action="profile" method="post">

            <div class="detail-grid">

                <div class="form-group">
                    <label class="detail-label">User ID</label>
                    <input class="field" type="text" value="<%= user.getUserId() %>" readonly>
                </div>

                <div class="form-group">
                    <label class="detail-label">Role</label>
                    <input class="field" type="text" value="<%= user.getRole() %>" readonly>
                </div>

                <div class="form-group">
                    <label class="detail-label">Full Name</label>
                    <input class="field" type="text" name="userName" value="<%= user.getUserName() %>" required>
                </div>

                <div class="form-group">
                    <label class="detail-label">Email Address</label>
                    <input class="field" type="email" name="email" value="<%= user.getEmail() %>" required>
                </div>

                <div class="form-group full">
                    <label class="detail-label">Address</label>
                    <textarea class="field" name="address" required><%= user.getAddress() %></textarea>
                </div>

                <div class="form-group">
                    <label class="detail-label">Last Login</label>
                    <input class="field" type="text" value="<%= user.getLastLoginDate() %>" readonly>
                </div>

            </div>

            <div class="action-row">
                <button type="submit" class="primary-btn">Update Profile</button>
                <a href="callRestaurantServlet" class="secondary-btn">Browse Restaurants</a>
                <a href="orderHistoryServlet" class="secondary-btn">View Orders</a>
            </div>

        </form>
    </section>

</main>

<% } else { %>

<section class="empty-card">
    <h2>No Profile Found</h2>
    <p>Please login to view your FoodoraX profile.</p>
    <a href="login.html" class="primary-btn">Login Now</a>
</section>

<% } %>

<footer class="footer">
    <h3>Foodora<span>X</span></h3>
    <p>Fresh • Fast • Delicious</p>
    <p>© 2026 FoodoraX. All Rights Reserved.</p>
</footer>

</body>
</html>
