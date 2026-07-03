package com.food.servlet;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        String action = req.getParameter("action");

        String restaurantIdParam = req.getParameter("restaurantId");
        Integer newRestaurantId = null;

        if (restaurantIdParam != null && !restaurantIdParam.isEmpty() && !"null".equals(restaurantIdParam)) {
            newRestaurantId = Integer.parseInt(restaurantIdParam);
        }

        Integer sessionRestaurantId = (Integer) session.getAttribute("restaurantId");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if (newRestaurantId != null) {
            if (sessionRestaurantId == null || !sessionRestaurantId.equals(newRestaurantId)) {
                cart = new Cart();
                session.setAttribute("cart", cart);
                session.setAttribute("restaurantId", newRestaurantId);
            }
        }

        if ("add".equals(action)) {
            addItemToCart(req, cart, session);
        } else if ("update".equals(action)) {
            updateItemToCart(req, cart);
        } else if ("delete".equals(action)) {
            deleteItemToCart(req, cart);
        }

        resp.sendRedirect("cart.jsp");
    }

    private void addItemToCart(HttpServletRequest req, Cart cart, HttpSession session) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
        Menu menu = menuDAOImpl.getMenu(menuId);

        if (menu != null) {
            session.setAttribute("restaurantId", menu.getRestaurantId());

            CartItem cartItem = new CartItem(
                    menu.getMenuId(),
                    menu.getRestaurantId(),
                    menu.getItemName(),
                    menu.getPrice(),
                    quantity
            );

            cart.addItem(cartItem);
        }
    }

    private void updateItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);
    }

    private void deleteItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));

        cart.removeItem(menuId);
    }
}