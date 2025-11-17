<%@ page import="com.brijette.brijettemovies.MovieBean" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>BrijetteMovies - Movie Details</title></head>

<body>

<h2>Movie Information</h2>

<%
    // Get movieId from form
    int id = Integer.parseInt(request.getParameter("movieId"));

    // Create MovieBean object
    MovieBean movie = new MovieBean();

    // Connect to CSD430 database
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/CSD430", "root", "yourpassword");

    PreparedStatement ps = conn.prepareStatement(
        "SELECT * FROM brijette_movies_data WHERE movieId = ?");
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        movie.setMovieId(rs.getInt("movieId"));
        movie.setTitle(rs.getString("title"));
        movie.setGenre(rs.getString("genre"));
        movie.setRating(rs.getString("rating"));
        movie.setYear(rs.getInt("year"));
    }

    rs.close();
    ps.close();
    conn.close();
%>

<!-- Display data in a table -->
<table border="1">
<thead>
<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Genre</th>
    <th>Rating</th>
    <th>Year</th>
</tr>
</thead>

<tbody>
<tr>
    <td><%= movie.getMovieId() %></td>
    <td><%= movie.getTitle() %></td>
    <td><%= movie.getGenre() %></td>
    <td><%= movie.getRating() %></td>
    <td><%= movie.getYear() %></td>
</tr>
</tbody>
</table>

</body>
</html>
