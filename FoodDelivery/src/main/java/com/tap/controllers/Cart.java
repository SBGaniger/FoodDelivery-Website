package com.tap.controllers;

import java.util.HashMap;
import java.util.Map;

import com.tap.model.CartItem;

public class Cart {
	
	public static Map<Integer,CartItem> items;
	
	public Cart() {
		this.items=new HashMap<Integer, CartItem>();
	}
	
	
	public void addItem(CartItem item) {
		
		int itemId=item.getItemid();
		
		if(items.containsKey(itemId)){
			
			CartItem existingItem=items.get(itemId);
			existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());	
			
		}
		else {
			items.put(itemId, item);
			
		}
	}
	
	public void updateItem(int itemId,int quantity) {
		if(items.containsKey(itemId)) {
			if(quantity<=0) {
				items.remove(itemId);
			}
			else {
				CartItem existiCartItem=items.get(itemId);
				existiCartItem.setQuantity(quantity);
			}
		}
		
	} 
	
	
	public void removeItem(int itemId) {
		items.remove(itemId);
	}
	
	public void clear() {
		items.clear();

	}
	
	
	public Map<Integer,CartItem> getItems(){
		return items;
	}
	
	

}
