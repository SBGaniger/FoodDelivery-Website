package com.tap.controllers;

import java.io.IOException;

import com.tap.dao.OrderItemDAO;
import com.tap.dao.OrdersDAO;
import com.tap.daoimplementation.OrderItemDAOImpl;
import com.tap.daoimplementation.OrdersDAOImpl;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.Orders;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Checkout")
public class CheckOut extends HttpServlet
{
	private OrdersDAO orderDao;
	private OrderItemDAO itemDao;
	private int orderid;
	
	@Override
	public void init() {
		try {
			orderDao =new OrdersDAOImpl();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		Cart cart=(Cart)session.getAttribute("cart");
		User user=(User)session.getAttribute("user");
//		System.out.println(cart);
//		System.out.println(user);
		
//		check if cart and user is not null
		if(cart!=null && user!=null ) {
			
//		get payment mode from checkout.jsp using req
		String paymentMode=req.getParameter("payment-mode");
		
//		create order object to orderdetails by cart and user object
		Orders order=new Orders();
		order.setUserid(user.getUserId());
		order.setRestautid((int)session.getAttribute("restaurantId"));
		order.setPaymentmode(paymentMode);
		order.setStatus("pending");
		
		
//		get totalamount of all items present in cart
		int totalAmount=0;
		for(CartItem item:cart.getItems().values()) {
			totalAmount+=item.getPrice()*item.getQuantity();	
		}
		order.setTotalamount(totalAmount);
		 int orderid=orderDao.insert(order);
		order.setOrderid(orderid);
		
		
// 		add CartItem of each item in cart
		for(CartItem item:cart.getItems().values()) {
			
			OrderItem orderitem=new OrderItem();
			itemDao=new OrderItemDAOImpl();
			orderitem.setOrderid(orderid);
			orderitem.setMenuid(item.getItemid());
			orderitem.setItemtotal(item.getQuantity()*item.getPrice());
			orderitem.setQuantity(item.getQuantity());
			
			itemDao.insert(orderitem);
		}
		session.removeAttribute("cart");
		session.setAttribute("order", order);
		resp.sendRedirect("OrderConfirm.jsp");
		}
		else {
			resp.sendRedirect("restaurant.jsp");
		}
	}
}