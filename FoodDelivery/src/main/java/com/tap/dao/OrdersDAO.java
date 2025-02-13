package com.tap.dao;

import java.util.List;

import com.tap.model.Orders;

public interface OrdersDAO {
	
		public int insert(Orders o);
	   public List<Orders> fetchAll();
	   public  Orders fetchOne(int id);
	   public int update(int id, String status);
	   public int delete(int idd);



}
