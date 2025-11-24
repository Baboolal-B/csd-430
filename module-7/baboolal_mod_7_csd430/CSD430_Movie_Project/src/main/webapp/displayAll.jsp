<%@ page import="com.brijette.MovieBean" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    MovieBean bean = new MovieBean();

    // Insert new movie if POST request
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String ratingStr = request.getParameter("rating");
        String genre = request.getParameter("genre");
        String releaseStr = request.getParameter("release_year");
        String director = request.getParameter("director");

        if (title != null && !title.isEmpty()) {
            try {
                double rating = Double.parseDouble(ratingStr);
                int releaseYear = Integer.parseInt(releaseStr);

                boolean inserted = bean.insertMovie(title, rating, genre, releaseYear, director);
                if (inserted) {
                    out.println("<p style='color:green;'>Movie added successfully!</p>");
                } else {
                    out.println("<p style='color:red;'>Failed to insert movie.</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error inserting movie: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        }
    }

    // Fetch all movies
    ResultSet rs = null;
    try (Connection conn = bean.connect()) {
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
    <h2>All Movies</h2>

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

    <a href="addMovie.jsp">Add Another Movie</a>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
