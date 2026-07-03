package com.food.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.food.DAOImpl.OrderDAOImpl;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {

    private static final double DELIVERY_FEE = 40;
    private static final double PLATFORM_FEE = 5;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        String email = (String) session.getAttribute("email");

        if (email == null) {
            resp.sendRedirect("login.html");
            return;
        }

        UserDAOImpl userDAO = new UserDAOImpl();
        User user = null;

        try {
            user = userDAO.getUserByUseremail(email);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (user == null) {
            resp.sendRedirect("login.html");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        if (restaurantId == null) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        String paymentMethod = req.getParameter("paymentMode");

        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            paymentMethod = "CASH";
        }

        double itemTotal = 0;

        for (CartItem item : cart.getItems().values()) {
            itemTotal += item.getTotalPrice();
        }

        double totalAmount = itemTotal + DELIVERY_FEE + PLATFORM_FEE;

        Order order = new Order(
                user.getUserId(),
                totalAmount,
                "PENDING",
                paymentMethod,
                restaurantId
        );

        OrderDAOImpl orderDAO = new OrderDAOImpl();
        int orderId = orderDAO.addOrder(order);
        
        

        if (orderId > 0) {
            OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();

            for (CartItem cartItem : cart.getItems().values()) {
                OrderItem orderItem = new OrderItem(
                        orderId,
                        cartItem.getQuantity(),
                        cartItem.getTotalPrice(),
                        cartItem.getMenuId()
                );

                orderItemDAO.addOrderItem(orderItem);
            }

            session.removeAttribute("cart");
            session.removeAttribute("restaurantId");

            resp.sendRedirect("orderHistoryServlet?success=true");
            
            
            System.out.println("Order inserted: " + orderId);

            System.out.println("OrderItemDAOImpl created successfully");
        } else {
            resp.sendRedirect("checkout.jsp?error=true");
        }
    }
}