package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderDAO;
import com.food.model.Order;
import com.food.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO `order`(userId, totalAmount, status, paymentMethod, restaurantId, orderDate) VALUES(?, ?, ?, ?, ?, NOW())";

    private static final String SELECT_QUERY =
            "SELECT * FROM `order` WHERE orderId=?";

    private static final String UPDATE_QUERY =
            "UPDATE `order` SET userId=?, totalAmount=?, status=?, paymentMethod=?, restaurantId=? WHERE orderId=?";

    private static final String DELETE_QUERY =
            "DELETE FROM `order` WHERE orderId=?";

    private static final String SELECT_ALL_QUERY =
            "SELECT * FROM `order` ORDER BY orderDate DESC";

    private static final String SELECT_BY_USER_QUERY =
            "SELECT * FROM `order` WHERE userId=? ORDER BY orderDate DESC";

    @Override
    public int addOrder(Order order) {
        int orderId = 0;
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, order.getUserId());
            pstmt.setDouble(2, order.getTotalAmount());
            pstmt.setString(3, order.getStatus());
            pstmt.setString(4, order.getPaymentMethod());
            pstmt.setInt(5, order.getRestaurantId());

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                ResultSet keys = pstmt.getGeneratedKeys();

                if (keys.next()) {
                    orderId = keys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderId;
    }

    @Override
    public Order getOrder(int orderId) {
        Connection connection = DBConnection.getConnection();
        Order order = null;

        try {
            PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);
            pstmt.setInt(1, orderId);

            ResultSet result = pstmt.executeQuery();

            if (result.next()) {
                order = extractOrder(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public void updateOrder(Order order) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

            pstmt.setInt(1, order.getUserId());
            pstmt.setDouble(2, order.getTotalAmount());
            pstmt.setString(3, order.getStatus());
            pstmt.setString(4, order.getPaymentMethod());
            pstmt.setInt(5, order.getRestaurantId());
            pstmt.setInt(6, order.getOrderId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int orderId) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);
            pstmt.setInt(1, orderId);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();

        try {
            Statement stmt = connection.createStatement();
            ResultSet result = stmt.executeQuery(SELECT_ALL_QUERY);

            while (result.next()) {
                list.add(extractOrder(result));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(SELECT_BY_USER_QUERY);
            pstmt.setInt(1, userId);

            ResultSet result = pstmt.executeQuery();

            while (result.next()) {
                list.add(extractOrder(result));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private Order extractOrder(ResultSet result) throws SQLException {
        int orderId = result.getInt("orderId");
        int userId = result.getInt("userId");
        Timestamp orderDate = result.getTimestamp("orderDate");
        double totalAmount = result.getDouble("totalAmount");
        String status = result.getString("status");
        String paymentMethod = result.getString("paymentMethod");
        int restaurantId = result.getInt("restaurantId");

        return new Order(orderId, userId, orderDate, totalAmount, status, paymentMethod, restaurantId);
    }
}