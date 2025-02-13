<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.tap.model.*,com.tap.controllers.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Cart Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="cart.css" />
  </head>
  <body class="bg-gray-100">
    <div class="container mx-auto p-4 flex justify-center">
      <div class="w-full md:w-1/2">
        <h1 class="text-2xl font-bold mb-4 text-center">Your Cart</h1>
        
        <%
        
        	Cart cart=(Cart) session.getAttribute("cart");
        	Integer restaurantId=(Integer)session.getAttribute("restaurantId");
        	
        	
        	if (cart == null || cart.getItems() == null || cart.getItems().size() == 0 || session.getAttribute("restaurantId") == null){
        
        %>
        
        	<div class="if-container">
        	   <h1>Cart is empty</h1><br>
        	   <a href="restaurant.jsp" class="first-action" >Go to Home</a>
        	   </div>
        <%
        
        	}
        	else{
        		
        		
        		float total=0;
        		float sum=0;
        		
        		for(CartItem item: cart.getItems().values()){
        			
       	%>
        <!-- Cart Item 1 -->
        <div class="cart-item">
          <div class="flex items-center">
            <img
              alt="Image of a delicious food item with vibrant colors and appealing presentation"
              class="cart-img"
              src="<%=item.getImagePath() %>"
            />
            <div>
              <h2 class="text-lg font-semibold"><%=item.getName() %></h2>
              <p class="text-gray-600">Price: <%=item.getPrice() %></p>
              <p class="text-gray-600">Total: <%=item.getPrice()*item.getQuantity() %></p>
              <%
              		sum=sum+item.getPrice()*item.getQuantity();
              %>
            </div>
          </div>
          <div class="flex items-center">
         
         	<form action="cart" method="get">
                   		 <input type="hidden" name="action" value="update">
                   		 <input type="hidden" name="restaurantId" value="<%=item.getRestaurantid()%>">
                   		 <input type="hidden" name="itemId" value="<%=item.getItemid() %>">
                   		 <input type="hidden" name="quantity" value="<%=item.getQuantity()-1 %>">                        
                    	<button class="quantity-btn">
                    	<i class="fas fa-minus"></i>
                    	</button>    
         	</form>
            
            <span class="text-lg font-semibold mx-2"><%=item.getQuantity() %></span>
            
             <form action="cart" method="get">
                  <input type="hidden" name="action" value="update">
                  <input type="hidden" name="restaurantId" value="<%=item.getRestaurantid()%>">
                  <input type="hidden" name="itemId" value="<%=item.getItemid() %>">
                  <input type="hidden" name="quantity" value="<%=item.getQuantity()+1 %>">
                  <button class="quantity-btn">
             	  <i class="fas fa-plus"></i>
            	  </button>                      
               </form>
               
               
               <form action="cart" method="get">
                  <input type="hidden" name="action" value="remove">
                  <input type="hidden" name="restaurantId" value="<%=item.getRestaurantid()%>">
                  <input type="hidden" name="itemId" value="<%=item.getItemid() %>">
                  <button class="remove-btn">
               	  <i class="fas fa-trash"></i>
            	  </button>                 
               </form>
       
          </div>
        </div>
        
        <%
        		} 		
        %>
        
        <h3>Total : <%= sum %></h3>

         
        <!-- Add More Items and Proceed to Checkout Buttons -->
        <div class="flex justify-between mt-6">
            <a  href="menu?restaurantId=<%= restaurantId %>" class="add-items-btn"  > Add More Items</a>             
        
          
          <button class="checkout-btn"><a  href="checkout.jsp"  >Proceed to Checkout</a></button>
        </div>
      </div>
      <%
        	}
      
      %>
    </div>
  </body>
</html>



                   


