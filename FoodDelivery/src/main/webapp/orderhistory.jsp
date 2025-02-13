<%@ page import="java.util.*,com.tap.model.*,com.tap.daoimplementation.*" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Order History</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
        
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f7fafc;
            text-align: center;
            padding-top: 2rem;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: auto;
            padding: 2rem;
        }

        .order-card {
            background-color: #ffffff;
            padding: 1.5rem;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: flex-start; /* Align content to the left */
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }

        .order-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .order-card img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 1rem; /* Reduce space between image and text */
            border-radius: 8px;
        }

        .order-details {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Align text to the left */
        }

        .order-summary {
            text-align: right;
            font-size: 1.2rem;
            font-weight: bold;
            color: #2d3748;
            margin-left: auto; /* Push the total amount to the right */
        }

        .rupee-symbol {
            font-size: 1.5rem;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order History</h1>
        
        <%
            ArrayList<Orders> orders = (ArrayList<Orders>) session.getAttribute("orderhistory");
            ListIterator<Orders> iterator = orders.listIterator(orders.size());
            
            while(iterator.hasPrevious()) {
                Orders o = iterator.previous();
                int rId = o.getRestautid();
                int orderId = o.getOrderid(); // Fetch Order ID
                RestaurantDAOImpl rdi = new RestaurantDAOImpl();
                Restaurant r = rdi.fetchOne(rId);
        %>

        <!-- Clickable order card -->
        <a href="OrderDetailsServlet?orderId=<%= orderId %>" class="order-card">
            <img src="<%= r.getImagePath() %>" alt="<%= r.getName() %>" />
            <div class="order-details">
                <h2><%= r.getName() %></h2>
                <p>Status: <%= o.getStatus() %></p>
                <p>Payment Mode: <%= o.getPaymentmode() %></p>
            </div>
            <div class="order-summary">
                <p>Total: <span class="rupee-symbol">&#8377;</span><%= o.getTotalamount()%></p>
            </div>          
        </a>

        <%
            }
        %>
    </div>
</body>
</html>
