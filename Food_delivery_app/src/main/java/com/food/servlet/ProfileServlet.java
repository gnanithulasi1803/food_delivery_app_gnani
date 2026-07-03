package com.food.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        String email = (String) session.getAttribute("email");

        try {
            User user = new UserDAOImpl().getUserByUseremail(email);

            if (user == null) {
                resp.sendRedirect("login.html");
                return;
            }

            req.setAttribute("user", user);
            req.getRequestDispatcher("profile.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("login.html");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        String oldEmail = (String) session.getAttribute("email");

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        try {
            UserDAOImpl userDAO = new UserDAOImpl();
            User user = userDAO.getUserByUseremail(oldEmail);

            if (user == null) {
                resp.sendRedirect("login.html");
                return;
            }

            user.setUserName(userName);
            user.setEmail(email);
            user.setAddress(address);

            userDAO.updateUser(user);

            session.setAttribute("email", email);
            session.setAttribute("userName", userName);
            session.setAttribute("role", user.getRole());

            resp.sendRedirect("profile?updated=true");

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("profile?error=true");
        }
    }
}