<%@ page import="com.brijette.MovieBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    MovieBean bean = new MovieBean();

    // Read form values from Add Movie form
    String title = request.getParameter("title");
    String ratingStr = request.getParameter("rating");
    String genre = request.getParameter("genre");
    String releaseStr = request.getParameter("release_year");
    String director = request.getParameter("director");

    // Insert the movie if form data exists
    if (title != null && !title.isEmpty()) {
        double rating = Double.parseDouble(ratingStr);
        int releaseYear = Integer.parseInt(releaseStr);

        boolean inserted = bean.insertMovie(title, rating, genre, releaseYear, director);
        if (!inserted) {
            out.println("<p style='color:red;'>Failed to insert movie. Check database connection.</p>");
        }
    }

    // Fetch all movies from database
    ResultSet rs = null;
    try {
        Connection conn = bean.connect();
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM brijette_movies_data ORDER BY movie_id");
            rs = stmt.executeQuery();
        } else {
            out.println("<p style='color:red;'>DEBUG: Connection is null!</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Movies</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #aaa; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        a { display: inline-block; margin-top: 15px; margin-right: 15px; }
    </style>
</head>
<body>
    <h1>All Movies</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Rating</th>
                <th>Genre</th>
                <th>Release Year</th>
                <th>Director</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (rs != null) {
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("movie_id") %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getDouble("rating") %></td>
                    <td><%= rs.getString("genre") %></td>
                    <td><%= rs.getInt("release_year") %></td>
                    <td><%= rs.getString("director") %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr><td colspan="6">No movies found.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="addMovie.jsp">Add New Movie</a>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
