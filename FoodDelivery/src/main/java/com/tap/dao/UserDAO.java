package com.tap.dao;

import java.util.ArrayList;

import com.tap.model.User;

public interface UserDAO {
	
	public int insert(User u);
	public ArrayList<User> fetchAll();
	public User fetchone(int id);
	public User fetch(String email);
	public int update(int id,String address);
	public int delete(int id);


}
