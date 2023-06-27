<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>구구단</title>
</head>
<body>
    <h1>구구단</h1>
    <% 
        for (int i = 2; i <= 9; i++) {
            out.println("<h3>" + i + " 단</h3>");
            out.println("<table border='1'>");
            for (int j = 1; j <= 9; j++) {
                out.println("<tr>");
                out.println("<td>" + i + " × " + j + "</td>");
                out.println("<td>=</td>");
                out.println("<td>" + (i * j) + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }
    %>
</body>
</html>
