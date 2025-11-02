<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submitted Feedback Summary</title>

    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #fce4ec, #e3f2fd);
            padding: 40px;
        }

        .container {
            width: 70%;
            margin: auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            padding: 40px 50px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        p {
            text-align: center;
            color: #555;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 15px;
        }

        th {
            background-color: #2196f3;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            display: block;
            text-align: center;
            color: #2196f3;
            font-weight: 600;
            text-decoration: none;
            margin-top: 20px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Feedback Summary</h1>
        <p>Below is a summary of your recent restaurant experience feedback.</p>

        <%-- ==========================================
             SCRIPTLET: Retrieve form data from request
        =========================================== --%>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String date = request.getParameter("date");
            String dish = request.getParameter("dish");
            String experience = request.getParameter("experience");
            String staffRating = request.getParameter("staffRating");
            String recommend = request.getParameter("recommend");
            String standout = request.getParameter("standout");
            String comments = request.getParameter("comments");
        %>

        <%-- ==========================================
             DISPLAY DATA IN HTML TABLE
        =========================================== --%>
        <table>
            <tr><th>Field</th><th>Your Input</th></tr>
            <tr><td><b>Full Name</b></td><td><%= name %></td></tr>
            <tr><td><b>Email Address</b></td><td><%= email %></td></tr>
            <tr><td><b>Date of Visit</b></td><td><%= date %></td></tr>
            <tr><td><b>Favorite Dish</b></td><td><%= dish %></td></tr>
            <tr><td><b>Dining Experience</b></td><td><%= experience %></td></tr>
            <tr><td><b>Staff Rating</b></td><td><%= staffRating %> / 5</td></tr>
            <tr><td><b>Would Recommend</b></td><td><%= recommend %></td></tr>
            <tr><td><b>Standout Staff Member</b></td>
                <td><%= (standout == null || standout.isEmpty()) ? "No specific staff mentioned." : standout %></td></tr>
            <tr><td><b>Additional Comments</b></td>
                <td><%= (comments == null || comments.isEmpty()) ? "No additional comments." : comments %></td></tr>
        </table>

        <a href="feedbackForm.jsp">← Go Back to Form</a>
    </div>
</body>
</html>
