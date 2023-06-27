<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome</h1>
    <%-- 로그인한 사용자명 가져오기 --%>
    <% 
        String username = (String) request.getAttribute("username");
        
        if (username != null) {
    %>
    <p>Welcome, <%= username %>!</p>
    <p><a href="logout.jsp">Logout</a></p>
    <% } else { %>
    <p>Please login first.</p>
    <% } %>
</body>
</html>
