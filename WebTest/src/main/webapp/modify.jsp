<%@ page import="com.member.MemberDAO" %>
<%@ page import="com.member.MemberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify</title>
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

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 정보 수정</h1>
        <%-- 세션에서 ID 값 가져오기 --%>
        <% String id = (String) session.getAttribute("id"); %>
        <%-- ID 값으로 회원 정보 조회 --%>
        <%
            try {
                MemberDAO memberDAO = new MemberDAO();
                MemberDTO memberDTO = memberDAO.getMemberById(id);

                if (memberDTO != null) {
                    String name = memberDTO.getName();
                    String password = memberDTO.getPassword();
                    String phone = memberDTO.getPhone();
                    String email = memberDTO.getEmail();
        %>
        <%-- 수정 폼 구성 --%>
        <form action="ModifyOk" method="post" onsubmit="return validateForm()">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="<%= name %>" required><br>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" value="<%= id %>" required readonly><br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" value="<%= password %>" required>
            <div class="error-message" id="password-error"></div><br>
            <label for="phone">전화번호:</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>" required>
            <div class="error-message" id="phone-error"></div><br>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required><br>
            <button type="submit">수정</button>
        </form>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("modify.jsp");
            }
        %>
    </div>
    <script>
        function validateForm() {
            const passwordInput = document.getElementById('password');
            const passwordErrorMessage = document.getElementById('password-error');
            const phoneInput = document.getElementById('phone');
            const phoneErrorMessage = document.getElementById('phone-error');

            const password = passwordInput.value;
            const phone = phoneInput.value;

            passwordErrorMessage.innerHTML = '';
            phoneErrorMessage.innerHTML = '';

            if (password.length < 4 || !hasLetterAndDigit(password)) {
                passwordErrorMessage.innerHTML = '비밀번호는 영문과 숫자를 포함한 4글자 이상이어야 합니다.';
                return false;
            }

            if (!isValidPhone(phone)) {
                phoneErrorMessage.innerHTML = '전화번호는 010-0000-0000 형식이어야 합니다.';
                return false;
            }

            return true;
        }

        function hasLetterAndDigit(password) {
            return /[a-zA-Z]/.test(password) && /\d/.test(password);
        }

        function isValidPhone(phone) {
            const phoneRegex = /^010-[0-9]{4}-[0-9]{4}$/;
            return phoneRegex.test(phone);
        }
    </script>
</body>
</html>
