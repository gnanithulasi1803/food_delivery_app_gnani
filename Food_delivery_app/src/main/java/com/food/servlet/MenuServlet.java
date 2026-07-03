package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MenuDAOImpl menuDAOImpl=new MenuDAOImpl();
		int restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
		List<Menu> allMenusByRestaurant=menuDAOImpl.getAllMenusByRestaurant(restaurantId);
		
		req.setAttribute("allMenusByRestaurant", allMenusByRestaurant);
		RequestDispatcher rd= req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);
	}
}
