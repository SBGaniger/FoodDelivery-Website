package com.tap.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class OrderMenuHistory
 */
@WebServlet("/OrderMenuHistory")
public class OrderMenuHistory extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int orderId=Integer.parseInt(req.getParameter("orderId"));
		System.out.println(orderId);
		
	}

}
