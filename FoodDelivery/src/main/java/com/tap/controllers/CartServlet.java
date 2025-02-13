package com.tap.controllers;

import java.io.IOException;

import com.tap.daoimplementation.MenuDAOImpl;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    HttpSession session = req.getSession();
	    Cart cart = (Cart) session.getAttribute("cart");
	    
	

	    // Check if restaurantId is missing or empty
	    String restaurantIdStr = req.getParameter("restaurantId");
	    if (restaurantIdStr == null || restaurantIdStr.trim().isEmpty()) {
	        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid restaurantId");
	        return;
	    }
	    
	    Integer presentRestaurantId = (Integer)session.getAttribute("presentRestaurantId");
	    Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId");

	    if (cart == null || !presentRestaurantId.equals(currentRestaurantId)) {
	        cart = new Cart();
	        session.setAttribute("cart", cart);
	        session.setAttribute("presentRestaurantId", currentRestaurantId);
	    }
	    else if(presentRestaurantId != currentRestaurantId) {
	    	cart.clear();
	    	session.setAttribute("presentRestaurantId", currentRestaurantId);
	    }
	    String action = req.getParameter("action");

	    try {
	        if ("add".equals(action)) {
	        	
	            addItemToCart(req, cart);
	        } else if ("update".equals(action)) {
	            updateCartItem(req, cart);
	        } else if ("remove".equals(action)) {
	            removeCartItem(req, cart);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    resp.sendRedirect("cart.jsp");
    
	    
	}


	
	private void addItemToCart(HttpServletRequest req, Cart cart)throws ClassNotFoundException {
		
		int itemId=Integer.parseInt(req.getParameter("itemId"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		
		MenuDAOImpl menuDAO= new MenuDAOImpl();		
		Menu menuItem = menuDAO.fetchOne(itemId);
		
		if(menuItem != null) {
			CartItem cartItem=new CartItem(			
			menuItem.getMenuid(),
			menuItem.getRestaurantid(),
			menuItem.getName(),
			menuItem.getImagePath(),
			quantity,
			menuItem.getPrice()
			);
			
			cart.addItem(cartItem);			
		}
		
	}
	
	private void removeCartItem(HttpServletRequest req, Cart cart) {
		
		int itemId=Integer.parseInt(req.getParameter("itemId"));
		
		cart.removeItem(itemId);
		
		
	}

	private void updateCartItem(HttpServletRequest req, Cart cart) {
		
		int itemId=Integer.parseInt(req.getParameter("itemId"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		
		cart.updateItem(itemId, quantity);
			
	}
	
	

}
