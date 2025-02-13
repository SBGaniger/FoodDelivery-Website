<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.model.*" %>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Restaurants</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&amp;display=swap" rel="stylesheet"/>
    <link href="restaurant.css" rel="stylesheet"/>
    <script>
        function filterRestaurants() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let restaurantCards = document.getElementsByClassName("restaurant-card");

            for (let i = 0; i < restaurantCards.length; i++) {
                let name = restaurantCards[i].getElementsByTagName("h3")[0].innerText.toLowerCase();
                let cuisine = restaurantCards[i].getElementsByTagName("p")[0].innerText.toLowerCase();
                let address = restaurantCards[i].getElementsByClassName("address")[0].innerText.toLowerCase();

                if (name.includes(input) || cuisine.includes(input) || address.includes(input)) {
                    restaurantCards[i].style.display = "block";
                } else {
                    restaurantCards[i].style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
    <div class="header">
        <img alt="Logo" height="40" src="https://t4.ftcdn.net/jpg/07/24/43/37/240_F_724433789_QmXS7g3sV1AYJZfdz3Nk1TCEBbUljcac.jpg" width="40"/>
        
        <div class="search-bar">
            <input id="searchInput" placeholder="Search for restaurants, cuisine, or address" type="text" onkeyup="filterRestaurants()"/>
        </div>

        <div class="nav">
            <a href="OrderHistoryServlet"><i class="fas fa-history"></i> Order History</a>
            <div class="cart">
                <a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
            </div>
            <div class="profile">
                <a href="#"><i class="fas fa-user"> Profile</i></a>
                <div class="dropdown-content">
                    <% User user = (User) session.getAttribute("user"); %>
                    <a><%= user.getUsername() %></a>
                    <a><%= user.getEmail() %></a>
                    <a class="logout" href="LogoutServlet">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="restaurants">Restaurants Near You</div>
        <div class="restaurant-list">
            <% 
                List<Restaurant> restaurants = (List<Restaurant>) session.getAttribute("restaurantslist");
                for (Restaurant r : restaurants) { 
            %>
                <div class="restaurant-card">
                    <a href="menu?restaurantId=<%= r.getRestaurantId() %>&restaurantName=<%= r.getName() %>" style="text-decoration: none; color: inherit;">
                        <img alt="Various dishes" height="210" src="<%= r.getImagePath() %>" width="300"/>
                        <div class="info">
                            <h3><%= r.getName() %></h3>
                            <p><%= r.getCuisineType() %></p>
                            <div class="rating">
                                <i class="fas fa-star"></i>  
                                <%= r.getRating() %> · <%= r.getDeliveryTime() %> mins
                            </div>                                     
                            <p class="address"><%= r.getAddress() %></p>                           
                        </div>
                    </a>          
                </div>  
            <% } %>
        </div>
    </div>
</body>
</html>
