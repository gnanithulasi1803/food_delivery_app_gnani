package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.Order;
import com.food.model.Restaurant;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equalsIgnoreCase("SUPERADMIN")) {
            resp.sendRedirect("callRestaurantServlet");
            return;
        }

        List<User> users = new UserDAOImpl().getAllUsers();
        List<Restaurant> restaurants = new RestaurantDAOImpl().getAllRestaurants();
        List<Order> orders = new OrderDAOImpl().getAllOrders();

        req.setAttribute("users", users);
        req.setAttribute("restaurants", restaurants);
        req.setAttribute("orders", orders);

        req.getRequestDispatcher("admin.jsp").forward(req, resp);
    }
}