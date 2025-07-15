<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Build My Resume</title>
    <link rel="icon" type="image/png" href="images/logo.png">
    <link rel="stylesheet" href="/css/resumebuilderstyle.css">
</head>
<body>
<div class="container">
    <h2>Resume Builder</h2>
    <form action="/resume/viewSaved" method="get" style="margin-bottom: 20px;">
        <button type="submit">View Saved Resume</button>
    </form>

    <form action="/resume/preview" method="post">
        <fieldset>
            <legend>About</legend>
            <input type="text" name="firstName" placeholder="First Name" required>
            <input type="text" name="middleName" placeholder="Middle Name">
            <input type="text" name="lastName" placeholder="Last Name" required>
            <input type="text" name="designation" placeholder="Designation" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <input type="text" name="linkedIn" placeholder="LinkedIn Profile">
            <input type="text" name="github" placeholder="GitHub Profile">
            <textarea name="summary" placeholder="Professional Summary" required></textarea>
        </fieldset>

        <!-- Certifications -->
        <fieldset>
	    	<legend>Certifications</legend>
		    <input type="text" name="certifications" placeholder="Enter certifications separated by comma" required>
		</fieldset>
        

        <!-- Experience (conditionally shown) -->
        <c:if test="${sessionScope.userRole == 'experienced'}">
            <fieldset>
			    <legend>Experience</legend>
			    <input type="text" name="experience" placeholder="Enter experience separated by comma" required>
			</fieldset>
        </c:if>

        <!-- Education -->
        <fieldset>
		    <legend>Education</legend>
		    <input type="text" name="education" placeholder="Enter education separated by comma" required>
		</fieldset>
        

        <!-- Projects -->
       <fieldset>
		    <legend>Projects</legend>
		    <input type="text" name="projects" placeholder="Enter projects separated by comma" required>
		</fieldset>
       

        <!-- Skills -->
        <fieldset>
		    <legend>Skills</legend>
		    <input type="text" name="skills" placeholder="Enter skills separated by comma" required>
		</fieldset>
        

        <button type="submit">Generate Resume</button>
    </form>
</div>
</body>
</html>
