<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>FoodHub Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link href="login.css" rel="stylesheet" />
</head>
<body>
    <div class="login-container">
        <h1>Food <span>Hub</span></h1>
        <h2>Welcome Back</h2>
        <form action="Login" method="get">
            <label for="email">EMAIL</label>
            <input id="email" placeholder="Enter your email" type="email" name="email" required/>
            <label for="password">PASSWORD</label>
            <input id="password" placeholder="Enter your password" type="password" name="password" required/>
            <div class="remember-me">
                <div>
                   
                </div>
                <a class="forgot-password" href="forgotpassword.jsp">Forgot Password?</a>
            </div>
            <button class="login-button" type="submit">LOGIN</button>
            
            <%  
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {  
      %>
        <div id="error" class="error-message" style="color: red;"><%= error %></div>

      <% 
        }
      %>
        </form>
        <div class="signup">
            Don't have an account? <a href="register.jsp">Sign up</a>
        </div>
    </div>
    <div class="background-images">
        <img alt="Pizza slice illustration" class="pizza" src="https://placehold.co/100x100" />
        <img alt="Bowl of noodles illustration" class="noodles" src="https://placehold.co/100x100" />
    </div>
</body>
</html>
