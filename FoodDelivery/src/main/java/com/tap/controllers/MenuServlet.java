package com.tap.controllers;

import java.io.IOException;
import java.util.List;

import com.tap.daoimplementation.MenuDAOImpl;
import com.tap.daoimplementation.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session =req.getSession();
		
		int restaurantId= Integer.parseInt(req.getParameter("restaurantId"));		
		
		MenuDAOImpl daoImpl = new MenuDAOImpl();
		
		List<Menu> menuList = daoImpl.fetchMenuByRestaurant(restaurantId);
		
		req.setAttribute("menus", menuList);
		
		
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		Restaurant restaurant = restaurantDAOImpl.fetchOne(restaurantId);
	
		
		
		session.setAttribute("restaurantId", restaurantId);
		session.setAttribute("restaurant", restaurant);
		
		
		RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);
		
	}

}
