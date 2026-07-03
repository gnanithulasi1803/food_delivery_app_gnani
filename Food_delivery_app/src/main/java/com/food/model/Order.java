package com.food.model;

import java.sql.Timestamp;
public class Order {
	private int orderId;
	private int userId;
	private Timestamp orderDate;
	private double totalAmount;
	private String status;
	private String paymentMethod;
	private int restaurantId;
	
	public Order() {
		
	}

	public Order(int orderId, int userId, Timestamp orderDate, double totalAmount, String status, String paymentMethod,
			int restaurantId) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.restaurantId = restaurantId;
	}

	public Order(int userId, double totalAmount, String status, String paymentMethod, int restaurantId) {
		super();
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.restaurantId = restaurantId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", orderDate=" + orderDate + ", totalAmount="
				+ totalAmount + ", status=" + status + ", paymentMethod=" + paymentMethod + ", restaurantId="
				+ restaurantId + "]";
	}
	
}
