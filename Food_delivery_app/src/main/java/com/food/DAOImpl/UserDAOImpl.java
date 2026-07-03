package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;
public class UserDAOImpl implements UserDAO{
	private static final String INSERT_QUERY="INSERT INTO `user`(userName, password, email, address, role,"
			+ " createdDate, lastLoginDate) VALUES(?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM user WHERE userId=?";
	public UserDAOImpl() {
		super();
	}

	private static final String UPDATE_QUERY="UPDATE user SET userName=?, password=?, email=?, address=?, lastLoginDate=? WHERE userId=?";
	private static final String DELETE_QUERY="DELETE FROM user WHERE userId=?";
	private static final String SELECT_ALL_QUERY="SELECT * FROM user";
	private static final String Timestamp = null;
	
	@Override
	public int addUser(User user) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			
			int i=pstmt.executeUpdate();
			return i;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public User getUser(int userId) {
		Connection connection=DBConnection.getConnection();
		User user=null;
		try {
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, userId);
			ResultSet result=pstmt.executeQuery();
			while(result.next()) {
				int id=result.getInt("userId");
				String userName=result.getString("userName");
				String password=result.getString("password");
				String email=result.getString("email");
				String address=result.getString("address");
				String role=result.getString("role");
				Timestamp createdDate=result.getTimestamp("createdDate");
				Timestamp lastLoginDate=result.getTimestamp("lastLoginDate");
				
				user=new User(id,userName,password,email,address,role, createdDate, lastLoginDate);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
		
	}

	@Override
	public void updateUser(User user) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(6, user.getUserId());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUser(int userId) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, userId);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<User> getAllUsers() {
		List<User> list=new ArrayList<User>();
		Connection connection=DBConnection.getConnection();
		try {
			Statement stmt=connection.createStatement();
			ResultSet result=stmt.executeQuery(SELECT_ALL_QUERY);
			while(result.next()) {
				int id=result.getInt("userId");
				String userName=result.getString("userName");
				String password=result.getString("password");
				String email=result.getString("email");
				String address=result.getString("address");
				String role=result.getString("role");
				Timestamp createdDate=result.getTimestamp("createdDate");
				Timestamp lastLoginDate=result.getTimestamp("lastLoginDate");
				
				User user=new User(id,userName,password,email,address,role, createdDate, lastLoginDate);
				list.add(user);
		}
	}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public User getUserByUseremail(String email) throws SQLException {
		User user=null;
		String sql="SELECT * FROM User WHERE email=?";
		
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement pstmt=connection.prepareStatement(sql)){
			
			pstmt.setString(1,email);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user= new User();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setRole(rs.getString("role"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
