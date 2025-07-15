<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>${action == 'signup' ? 'Sign Up' : 'Login'} - BuildMyResume</title>
    <link rel="icon" href="images/logo.png" type="image/png">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<header class="header">
    <div class="logo-title">
        <img src="/images/logo.png" alt="BuildMyResume" height="40">
        <h1>BuildMyResume</h1>
    </div>
    <nav class="navbar">
        <a href="/">Home</a>
        <a href="/login?action=login">LogIn</a>
        <a href="/login?action=signup">SignUp</a>
    </nav>
</header>

<main class="form-container">
    <c:choose>
        <c:when test="${action == 'signup'}">
            <h2>Sign Up</h2>
            <form action="/signup" method="post" class="auth-form">

                <label>Email:</label>
                <input type="email" name="email" required />

                <label>Password:</label>
                <input type="password" name="password" required />

                <label>Type:</label>
                <select name="role" required>
                    <option value="">-- Select --</option>
                    <option value="fresher">Fresher</option>
                    <option value="experienced">Experienced</option>
                </select>

                <button type="submit">Sign Up</button>
            </form>
            <p class="redirect-link">Already have an account? <a href="/login?action=login">Log In</a></p>
        </c:when>

        <c:otherwise>
            <h2>Login</h2>
            <form action="/login" method="post" class="auth-form">
                <label>Email:</label>
                <input type="email" name="email" required />

                <label>Password:</label>
                <input type="password" name="password" required />

                <button type="submit">Login</button>
            </form>
            <p class="redirect-link">Don't have an account? <a href="/login?action=signup">Sign Up</a></p>
        </c:otherwise>
    </c:choose>
</main>

<c:if test="${not empty msg}">
    <script>alert("${msg}");</script>
</c:if>

<footer class="footer">
    <p>&copy; 2025 BuildMyResume. All rights reserved.</p>
</footer>

</body>
</html>
