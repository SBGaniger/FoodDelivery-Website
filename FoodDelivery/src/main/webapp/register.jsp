<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Account - FoodHub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <div class="container">
        <h1>Food<span>Hub</span></h1>
        <h2>Create Account</h2>
       <form action="Register" method="get" >
		    <label for="full-name">FULL NAME</label>
		    <input type="text" id="full-name" placeholder="Enter your full name" name="username" required>
		    
		    <label for="email">EMAIL</label>
		    <input type="email" id="email" placeholder="Enter your email" name="email" required>
		    
		    <label for="password">PASSWORD</label>
		    <input type="password" id="password" placeholder="Create a password" name="password" required>
		    
		  
		    <label for="address">Address</label>
		    <input type="text" id="address" placeholder="Enter your address" name="address">
		    
		    <button type="submit">CREATE ACCOUNT</button>
		    
		</form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>
</body>
</html>
