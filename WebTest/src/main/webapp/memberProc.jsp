<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.test.member.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Processing</title>
</head>
<body>
    <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    %>

    <jsp:useBean id="memberBean" class="com.test.member.memberBean" scope="session" />
    <jsp:setProperty name="memberBean" property="id" value="<%= id %>" />
    <jsp:setProperty name="memberBean" property="password" value="<%= password %>" />
    <jsp:setProperty name="memberBean" property="name" value="<%= name %>" />
    <jsp:setProperty name="memberBean" property="email" value="<%= email %>" />


</body>
</html>
