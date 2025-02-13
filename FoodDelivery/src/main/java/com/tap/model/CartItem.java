package com.tap.model;

public class CartItem {

	private int itemid;
	private int restaurantid;
	private String name;
	private String imagePath;	
	private int quantity;
	private float price;
	
	public String getImagePath() {
		return imagePath;
	}
	
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public int getRestaurantid() {
		return restaurantid;
	}
	public void setRestaurantid(int restaurantid) {
		this.restaurantid = restaurantid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CordItem [itemid=" + itemid +  ", restaurantid=" + restaurantid + ", name=" + name
				+ ", quantity=" + quantity + ", price=" + price + "]";
	}
	
	public CartItem(int itemid, int restaurantid, String name, String imagePath, int quantity,float price) {
		super();
		this.itemid = itemid;
		this.restaurantid = restaurantid;
		this.name = name;
		this.imagePath = imagePath;
		this.quantity = quantity;
		this.price = price;
	}

	public CartItem() {
		super();
	}
	

}
