package com.food.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.food.DAOImpl.OrderDAOImpl;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.Order;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
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

        OrderDAOImpl orderDAO = new OrderDAOImpl();
        List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());

        req.setAttribute("user", user);
        req.setAttribute("orders", orders);

        req.getRequestDispatcher("orderHistory.jsp").forward(req, resp);
    }
}