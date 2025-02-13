package com.tap.model;

public class Restaurant implements Comparable<Restaurant>{
	
	private int restaurantId;
    private String name;
    private String cuisineType;
    private int deliveryTime;
    private String address;
    private float rating;
    private String isActive;
    private String imagePath;

    public Restaurant() {
		// TODO Auto-generated constructor stub
	}
    // Getters and Setters
    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String isActive() {
        return isActive;
    }

    public void setActive(String active) {
        isActive = active;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

	public Restaurant(int restaurantId, String name, String cuisineType, int deliveryTime, String address,
			float rating, String isActive, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}
	
	@Override
	public String toString() {
		
		return restaurantId+" "+name+" "+cuisineType+" "+deliveryTime+" "+address+" "+rating+" "+isActive+" "+imagePath;
	}

	@Override
	public int compareTo(Restaurant o1) {
	Restaurant o2=this;
	Float r1=o1.getRating();
	Float r2=o2.getRating();
	
	return r1.compareTo(r2);
	
	}

 

}
