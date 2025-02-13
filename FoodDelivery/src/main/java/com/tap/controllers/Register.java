package com.tap.controllers;

import java.io.IOException;

import com.tap.daoimplementation.UserDAOimp;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	static String username;
	static String email;
	static String password;
	static String address;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		username=req.getParameter("username");
		email=req.getParameter("email");
		password=req.getParameter("password");
		address=req.getParameter("address");
		
		try {
			User u=new User(username,password,email,address);
			
			UserDAOimp userDAOimp = new UserDAOimp();		
			System.out.println(userDAOimp.insert(u));
			
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(req, resp);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			
		
	}

}
