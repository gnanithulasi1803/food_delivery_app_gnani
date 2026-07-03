package com.food.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem cartItem) {
        int menuId = cartItem.getMenuId();

        if (items.containsKey(menuId)) {
            CartItem existingCartItem = items.get(menuId);
            existingCartItem.setQuantity(existingCartItem.getQuantity() + cartItem.getQuantity());
        } else {
            items.put(menuId, cartItem);
        }
    }

    public void updateItem(int menuId, int quantity) {
        if (items.containsKey(menuId)) {
            if (quantity > 0) {
                CartItem existingItem = items.get(menuId);
                existingItem.setQuantity(quantity);
            } else {
                items.remove(menuId);
            }
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }
}