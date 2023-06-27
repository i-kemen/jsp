<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.member.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Modify Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .result-message {
            margin-top: 20px;
            text-align: center;
        }

        .result-message a {
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Modify Result</h1>
        <%-- 수정 결과 출력 --%>
        <% MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO"); %>
        <% if (memberDTO != null) { %>
            <p>회원 정보가 수정되었습니다.</p>
            <table>
                <tr>
                    <td>이름:</td>
                    <td><%= memberDTO.getName() %></td>
                </tr>
                <tr>
                    <td>ID:</td>
                    <td><%= memberDTO.getId() %></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><%= memberDTO.getPassword() %></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><%= memberDTO.getPhone() %></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><%= memberDTO.getEmail() %></td>
                </tr>
                <tr>
                    <td>회원상태:</td>
                    <td><%= memberDTO.getMemberStatus() %></td>
                </tr>
                <tr>
                    <td>회원권한:</td>
                    <td><%= memberDTO.getMemberRole() %></td>
                </tr>
            </table>
        <% } else { %>
            <p>회원 정보를 찾을 수 없습니다.</p>
        <% } %>
        <div class="result-message">
            <a href="memberManagement.jsp">회원 관리 페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
