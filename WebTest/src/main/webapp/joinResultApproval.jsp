<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.member.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join Result - Approval Pending</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 40px;
            margin: 0 auto;
            text-align: center;
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 10px;
        }

        .btn {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Join Result - Approval Pending</h1>
        
        <%-- 세션에서 회원 정보 가져오기 --%>
        <% MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO"); %>
        
        <%-- 회원 정보 표시 --%>
        <p><strong>ID:</strong> <%= memberDTO.getId() %></p>
        <p><strong>Name:</strong> <%= memberDTO.getName() %></p>
        <p><strong>Password:</strong> <%= memberDTO.getPassword() %></p>
        <p><strong>Phone:</strong> <%= memberDTO.getPhone() %></p>
        <p><strong>Email:</strong> <%= memberDTO.getEmail() %></p>
        
        <p>Your membership registration is pending approval from the administrator.</p>
        
        <a href="join.html" class="btn">Back to Home</a>
    </div>
</body>
</html>
