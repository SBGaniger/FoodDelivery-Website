package com.tap.controllers;

import java.io.IOException;
import java.util.List;

import com.tap.daoimplementation.OrderItemDAOImpl;
import com.tap.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int orderId = Integer.parseInt(request.getParameter("orderId"));

	        // Fetch ordered items using DAO
	        OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();
	        List<OrderItem> orderItems = orderItemDAO.fetchByOrderId(orderId);

	        // Store in session and forward to JSP
	        HttpSession session = request.getSession();
	        session.setAttribute("orderItems", orderItems);
	        session.setAttribute("orderId", orderId);

	        response.sendRedirect("order-details.jsp");
	
	}

}
