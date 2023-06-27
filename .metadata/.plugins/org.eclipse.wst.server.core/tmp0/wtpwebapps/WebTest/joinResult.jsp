<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.member.MemberDTO" %>
<%@ page import="com.member.MemberDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>회원 가입 완료</h1>
    <p>회원 가입이 완료되었습니다.</p>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Status</th>
        </tr>
        <tr>
            <% MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("memberDTO");
               MemberDAO memberDAO = new MemberDAO();
               // 세션에서 memberDTO를 다시 조회하여 업데이트된 정보 가져오기
               memberDTO = memberDAO.getMemberById(memberDTO.getId());
            %>
            <td><%= memberDTO.getName() %></td>
            <td><%= memberDTO.getId() %></td>
            <td><%= memberDTO.getPassword() %></td>
            <td><%= memberDTO.getPhone() %></td>
            <td><%= memberDTO.getMemberStatus() %></td>
        </tr>
    </table>
    <script>
        function goToLoginPage() {
            location.href = "login.html";
        }
    </script>

    <button onclick="goToLoginPage()">Go to Login</button>
</body>
</html>
