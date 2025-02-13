package com.tap.controllers;

import java.io.IOException;
import java.util.ArrayList;

import com.tap.daoimplementation.RestaurantDAOImpl;
import com.tap.daoimplementation.UserDAOimp;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class HomeSrevlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		UserDAOimp userDAOimp = new UserDAOimp();
		User user=userDAOimp.fetch(email);
		
		HttpSession session = req.getSession();
	
		
		if(user != null) {
			if(password.equals(user.getPassword())) {
				
				try {
					
					session.setAttribute("user", user);
					
					RestaurantDAOImpl rdi = new RestaurantDAOImpl();
					
					ArrayList<Restaurant> fetchAll = rdi.fetchAll();
					
					session.setAttribute("restaurantslist", fetchAll);
					
					
					RequestDispatcher requestDispatcher = req.getRequestDispatcher("restaurant.jsp");
					requestDispatcher.forward(req, resp);
					
				} catch (Exception e) {
					e.printStackTrace();
				}	
				
			}
			else {
				String perror="Incorrect password. Please try again.";
				req.setAttribute("error",perror );
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}else {
			
			String perror="Email not recognized. Please try again or sign up.";
			req.setAttribute("error",perror );
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		
		
		
	}

}
