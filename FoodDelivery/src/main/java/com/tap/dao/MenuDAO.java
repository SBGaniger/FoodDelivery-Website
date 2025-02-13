package com.tap.dao;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {
	
	   public int insert(Menu m);
	   public List<Menu> fetchAll();
	   public  Menu fetchOne(int id);
	   public  List<Menu> fetchMenuByRestaurant(int r_id);
	   public int update(int id, int price);
	   public int delete(int id);


}
