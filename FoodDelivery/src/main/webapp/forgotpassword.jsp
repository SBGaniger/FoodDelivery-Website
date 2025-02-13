<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password - FoodHub</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="forgotpassword.css" />
</head>
<body>
    <div class="background-images">
        <img alt="Decorative pizza slice image" src="https://placehold.co/100x100" />
        <img alt="Decorative bowl of noodles image" src="https://placehold.co/100x100" />
    </div>
    <div class="container">
        <h1>
            Food<span>Hub</span>
        </h1>
        <h2>Reset Password</h2>
        <p>
            Enter your email address and we'll send you a link to reset your password.
        </p>
        <form>
            <label for="email">EMAIL</label>
            <input id="email" placeholder="Enter your email" type="email" name="email"/>
            <button type="submit">SEND RESET LINK</button>
        </form>
        <p>
            Remember your password?
            <a href="login.jsp">Login</a>
        </p>
    </div>
</body>
</html>
