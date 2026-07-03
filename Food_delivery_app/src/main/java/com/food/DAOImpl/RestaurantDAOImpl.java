package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.model.User;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO{
	private static final String INSERT_QUERY="INSERT INTO `restaurant`(name, cuisineType, deliveryTime, address, rating,"
			+ " isActive, imagePath) VALUES(?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM restaurant WHERE restaurantId=?";
	public RestaurantDAOImpl() {
		super();
	}

	private static final String UPDATE_QUERY="UPDATE restaurant SET name=?,"
			+"cuisineType=?, deliveryTime=?, address=?, rating=?,"
			+"isActive=?, imagePath=? WHERE restaurantId=?";
	private static final String DELETE_QUERY="DELETE FROM restaurant WHERE restaurantId=?";
	private static final String SELECT_ALL_QUERY="SELECT * FROM restaurant";
	
	@Override
	public void addRestaurant(Restaurant restaurant) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getCuisineType());
			pstmt.setInt(3, restaurant.getDeliveryTime());
			pstmt.setString(4, restaurant.getAddress());
			pstmt.setDouble(5, restaurant.getRating());
			pstmt.setBoolean(6, restaurant.isIsActive());
			pstmt.setString(7, restaurant.getImagePath());
			
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Restaurant getRestaurant(int RestaurantId) {
		Connection connection=DBConnection.getConnection();
		Restaurant restaurant=null;
		try {
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, RestaurantId);
			ResultSet result=pstmt.executeQuery();
			while(result.next()) {
				int id=result.getInt("restaurantId");
				String name=result.getString("name");
				String cuisineType=result.getString("cuisineType");
				int deliveryTime=result.getInt("deliveryTime");
				String address=result.getString("address");
				double rating=result.getDouble("rating");
				boolean isActive=result.getBoolean("isActive");
				String imagePath=result.getString("imagePath");
				
				restaurant=new Restaurant(id,name,cuisineType,deliveryTime,address,rating,isActive,imagePath);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	
	}
	
	@Override
	public void updateRestaurant(Restaurant restaurant) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getCuisineType());
			pstmt.setInt(3, restaurant.getDeliveryTime());
			pstmt.setString(4, restaurant.getAddress());
			pstmt.setDouble(5, restaurant.getRating());
			pstmt.setBoolean(6, restaurant.isIsActive());
			pstmt.setString(7, restaurant.getImagePath());
			pstmt.setInt(8, restaurant.getRestaurantId());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deleteRestaurant(int restaurantId) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, restaurantId);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Restaurant> getAllRestaurants(){
		List<Restaurant> list=new ArrayList<Restaurant>();
		Connection connection=DBConnection.getConnection();
		try {
			Statement stmt=connection.createStatement();
			ResultSet result=stmt.executeQuery(SELECT_ALL_QUERY);
			while(result.next()) {
				int id=result.getInt("restaurantId");
				String name=result.getString("name");
				String cuisineType=result.getString("cuisineType");
				int deliveryTime=result.getInt("deliveryTime");
				String address=result.getString("address");
				double rating=result.getDouble("rating");
				boolean isActive=result.getBoolean("isActive");
				String imagePath=result.getString("imagePath");
				
				Restaurant restaurant=new Restaurant(id,name,cuisineType,deliveryTime,address,rating,isActive,imagePath);
				list.add(restaurant);
			}
	}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
