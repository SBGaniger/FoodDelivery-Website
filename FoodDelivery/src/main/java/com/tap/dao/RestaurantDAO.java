package com.tap.dao;

import java.util.List;

import com.tap.model.Restaurant;

public interface RestaurantDAO {
	
	 public int insert(Restaurant restaurant);
	   public List<Restaurant> fetchAll();
	   public  Restaurant fetchOne(int id);
	   public int update(int id, float rating);
	   public int delete(int id);


}
