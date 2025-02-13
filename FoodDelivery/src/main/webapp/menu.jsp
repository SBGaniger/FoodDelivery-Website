<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List,com.tap.model.*" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Food Menu</title>
  <link rel="stylesheet" href="menu.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
  <div class="container">
    <div class="header">
    
     <%
    	 Restaurant r =(Restaurant)session.getAttribute("restaurant");
     	
            
            		
           %>
    
      <h1><%=r.getName()%></h1>
      
    </div>
    
    	 <%
     		List<Menu> menuList=(List<Menu>)request.getAttribute("menus");
            
            		for(Menu m : menuList)
            		{
            			
           %>
			    <div class="item">
			      <div class="item-content">
			      <%if(m.getType().equals("veg"))
			      {			    	  			      
			      %>
			        <div class="icon-veg">
			          <div class="square">
			            <div class="circle"></div>
			          </div>
			        </div>
			        <%
			     		 }
			      		  else{		      		  
			        %>
			        
			         <div class="icon-nonveg">
         				 <div class="square">
           				 	<div class="circle"></div>
         					 </div>
       					 </div>
       					 <%
			      		  }
       					 %>
			        <h2><%=m.getName()%></h2>
			        <p class="price">₹ <%=m.getPrice() %></p>
			        <div class="rating">
			          <i class="fas fa-star"></i>
			         
			        </div>
			        <p class="description"><%=m.getDescription() %></p>
			       
			      </div>
			      <div class="add-button">
			        <img alt="Golden Baby Corn" src="<%=m.getImagePath()%>" width="100" height="100">
			        
			        <form action="cart" method="get">
			        <input type="hidden" name="restaurantId" value="<%=request.getParameter("restaurantId")%>">
			         <input type="hidden" name="itemId" value="<%=m.getMenuid()%>">
			         <input type="hidden" name="quantity" value="1" min="1">
			         <input type="hidden" name="action" value="add">
			        <button class="add-to-cart">ADD</button>
			        </form  >
			      </div>
			    </div>
			    <hr>
			    
			   <%              
            		}
               %>
   
    
  </div>
</body>
</html>
