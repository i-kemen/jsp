<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

    <jsp:useBean id="student" class="com.test.beans.Student" scope="page" />

    <jsp:setProperty name="student" property="name" value="John Doe" />
    <jsp:setProperty name="student" property="age" value="20" />
    <jsp:setProperty name="student" property="gra
    de" value="12" />
    <jsp:setProperty name="student" property="studentNum" value="12345" />

    <h1>Student Information:</h1>
    <p>Name: <jsp:getProperty name="student" property="name" /></p>
    <p>Age: <jsp:getProperty name="student" property="age" /></p>
    <p>Grade: <jsp:getProperty name="student" property="grade" /></p>
    <p>Student Number: <jsp:getProperty name="student" property="studentNum" /></p>
</body>
</html>
