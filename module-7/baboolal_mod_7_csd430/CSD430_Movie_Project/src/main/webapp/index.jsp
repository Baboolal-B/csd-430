<%@ page import="java.util.ArrayList" %>
<%@ page import="com.brijette.MovieBean" %>
<%
    MovieBean bean = new MovieBean();
    ArrayList<Integer> movieIds = bean.getMovieIds();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Selection</title>
    <style>
        select { width: 200px; }
    </style>
</head>
<body>
    <h1>Select a Movie</h1>

    <form action="display.jsp" method="get">
        <label for="movieId">Movie ID:</label>
        <select name="movieId" id="movieId">
            <%
                if (movieIds.isEmpty()) {
                    out.println("<option value=\"\">No movies found</option>");
                } else {
                    for (Integer id : movieIds) {
                        out.println("<option value=\"" + id + "\">" + id + "</option>");
                    }
                }
            %>
        </select>
        <input type="submit" value="View Movie">
    </form>
    
    <a href="addMovie.jsp">Add New Movie</a><br>
    <a href="displayAll.jsp">View All Movies</a><br>
</body>
</html>
