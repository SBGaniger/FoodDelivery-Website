<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Food Delivery</title>
   <link rel="stylesheet" href="checkout.css">
</head>
<body>
    <div class="container">
        <h1>Checkout</h1>
        <form class="checkout-form" action="Checkout">
            <div class="form-section">
                <h2>Delivery Address</h2>
                <div class="form-group">
                    <label for="house-floor">House No. & Floor*</label>
                    <input type="text" id="house-floor" name="house-floor" required>
                </div>
                <div class="form-group">
                    <label for="building-block">Building & Block No. <span class="optional-label">(optional)</span></label>
                    <input type="text" id="building-block" name="building-block">
                </div>
                <div class="form-group">
                    <label for="landmark-area">Landmark & Area Name <span class="optional-label">(optional)</span></label>
                    <input type="text" id="landmark-area" name="landmark-area">
                </div>
                <div class="form-group">
                    <label for="city">City*</label>
                    <input type="text" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="pincode">Pincode*</label>
                    <input type="text" id="pincode" name="pincode" required>
                </div>
            </div>
            <div class="form-section">
                <h2>Payment Mode</h2>
                <div class="form-group">
                    <label for="payment-mode">Select Payment Mode*</label>
                    <select id="payment-mode" name="payment-mode" required>
                        <option value="">Choose a payment method</option>
                        <option value="cash">Cash on Delivery</option>
                        <option value="card">Credit/Debit Card</option>
                        <option value="upi">UPI</option>
                    </select>
                </div>
            </div>
           <input type="submit" class="place-order-btn" value="Place Order">
        </form>
    </div>
</body>
</html>