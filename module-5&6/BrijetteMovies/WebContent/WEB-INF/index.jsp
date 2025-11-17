<%@ page import="java.sql.*" %>

<html>
<head><title>BrijetteMovies - Select Movie</title></head>

<body>
<h2>Select a Movie</h2>

<form action="display.jsp" method="post">
<select name="movieId">
<%
    // Connect to CSD430 database
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/CSD430", "root", "yourpassword");

    Statement stmt = conn.createStatement();
    // Fetch all movie IDs from brijette_movies_data
    ResultSet rs = stmt.executeQuery("SELECT movieId FROM brijette_movies_data");

    while (rs.next()) {
%>
        <option value="<%= rs.getInt("movieId") %>">
            <%= rs.getInt("movieId") %>
        </option>
<%
    }
    rs.close();
    stmt.close();
    conn.close();
%>
</select>

<input type="submit" value="Show Movie">
</form>

</body>
</html>
