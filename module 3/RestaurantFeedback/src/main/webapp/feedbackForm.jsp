<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Restaurant Experience Feedback Form</title>

    <!-- ===============================
         STYLE SECTION: Modern look and layout
    ================================== -->
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #fce4ec);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 55%;
            margin: 60px auto;
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
            color: #666;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #444;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        /* Staff Rating Section */
        .rating {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            background: #f9f9f9;
            border-radius: 10px;
            padding: 15px;
            margin-top: 10px;
            text-align: center;
        }

        .rating-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex: 1;
        }

        .rating-item span {
            font-size: 13px;
            color: #555;
            margin-bottom: 5px;
        }

        .rating-item input {
            width: auto;
            margin: 0;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 8px;
        }

        .radio-group label {
            font-weight: normal;
            color: #555;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .date-note {
            font-size: 12px;
            color: #888;
            margin-top: 3px;
        }

        button {
            display: block;
            margin: 30px auto 0;
            padding: 12px 35px;
            background: #2196f3;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #1976d2;
            transform: scale(1.05);
        }

        footer {
            text-align: center;
            margin-top: 30px;
            color: #888;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- ===============================
             PAGE HEADER
        ================================== -->
        <h1>Restaurant Experience Feedback</h1>
        <p>We appreciate your feedback! Please share your recent dining experience below.</p>

        <!-- ===============================
             FEEDBACK FORM
             (Submits data to displayFeedback.jsp)
        ================================== -->
        <form id="feedbackForm" action="displayFeedback.jsp" method="post">

            <!-- Full Name -->
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>

            <!-- Email -->
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <!-- Visit Date -->
            <label for="date">Date of Visit:</label>
            <input type="date" id="date" name="date" required>
            <div class="date-note">(Please select a valid date. Future dates are not allowed.)</div>

            <!-- Favorite Dish -->
            <label for="dish">Favorite Dish:</label>
            <input type="text" id="dish" name="dish" placeholder="What dish stood out to you?" required>

            <!-- Dining Experience -->
            <label for="experience">Overall Dining Experience:</label>
            <select id="experience" name="experience">
                <option value="Excellent">Excellent</option>
                <option value="Good">Good</option>
                <option value="Average">Average</option>
                <option value="Poor">Poor</option>
            </select>

            <!-- Staff Rating -->
            <label>Rate Our Staff (1–5):</label>
            <div class="rating">
                <div class="rating-item">
                    <span>1 = Terrible</span>
                    <input type="radio" name="staffRating" value="1" required>
                </div>
                <div class="rating-item">
                    <span>2 = Fair</span>
                    <input type="radio" name="staffRating" value="2">
                </div>
                <div class="rating-item">
                    <span>3 = Average</span>
                    <input type="radio" name="staffRating" value="3">
                </div>
                <div class="rating-item">
                    <span>4 = Good</span>
                    <input type="radio" name="staffRating" value="4">
                </div>
                <div class="rating-item">
                    <span>5 = Excellent</span>
                    <input type="radio" name="staffRating" value="5">
                </div>
            </div>

            <!-- Standout Staff -->
            <label for="standout">Was there a staff member that stood out to you? If so, who?</label>
            <input type="text" id="standout" name="standout" placeholder="Enter name or description">

            <!-- Recommend Section -->
            <label>Would you recommend us?</label>
            <div class="radio-group">
                <label><input type="radio" name="recommend" value="Yes" required> Yes</label>
                <label><input type="radio" name="recommend" value="No"> No</label>
            </div>

            <!-- Comments -->
            <label for="comments">Additional Comments:</label>
            <textarea id="comments" name="comments" placeholder="Share your thoughts..."></textarea>

            <!-- Submit Button -->
            <button type="submit">Submit Feedback</button>
        </form>
    </div>

    <footer>© 2025 TasteBuds Bistro — Customer Feedback Portal</footer>

    <!-- ===============================
         JAVASCRIPT SECTION
         Ensures no future date is selected
    ================================== -->
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const dateInput = document.getElementById("date");
            const form = document.getElementById("feedbackForm");

            const today = new Date();
            const yyyy = today.getFullYear();
            const mm = String(today.getMonth() + 1).padStart(2, "0");
            const dd = String(today.getDate()).padStart(2, "0");
            const maxDate = `${yyyy}-${mm}-${dd}`;
            dateInput.setAttribute("max", maxDate);

            // Prevent form submission with a future date
            form.addEventListener("submit", (event) => {
                const selectedDate = new Date(dateInput.value);
                if (selectedDate > today) {
                    alert("Future dates are not allowed. Please select a valid date.");
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
