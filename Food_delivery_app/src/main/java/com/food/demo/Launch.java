package com.food.demo;

import java.util.List;
import java.util.Scanner;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.OrderDAOImpl;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Menu;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.model.Restaurant;
public class Launch {
	
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		//add user
//		System.out.println("Enter the UserName");
//		String userName=scan.next();
//		System.out.println("Enter the password");
//		String password=scan.next();
//		System.out.println("Enter the email");
//		String email=scan.next();
//		System.out.println("Enter the address");
//		String address=scan.next();
//		System.out.println("Enter the role");
//		String role=scan.next();
//		
//		User u=new User(userName,password,email,address,role);
		//UserDAOImpl userDAO=new UserDAOImpl();
//		userDAO.addUser(u);
		//getuser
//		User u=userDAO.getUser(4);
//		System.out.println(u);
		//update user
//		User u=userDAO.getUser(2);
//		u.setAddress("micolayout");
//		userDAO.updateUser(u);
//		System.out.println("user updated");
		
		//delete user
//		userDAO.deleteUser(1);
//		System.out.println("user deleted");
		
		//getAllUser
//		List<User> alluser=userDAO.getAllUsers();
//		for(User user : alluser) {
//			System.out.println(user);
//		}
		
		//add user
//		System.out.println("Enter the Name");
//		String name=scan.nextLine();
//		System.out.println("Enter the cusinetype");
//		String cuisine_type=scan.nextLine();
//		System.out.println("Enter the Deliverytime");
//		int delivery_time=scan.nextInt();
//		scan.nextLine();
//		System.out.println("Enter the address");
//		String address=scan.nextLine();
//		System.out.println("Enter the rating");
//		double rating=scan.nextDouble();
//		scan.nextLine();
//		System.out.println("Enter the isactive");
//		boolean is_active=scan.nextBoolean();
//		scan.nextLine();
//		System.out.println("Enter the imagepath");
//		String image_path=scan.next();
//		System.out.println("restaurant addad");
		
//		Restaurant r=new Restaurant(name,cuisine_type,delivery_time,address,rating,is_active,image_path);
		RestaurantDAOImpl restaurantDAO=new RestaurantDAOImpl();
//		restaurantDAO.addRestaurant(r);
		
//		Restaurant r=restaurantDAO.getRestaurant(2);
//		System.out.println(r);
		
//		Restaurant r=restaurantDAO.getRestaurant(4);
//		r.setAddress("micolayout");
//		restaurantDAO.updateRestaurant(r);
//		System.out.println("user updated");
		
//		restaurantDAO.deleteRestaurant(4);
//		System.out.println("user deleted");
		
//		List<Restaurant> allrestaurant=restaurantDAO.getAllRestaurants();
//		for(Restaurant restaurant : allrestaurant) {
//			System.out.println(restaurant);
//		}
//		
//		System.out.println("Enter the RestaurantId");
//		int restaurant_id =scan.nextInt();
//		scan.nextLine();
//		System.out.println("Enter the itemName");
//		String itemName=scan.nextLine();
//		System.out.println("Enter the Descrpition");
//		String description=scan.nextLine();
//		System.out.println("Enter the price");
//		double price=scan.nextDouble();
//		scan.nextLine();
//		System.out.println("Enter the isAvailable");
//		boolean isAvailable=scan.nextBoolean();
//		scan.nextLine();
//		System.out.println("Enter the imagepath");
//		String imagePath=scan.next();
//		System.out.println("restaurant addad");
//		
//		Menu m=new Menu(restaurant_id, itemName, description,price, isAvailable, imagePath);
		MenuDAOImpl menuDAO=new MenuDAOImpl();
//		menuDAO.addMenu(m);
		
//		Menu m=menuDAO.getMenu(3);
//		System.out.println(m);
		
//		Menu m=menuDAO.getMenu(2);
//		m.setPrice(40.0);
//		menuDAO.updateMenu(m);
//		System.out.println("user updated");
		
//		menuDAO.deleteMenu(4);
//		System.out.println("menu deleted");
		
//		List<Menu> allrestaurant=menuDAO.getAllMenusByRestaurant(2);
//		for(Menu restaurant : allrestaurant) {
//			System.out.println(restaurant);
//		}

//		System.out.println("Enter the userId");
//		int userId=scan.nextInt();
//		scan.nextLine();
//		System.out.println("Enter the totalAmount");
//		double totalAmount=scan.nextDouble();
//		scan.nextLine();
//		System.out.println("Enter the status");
//		String status=scan.nextLine().trim().toUpperCase();
//		scan.nextLine();
//		System.out.println("Enter the payment method");
//		String paymentMethod=scan.nextLine().trim().toUpperCase();
//		System.out.println("Enter the restaurantId");
//		int restaurantId=scan.nextInt();
//		
//		System.out.println("restaurant addad");
//		
//		Order o=new Order(userId, totalAmount, status, paymentMethod, restaurantId);
		OrderDAOImpl orderDAO=new OrderDAOImpl();
//		orderDAO.addOrder(o);
		
//		Order o=orderDAO.getOrder(1);
//		System.out.println(o);
		
//		Order o=orderDAO.getOrder(1);
//		o.setTotalAmount(600.00);
//		orderDAO.updateOrder(o);
		
		
//		List<Order> allrestaurant=orderDAO.getAllOrders();
//		for(Order restaurant : allrestaurant) {
//			System.out.println(restaurant);
//		}
		
//		System.out.println("Enter the orderId");
//		int orderId=scan.nextInt();
//		scan.nextLine();
//		System.out.println("Enter the quantity");
//		int quantity=scan.nextInt();
//		scan.nextLine();
//		System.out.println("Enter the itemTotal");
//		double itemTotal=scan.nextDouble();
//		scan.nextLine();
//		System.out.println("Enter the menuId");
//		int menuId=scan.nextInt();
//		
//		System.out.println("restaurant addad");
//		
//		OrderItem o=new OrderItem(orderId, quantity, itemTotal, menuId);
		OrderItemDAOImpl orderItemDAO=new OrderItemDAOImpl();
//		orderItemDAO.addOrderItem(o);
		
//		OrderItem o=orderItemDAO.getOrderItem(1);
//		System.out.println(o);
		
//		OrderItem m=orderItemDAO.getOrderItem(2);
//		m.setQuantity(40);
//		orderItemDAO.updateOrderItem(m);
//		System.out.println("user updated");
		
//		orderItemDAO.deleteOrderItem(3);
//		System.out.println("menu deleted");
		
//		List<OrderItem> allrestaurant=orderItemDAO.getAllOrderItems();
//		for(OrderItem restaurant : allrestaurant) {
//			System.out.println(restaurant);
//		}
		
	}
}

