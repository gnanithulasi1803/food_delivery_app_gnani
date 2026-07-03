package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.model.OrderItem;
import com.food.model.User;
import com.food.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{
	private static final String INSERT_QUERY="INSERT INTO `orderitem`(orderId, quantity, itemTotal, menuId) VALUES(?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM `orderitem` WHERE orderItemId=?";
	public OrderItemDAOImpl() {
		super();
	}

	private static final String UPDATE_QUERY="UPDATE `orderitem` SET orderId=?, quantity=?, itemTotal=?, menuId=? WHERE orderItemId=?";
	private static final String DELETE_QUERY="DELETE FROM `orderitem` WHERE orderItemId=?";
	private static final String SELECT_ALL_QUERY="SELECT * FROM orderitem";
	
	@Override
	public void addOrderItem(OrderItem orderItem) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getQuantity());
			pstmt.setDouble(3, orderItem.getItemTotal());
			pstmt.setInt (4, orderItem.getMenuId());
			
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public OrderItem getOrderItem(int orderItemId) {
		Connection connection=DBConnection.getConnection();
		OrderItem orderItem=null;
		try {
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, orderItemId);
			ResultSet result=pstmt.executeQuery();
			while(result.next()) {
				int id=result.getInt("orderItemId");
				int orderId=result.getInt("orderId");
				int quantity=result.getInt("quantity");
				double itemTotal=result.getDouble("itemTotal");
				int menuId=result.getInt("menuId");
				
				orderItem=new OrderItem(id, orderId, quantity, itemTotal, menuId);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return orderItem;
	}
	@Override
	public void updateOrderItem(OrderItem orderItem) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getQuantity());
			pstmt.setDouble(3, orderItem.getItemTotal());
			pstmt.setInt (4, orderItem.getMenuId());
			pstmt.setInt(5, orderItem.getOrderItemId());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deleteOrderItem(int orderItemId) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, orderItemId);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<OrderItem> getAllOrderItems(){
		List<OrderItem> list=new ArrayList<OrderItem>();
		Connection connection=DBConnection.getConnection();
		try {
			Statement stmt=connection.createStatement();
			ResultSet result=stmt.executeQuery(SELECT_ALL_QUERY);
			while(result.next()) {
				int id=result.getInt("orderItemId");
				int orderId=result.getInt("orderId");
				int quantity=result.getInt("quantity");
				double itemTotal=result.getDouble("itemTotal");
				int menuId=result.getInt("menuId");
				
				OrderItem orderItem=new OrderItem(id, orderId, quantity, itemTotal, menuId);
				list.add(orderItem);
		}
	}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
