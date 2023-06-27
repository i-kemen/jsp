<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 30px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 10px;
        }

        li a {
            display: block;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #333;
            text-decoration: none;
        }

        li a:hover {
            background-color: #f9f9f9;
        }

        form {
            text-align: center;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Welcome, Admin!</h1>
    
    <%-- 로그인 체크 코드 --%>
    <% String adminId = (String) session.getAttribute("adminId");
    if (adminId == null) {
        response.sendRedirect("adminLogin.html"); // 로그인 페이지로 이동
    } %>
    
    <%-- 관리자 페이지 내용 --%>
    <h2>Admin Menu</h2>
    <ul>
        <li><a href="joinRequests.jsp">회원가입 승인</a></li>
        <li><a href="memberManagement.jsp">회원관리</a></li>
        <li><a href="withdrawalRequests.jsp">회원탈퇴 처리</a></li>
    </ul>
    
    <%-- 관리자 로그아웃 버튼 --%>
    <form method="post" action="AdminLogout">
        <input type="submit" value="Logout">
    </form>
</body>
</html>
