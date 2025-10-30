<%-- 
    Author: Brijette B.
    Assignment: Dynamic HTML Page using JSP Scriptlets
    Topic: Demon Slayer - Infinity Castle
    Description: Displays 5 Demon Slayer movie/arc records dynamically in a styled table.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Demon Slayer: Infinity Castle - Movie Records</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<%
    /* ===============================
       Java Section (Scriptlet)
       =============================== */

    // Define a class to hold movie/arc information
    class DemonSlayerMovie {
        String title;
        String releaseYear;
        String focusCharacter;

        DemonSlayerMovie(String title, String releaseYear, String focusCharacter) {
            this.title = title;
            this.releaseYear = releaseYear;
            this.focusCharacter = focusCharacter;
        }
    }

    // Create 5 records about Demon Slayer movies or major arcs
    DemonSlayerMovie[] movies = {
        new DemonSlayerMovie("Demon Slayer: Infinity Castle", "2025", "Tanjiro Kamado"),
        new DemonSlayerMovie("Demon Slayer: Mugen Train", "2020", "Kyojuro Rengoku"),
        new DemonSlayerMovie("Swordsmith Village Arc", "2023", "Mitsuri & Muichiro"),
        new DemonSlayerMovie("Entertainment District Arc", "2021", "Tengen Uzui"),
        new DemonSlayerMovie("Hashira Training Arc", "2024", "The Hashira Corps")
    };
%>

    <!-- ===============================
         HTML Section
         =============================== -->

    <h1>Demon Slayer: Infinity Castle</h1>
    <p>
        This page highlights the <strong>Demon Slayer: Infinity Castle</strong> movie and other major arcs from the series.  
        Each record includes the title, release year, and main character(s) featured.
    </p>

    <table>
        <tr>
            <th>Title</th>
            <th>Release Year</th>
            <th>Focus Character(s)</th>
        </tr>

        <% 
            // Loop through the array and print each movie record
            for (DemonSlayerMovie dsm : movies) {
        %>
            <tr>
                <td><%= dsm.title %></td>
                <td><%= dsm.releaseYear %></td>
                <td><%= dsm.focusCharacter %></td>
            </tr>
        <% } %>
    </table>

    <footer>
        <p>Created by Brijette B. — JSP Dynamic Page Assignment</p>
    </footer>

</body>
</html>
