package com.brijette;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean {

    // Connect to the database
    public Connection connect() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false&serverTimezone=UTC";
            String user = "student1";
            String password = "pass";

            conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("DEBUG: Connected successfully!");
            } else {
                System.out.println("DEBUG: Connection is null after getConnection!");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("DEBUG: JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DEBUG: SQLException during connection!");
            e.printStackTrace();
        }
        return conn;
    }

    // Get all movie IDs
    public ArrayList<Integer> getMovieIds() {
        ArrayList<Integer> ids = new ArrayList<>();
        String sql = "SELECT movie_id FROM brijette_movies_data";

        try (Connection conn = connect()) {
            if (conn == null) {
                System.out.println("DEBUG: Connection is null!");
                return ids;
            }

            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("movie_id");
                    System.out.println("DEBUG: Found movie_id = " + id);
                    ids.add(id);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("DEBUG: Total IDs found = " + ids.size());
        return ids;
    }

    // Get movie details by ID
    public ResultSet getMovieById(int id) {
        ResultSet rs = null;
        try {
            Connection conn = connect();
            if (conn == null) {
                System.out.println("DEBUG: Connection is null in getMovieById");
                return null;
            }

            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM brijette_movies_data WHERE movie_id = ?"
            );
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // ← Add insertMovie here
    // Inserts a new movie record into the database
    public boolean insertMovie(String title, double rating, String genre, int releaseYear, String director) {
        String sql = "INSERT INTO brijette_movies_data (title, rating, genre, release_year, director) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            if (conn != null) {
                conn.setAutoCommit(true); // ensure auto-commit is enabled
            }

            stmt.setString(1, title);
            stmt.setDouble(2, rating);
            stmt.setString(3, genre);
            stmt.setInt(4, releaseYear);
            stmt.setString(5, director);

            stmt.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // Optional: main method to test connection
    public static void main(String[] args) {
        MovieBean bean = new MovieBean();
        ArrayList<Integer> ids = bean.getMovieIds();
        System.out.println("Movie IDs: " + ids);

        // Example of inserting a movie
        boolean success = bean.insertMovie("New Movie", 7.5, "Action", 2023, "Director X");
        System.out.println("Insert success: " + success);
    }
}
