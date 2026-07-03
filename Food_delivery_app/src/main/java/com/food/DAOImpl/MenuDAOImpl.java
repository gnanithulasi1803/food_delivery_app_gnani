package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.model.Menu;
import com.food.model.User;
import com.food.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{
	private static final String INSERT_QUERY="INSERT INTO `menu`(restaurantId, itemName, description, price, isAvailable, imagePath) VALUES(?,?,?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM menu WHERE menuId=?";
	private static final String MENU_SELECT_QUERY="SELECT * FROM menu WHERE restaurantId=?";
	public MenuDAOImpl() {
		super();
	}

	private static final String UPDATE_QUERY="UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, imagePath=? WHERE menuId=?";
	private static final String DELETE_QUERY="DELETE FROM menu WHERE menuId=?";
	private static final String SELECT_ALL_QUERY="SELECT * FROM menu";
	
	@Override
	public void addMenu(Menu menu) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getImagePath());
			
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public Menu getMenu(int menuId) {
		Connection connection=DBConnection.getConnection();
		Menu menu=null;
		try {
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, menuId);
			ResultSet result=pstmt.executeQuery();
			while(result.next()) {
				int id=result.getInt("menuId");
				int restaurant_id=result.getInt("restaurantId");
				String itemName=result.getString("itemName");
				String description=result.getString("description");
				double price=result.getInt("price");
				boolean isAvailable=result.getBoolean("isAvailable");
				String imagePath=result.getString("imagePath");
				
				menu=new Menu(id, restaurant_id, itemName, description, price, isAvailable, imagePath);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}
	@Override
	public void updateMenu(Menu menu) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getImagePath());
			pstmt.setInt(7, menu.getMenuId());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deleteMenu(int menuId) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, menuId);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Menu> getAllMenus(){
		List<Menu> list=new ArrayList<Menu>();
		Connection connection=DBConnection.getConnection();
		try {
			Statement stmt=connection.createStatement();
			ResultSet result=stmt.executeQuery(SELECT_ALL_QUERY);
			while(result.next()) {
				int id=result.getInt("menuId");
				int restaurant_id=result.getInt("restaurantId");
				String itemName=result.getString("itemName");
				String description=result.getString("description");
				double price=result.getInt("price");
				boolean isAvailable=result.getBoolean("isAvailable");
				String imagePath=result.getString("imagePath");
				
				Menu menu=new Menu(id, restaurant_id, itemName, description, price, isAvailable, imagePath);
				list.add(menu);
		}
	}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Menu> getAllMenusByRestaurant(int restaurantId) {

	    Connection connection = DBConnection.getConnection();

	    List<Menu> menuList = new ArrayList<>();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(MENU_SELECT_QUERY);

	        pstmt.setInt(1, restaurantId);

	        ResultSet result = pstmt.executeQuery();

	        while(result.next()) {

	            int id = result.getInt("menuId");
	            int restaurant_id = result.getInt("restaurantId");
	            String itemName = result.getString("itemName");
	            String description = result.getString("description");
	            double price = result.getDouble("price");
	            boolean isAvailable = result.getBoolean("isAvailable");
	            String imagePath = result.getString("imagePath");

	            Menu menu = new Menu(id,restaurant_id,itemName,description,price,isAvailable, imagePath);

	            menuList.add(menu);
	        }

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return menuList;
	}
	
}
