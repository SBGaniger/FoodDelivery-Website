package com.tap.model;

public class Menu {
	
	 private int menuid;
	    private int restaurantid;
	    private String name;
	    private String description;
	    private int price;
	    private String isavailable;
	    private String imagePath;
	    private String type;
	    
		public Menu(int menuid, int restaurantid, String name, String description, int price, String isavailable,
				String imagePath,String type) {
			super();
			this.menuid = menuid;
			this.restaurantid = restaurantid;
			this.name = name;
			this.description = description;
			this.price = price;
			this.isavailable = isavailable;
			this.imagePath = imagePath;
			this.type=type;
		}
		
		
		public int getMenuid() {
			return menuid;
		}
		public void setMenuid(int menuid) {
			this.menuid = menuid;
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
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getIsavailable() {
			return isavailable;
		}
		public void setIsavailable(String isavailable) {
			this.isavailable = isavailable;
		}
		public String getImagePath() {
			return imagePath;
		}
		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type=type;
		}


}
