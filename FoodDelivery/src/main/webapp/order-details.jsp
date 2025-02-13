<%@ page import="java.util.*,com.tap.model.*,com.tap.daoimplementation.*" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Order Details</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7fafc;
            text-align: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .order-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .order-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            margin-right: 15px;
        }

        .item-details {
            flex: 1;
            text-align: left;
        }

        .item-details h2 {
            font-size: 18px;
            margin: 0;
        }

        .item-price {
            font-weight: bold;
            color: #ff5722;
        }

        .total-amount {
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
            color: #2d3748;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Details for Order ID: <%= session.getAttribute("orderId") %></h1>
        
        <%
            List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
            MenuDAOImpl menuDAO = new MenuDAOImpl(); // Create instance to fetch menu details

            float totalAmount = 0; // Variable to store total amount

            if (orderItems != null && !orderItems.isEmpty()) {
                for (OrderItem item : orderItems) {
                    Menu menu = menuDAO.fetchOne(item.getMenuid()); // Fetch menu details using menuid
        %>
            <div class="order-item">
                <img src="<%= menu.getImagePath() %>" alt="<%= menu.getName() %>"> <!-- Show Item Image -->
                <div class="item-details">
                    <h2><%= menu.getName() %></h2> <!-- Show Item Name -->
                    <p>Quantity: <%= item.getQuantity() %></p>
                </div>
                <div class="item-price">&#8377; <%= item.getItemtotal() %></div>
            </div>
        <%
                    totalAmount += item.getItemtotal(); // Add to total amount
                }
        %>
        
        <div class="total-amount">
            Total Amount: &#8377; <%= totalAmount %> <!-- Display Total Amount -->
        </div>
        <%
            } else {
        %>
            <p>No items found for this order.</p>
        <%
            }
        %>
    </div>
</body>
</html>
