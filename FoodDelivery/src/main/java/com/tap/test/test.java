package com.tap.test;

import java.util.ArrayList;

import com.tap.daoimplementation.RestaurantDAOImpl;
import com.tap.daoimplementation.UserDAOimp;
import com.tap.model.Restaurant;
import com.tap.model.User;

public class test {
	
	public static void main(String[] args) {
		
			// TODO Auto-generated method stub
			//User u=new User("Ramnnujygiuok","ram1vhj@123","ram1@gmail.com","huballi");
			
			//UserDAOimp userDAOimp = new UserDAOimp();		
			//System.out.println(userDAOimp.insert(u));
			RestaurantDAOImpl rdi = new RestaurantDAOImpl();
			
			ArrayList<Restaurant> fetchAll = rdi.fetchAll();
			
			for(Restaurant restaurant:fetchAll) {
				System.out.println(restaurant);
			}
		
		
		


		}

}
