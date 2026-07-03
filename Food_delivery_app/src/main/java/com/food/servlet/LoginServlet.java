package com.food.servlet;

import java.io.IOException;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callLoginServlet")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String email = req.getParameter("email");
	    String password = req.getParameter("password");

	    HttpSession session = req.getSession();
	    UserDAOImpl userDAOImpl = new UserDAOImpl();

	    try {
	        User user = userDAOImpl.getUserByUseremail(email);

	        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
	            session.setAttribute("email", email);
	            session.setAttribute("userId", user.getUserId());
	            session.setAttribute("userName", user.getUserName());
	            session.setAttribute("role", user.getRole());

	            resp.sendRedirect("callRestaurantServlet");
	        } else {
	            resp.sendRedirect("login.html");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        resp.sendRedirect("login.html");
	    }
	}
		
}
