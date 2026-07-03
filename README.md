# 🍔 Food Delivery Web Application

A full-stack **Food Delivery Web Application** developed using **Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, and Apache Tomcat** following the **MVC (Model-View-Controller)** architecture. The application allows users to register, log in, browse restaurants, view menus, add items to the cart, place orders, and view their order history.

---

## 🚀 Features

* 👤 User Registration & Login (BCrypt Password Encryption)
* 🏪 Restaurant Listing
* 🍽️ Dynamic Menu Display
* 🛒 Session-Based Shopping Cart
* ➕ Add, Update & Remove Cart Items
* 💳 Checkout with Payment Method Selection
* 📦 Place Order
* 📜 Order History
* 👤 User Profile
* 🗄️ MySQL Database Integration
* 🏗️ MVC Architecture

---

## 🛠️ Technologies Used

### Backend

* Java
* JSP
* Servlets
* JDBC

### Frontend

* HTML5
* CSS3
* JavaScript

### Database

* MySQL

### Server

* Apache Tomcat 10

### IDE

* Eclipse IDE

### Security

* BCrypt Password Hashing

---

## 📂 Project Structure

```text
FoodDeliveryApp/
│
├── src/
│   ├── com.food.model
│   ├── com.food.DAO
│   ├── com.food.DAOImpl
│   ├── com.food.servlet
│   └── com.food.utility
│
├── WebContent/
│   ├── images/
│   ├── css/
│   ├── js/
│   ├── restaurant.jsp
│   ├── menu.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── profile.jsp
│   ├── orderHistory.jsp
│   ├── login.html
│   └── register.html
│
└── Database/
    └── food_delivery.sql
```

---

## 🔄 Application Workflow

1. User Registration
2. User Login
3. Browse Restaurants
4. View Restaurant Menu
5. Add Items to Cart
6. Manage Cart
7. Checkout
8. Place Order
9. View Order History

---

## 🗃️ Database Tables

* User
* Restaurant
* Menu
* Cart (Session-Based)
* Order
* OrderItem

---

## 📌 MVC Architecture

### Model

* User
* Restaurant
* Menu
* Cart
* CartItem
* Order
* OrderItem

### View

* restaurant.jsp
* menu.jsp
* cart.jsp
* checkout.jsp
* profile.jsp
* orderHistory.jsp
* login.html
* register.html

### Controller

* RegisterServlet
* LoginServlet
* RestaurantServlet
* MenuServlet
* CartServlet
* OrderServlet
* ProfileServlet
* OrderHistoryServlet

---

## ⚙️ How to Run

1. Clone this repository.
2. Import the project into Eclipse IDE.
3. Configure Apache Tomcat 10.
4. Create the MySQL database and import the SQL file.
5. Update the database credentials in the DBConnection class.
6. Add the MySQL JDBC Driver to the project.
7. Run the project on Apache Tomcat.
8. Open the application in your browser.

---

## 🎯 Learning Outcomes

* Java Full Stack Development
* MVC Architecture
* JDBC Connectivity
* Session Management
* CRUD Operations
* Authentication & Authorization
* Password Encryption using BCrypt
* Dynamic JSP Pages
* Database Design
* Web Application Deployment on Apache Tomcat

---

## 🙏 Acknowledgements

Special thanks to **Mallikarjun V Vernekar** for the guidance, mentorship, and continuous support throughout the development of this project.

---

## 👩‍💻 Author

**Gnaneshwari**

Aspiring Java Full Stack Developer

---

⭐ If you found this project useful, don't forget to **Star** the repository!
