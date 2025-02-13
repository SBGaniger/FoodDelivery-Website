<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*,com.tap.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            min-height: 100vh;
          background: linear-gradient(to bottom, #ff7f00, #ffcc80);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            padding: 2rem;
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: #ecfdf5;
            border-radius: 50%;
            margin: 0 auto 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: scaleIn 0.5s ease-out;
        }

        .checkmark {
            color: #059669;
            font-size: 2.5rem;
            animation: checkmark 0.5s ease-out 0.5s both;
        }

        .content {
            margin-bottom: 2rem;
        }

        h1 {
            color: #1f2937;
            font-size: 1.875rem;
            margin-bottom: 0.75rem;
        }

        .subtitle {
            color: #4b5563;
            font-size: 1.125rem;
        }

        .order-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            text-align: left;
        }

        .info-row {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .icon {
            font-size: 1.5rem;
            width: 40px;
            height: 40px;
            background: #f3f4f6;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .info h3 {
            color: #1f2937;
            font-size: 1rem;
            margin-bottom: 0.25rem;
        }

        .info p {
            color: #6b7280;
        }

        .tracking {
            padding-top: 1rem;
            border-top: 1px solid #e5e7eb;
            margin-top: 0.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }

        @keyframes scaleIn {
            from {
                transform: scale(0);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        @keyframes checkmark {
            from {
                transform: scale(0);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 1rem;
            }
            
            .order-card {
                padding: 1.5rem;
            }
            
            h1 {
                font-size: 1.5rem;
            }
            
            .subtitle {
                font-size: 1rem;
            }
        }
        .back-to-home {
            display: inline-block;
            margin-top: 10px;
            margin-left: 30%;
            padding: 10px 20px;
             background-color: #c64040;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        

        .back-to-home:hover {
                   background-color: #b92222;
        }

    </style>
</head>
<body>
    <% Restaurant rest= (Restaurant) session.getAttribute("restaurant");
   	Orders order= (Orders) session.getAttribute("order");%>
    <div class="container">
        <div class="success-icon">
            <div class="checkmark">✓</div>
        </div>
        
        <div class="content">
            <h1>Order Placed Successfully!</h1>
            <p class="subtitle">Your delicious food is on the way</p>
        </div>

        <div class="order-card">
            <div class="info-row">
                <div class="icon">🕒</div>
                <div class="info">
                    <h3>Estimated Delivery Time</h3>
                    <p><%= rest.getDeliveryTime() %>-<%= rest.getDeliveryTime()+5 %> minutes</p>
                </div>
            </div>

            <div class="info-row">
                <div class="icon">📦</div>
                <div class="info">
                    <h3>Delivery Status</h3>
                    <p>Order is <%= order.getStatus() %></p>
                </div>
            </div>

            <div class="tracking">
                <a href="restaurant.jsp" class="back-to-home">Back to Home</a>
            </div>
        </div>
        <div >
       
      </div>
    </div>
    
</body>
</html>