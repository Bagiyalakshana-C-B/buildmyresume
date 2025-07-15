<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ResumePreview</title>
    <link rel="icon" type="image/png" href="/images/logo.png">
    <link rel="stylesheet" href="/css/preview.css">
</head>
<body>
<!-- Optional: Print Button -->
<div class="print-button-container">
    <button onclick="window.print()">Print / Save as PDF</button>
</div>

<!-- Resume Container (A4 size) -->

<div class="resume-container">
    <!-- Left Black Section -->
    <div class="left-panel">
        <h2>${resume.firstName} ${resume.middleName} ${resume.lastName}</h2>
        <p><strong>${resume.designation}</strong></p>
        <p>Email: ${resume.email}</p>
        <p>Phone: ${resume.phone}</p>
        <p>Address: ${resume.address}</p>
        <p>LinkedIn: ${resume.linkedIn}</p>
        <p>GitHub: ${resume.github}</p>
    </div>

    <!-- Right White Section -->
    <div class="right-panel">
        <h3>Professional Summary</h3>
        <p>${resume.summary}</p>

        <h3>Certifications</h3>
        <ul>
            <c:forEach var="cert" items="${resume.certifications}">
                <li>${cert}</li>
            </c:forEach>
        </ul>

        <c:if test="${not empty resume.experience}">
            <h3>Experience</h3>
            <ul>
                <c:forEach var="exp" items="${resume.experience}">
                    <li>${exp}</li>
                </c:forEach>
            </ul>
        </c:if>

        <h3>Education</h3>
        <ul>
            <c:forEach var="edu" items="${resume.education}">
                <li>${edu}</li>
            </c:forEach>
        </ul>

        <h3>Projects</h3>
        <ul>
            <c:forEach var="proj" items="${resume.projects}">
                <li>${proj}</li>
            </c:forEach>
        </ul>

        <h3>Skills</h3>
        <ul>
            <c:forEach var="skill" items="${resume.skills}">
                <li>${skill}</li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>
