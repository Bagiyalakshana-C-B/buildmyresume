<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuildMyResume</title>
<link rel="icon" type="image/png" href="images/logo.png">
<link rel="stylesheet" type="text/css" href="css/homestyle.css">
<link rel="stylesheet" type="text/css" href="css/resumestyle.css">
</head>
<body>
	<!-- Header Section -->
    <header class="header">
        <div class="logo-title">
            <img src="images/logo.png" alt="BuildMyResume Logo">
            <h1>BuildMyResume</h1>
        </div>
        <nav class="navbar">
            <a href="/login?action=signup">Sign Up</a>
            <a href="/login?action=login">Log In</a>
        </nav>
    </header>

   <main class="main-flex">
        <!-- Left Column -->
        <section class="intro-content">
            <h2>Welcome to BuildMyResume</h2>
            <p>
                BuildMyResume is a fast and easy way to generate a professional resume.<br>
                Just select your profile type — fresher or experienced — fill in your basic details,<br>
                and get a ready-to-use resume instantly.
            </p>
        </section>

        <!-- Right Column: Resume Preview -->
        <!-- Right Column: Resume Preview -->
		<section class="resume-preview-wrapper">
		    <img src="images/sample-resume.png" alt="Sample Resume" class="resume-image">
		</section>
        
        
    </main>

    <!-- Footer -->
    <footer class="footer">
        &copy; 2025 BuildMyResume. All rights reserved.
    </footer>
</body>
</html>