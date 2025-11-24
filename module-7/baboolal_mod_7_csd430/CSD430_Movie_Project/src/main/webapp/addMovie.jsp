<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Movie</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        form { max-width: 400px; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input[type="text"], input[type="number"] { width: 100%; padding: 5px; margin-top: 5px; }
        input[type="submit"] { margin-top: 20px; padding: 8px 15px; font-size: 16px; }
        a { display: block; margin-top: 15px; }
    </style>
</head>
<body>
    <h2>Add a New Movie Record</h2>
    <p>Enter the movie information below. The movie ID will be assigned automatically.</p>

    <form action="displayAll.jsp" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required>

        <label for="rating">Rating (0.0 - 10.0):</label>
        <input type="number" name="rating" id="rating" step="0.1" min="0" max="10" required>

        <label for="genre">Genre:</label>
        <input type="text" name="genre" id="genre" required>

        <label for="release_year">Release Year:</label>
        <input type="number" name="release_year" id="release_year" min="1800" max="2100" required>

        <label for="director">Director:</label>
        <input type="text" name="director" id="director" required>

        <input type="submit" value="Add Movie">
    </form>

    <a href="index.jsp">Return to Home</a>
    <a href="displayAll.jsp">View All Movies</a>
</body>
</html>
