<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String scrambled = "RDAW";
    String actualWord = "WARD";
    String guess = request.getParameter("userGuess");
    String feedback = "";
    String feedbackColor = "";

    if (guess != null) {
        guess = guess.trim().toUpperCase();
        if (guess.equals(actualWord)) {
            feedback = "Correct! You unscrambled the word.";
            feedbackColor = "#2ecc71";
        } else {
            feedback = "Oops! Try again.";
            feedbackColor = "#e74c3c";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Game - SCRAMBLE-X</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background: linear-gradient(to right, #000000, #111111);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                color: white;
            }
            header.navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px 50px;
                background-color: #111;
                border-bottom: 2px solid #1ABC9C;
            }
            .logo {
                font-size: 28px;
                font-weight: bold;
                color: #1ABC9C;
            }
            .nav-links {
                list-style: none;
                display: flex;
                gap: 30px;
            }
            .nav-links a {
                color: white;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.3s;
            }
            .nav-links a:hover {
                color: #1ABC9C;
            }
            .signup-btn {
                padding: 10px 20px;
                background: #1ABC9C;
                border-radius: 30px;
                color: black;
                text-decoration: none;
                font-weight: bold;
                transition: transform 0.3s;
            }
            .signup-btn:hover {
                transform: scale(1.05);
                background-color: #16a085;
            }
            .game-container {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                padding: 40px 20px;
            }

            .score-container {
                font-size: 1.8rem;
                font-weight: bold;
                color: #1ABC9C;
                margin-bottom: 30px;
                text-shadow: 0 0 8px #1ABC9C;
                letter-spacing: 2px;
                border: 2px solid #1ABC9C;
                padding: 10px 25px;
                border-radius: 15px;
                background-color: rgba(26, 188, 156, 0.1);
                box-shadow: 0 0 10px rgba(26, 188, 156, 0.4);
            }

            .scrambled-word {
                font-size: 2.5rem;
                font-weight: bold;
                color: #1ABC9C;
                margin-bottom: 30px;
            }
            .guess-input {
                padding: 12px 20px;
                font-size: 1.2rem;
                border: none;
                border-radius: 10px;
                width: 300px;
                margin-bottom: 20px;
            }
            .submit-btn {
                padding: 12px 25px;
                background-color: #1ABC9C;
                border: none;
                border-radius: 10px;
                font-size: 1rem;
                font-weight: bold;
                color: black;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .submit-btn:hover {
                background-color: #16a085;
            }
            .feedback {
                margin-top: 20px;
                font-size: 1.1rem;
                color: <%= feedbackColor%>;
            }
        </style>
    </head>
    <body>
        <header class="navbar">
            <div class="logo">SCRAMBLE-X</div>
            <nav>
                <ul class="nav-links">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="game.jsp">Game</a></li>
                    <li><a href="leaderboard.jsp">Leaderboard</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <a href="login.html" class="signup-btn">Sign Up</a>
        </header>

        <div class="game-container">
            <div class="score-container">
                ⚡ SCORE: 00 ⚡
            </div>


            <div class="scrambled-word"><%= scrambled%></div> 

            <form method="post" action="game.jsp">
                <input type="text" class="guess-input" name="userGuess" placeholder="Your guess..." />
                <br>
                <button type="submit" class="submit-btn">Submit</button>
            </form>

            <% if (!feedback.isEmpty()) {%>
            <div class="feedback"><%= feedback%></div>
            <% }%>
        </div>
    </body>
</html>
