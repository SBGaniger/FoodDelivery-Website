package com.tap.dao;

import java.util.ArrayList;
import java.util.List;

import com.tap.model.OrderItem;

public interface OrderItemDAO {
	
	public int insert(OrderItem o);
	   public List<OrderItem> fetchAll();
	   public OrderItem fetchOne(int id);
	   public int update(int id, int quantity);
	   public int delete(int d);
	   public ArrayList<OrderItem> fetchByOrderId(int orderId);


}
