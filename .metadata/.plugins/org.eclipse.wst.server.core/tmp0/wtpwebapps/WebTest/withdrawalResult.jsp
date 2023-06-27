<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            margin-top: 0;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
        }

        .link-container {
            display: flex;
            justify-content: space-evenly;
        }

        .link-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .link-container a:first-child {
            background-color: #f44336;
        }

        .link-container a:first-child:hover {
            background-color: #d32f2f;
        }

        .link-container a:last-child:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 탈퇴 결과</h1>
        <p>회원 탈퇴 신청이 정상적으로 처리되었습니다.</p>
        
        <div class="link-container">
            <a href="join.html">회원 가입 페이지로 이동</a>
            <a href="login.html">로그인 페이지로 이동</a>
        </div>
    </div>
</body>
</html>

