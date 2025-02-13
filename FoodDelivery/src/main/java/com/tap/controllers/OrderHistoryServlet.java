package com.tap.controllers;

import java.io.IOException;
import java.util.ArrayList;

import com.tap.daoimplementation.OrderItemDAOImpl;
import com.tap.daoimplementation.OrdersDAOImpl;
import com.tap.model.Orders;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderHistoryServlet
 */
@WebServlet("/OrderHistoryServlet")

public class OrderHistoryServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		User user= (User)session.getAttribute("user");
		
		int userId = user.getUserId();
		
		OrdersDAOImpl ordersDAOImpl = new OrdersDAOImpl();
		ArrayList<Orders> fetchbyUserId = ordersDAOImpl.fetchbyUserId(userId);
		
		session.setAttribute("orderhistory", fetchbyUserId);
		
		resp.sendRedirect("orderhistory.jsp");
		
		
	}
	
	

}
