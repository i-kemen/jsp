<%@ page import="com.member.MemberDAO" %>
<%@ page import="com.member.MemberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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
        }

        p {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-confirm {
            display: block;
            width: 200px;
            margin: 0 auto;
            padding: 10px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-confirm:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 탈퇴</h1>
        <%-- 세션에서 ID 값 가져오기 --%>
        <% String id = (String) session.getAttribute("id"); %>
        <p><%= id %>님, 정말로 회원 탈퇴를 하시겠습니까?</p>
        <form action="WithdrawOk" method="post">
            <input type="hidden" id="id" name="id" value="<%= id %>">
            <button type="submit" class="btn-confirm">회원 탈퇴</button>
        </form>
    </div>
</body>
</html>
