<%-- 
    Author: Brijette B.
    Assignment: JavaBean and JSP Data Display
    Topic: Demon Slayer - Infinity Castle
    Description: Displays 5 Demon Slayer movie/arc records dynamically using a JavaBean.
--%>

<%@ page import="com.brib.demo.DemonSlayerBean" %>
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

    // Create 5 records using the JavaBean
    DemonSlayerBean[] movies = {
        new DemonSlayerBean("Demon Slayer: Infinity Castle", "2025", "Tanjiro Kamado"),
        new DemonSlayerBean("Demon Slayer: Mugen Train", "2020", "Kyojuro Rengoku"),
        new DemonSlayerBean("Swordsmith Village Arc", "2023", "Mitsuri & Muichiro"),
        new DemonSlayerBean("Entertainment District Arc", "2021", "Tengen Uzui"),
        new DemonSlayerBean("Hashira Training Arc", "2024", "The Hashira Corps")
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
            // Loop through and display each record using getter methods from the bean
            for (DemonSlayerBean dsm : movies) {
        %>
            <tr>
                <td><%= dsm.getTitle() %></td>
                <td><%= dsm.getReleaseYear() %></td>
                <td><%= dsm.getFocusCharacter() %></td>
            </tr>
        <% } %>
    </table>

    <footer>
        <p>Created by Brijette B. — JSP and JavaBean Data Display</p>
    </footer>

</body>
</html>
