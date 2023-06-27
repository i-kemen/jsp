<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie Example</title>
</head>
<body>
    <%--
    쿠키 생성
    --%>
    <% 
        String cookieName = "myCookie";
        String cookieValue = "Hello, Cookie!";
        int maxAge = 3600; // 쿠키 유효 기간 (초 단위, 1시간)

        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    %>
    
    <h1>Cookie Example</h1>
    
    <%--
    쿠키 확인
    --%>
    <% 
        Cookie[] cookies = request.getCookies();
        String cookieValueFound = null;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals(cookieName)) {
                    cookieValueFound = c.getValue();
                    break;
                }
            }
        }
    %>
    
    <%-- 쿠키가 존재하는 경우 출력 --%>
    <% if (cookieValueFound != null) { %>
        <p>쿠키 값: <%= cookieValueFound %></p>
    <% } else { %>
        <p>쿠키가 존재하지 않습니다.</p>
    <% } %>
    
    
    
    
    <%--
    쿠키 제거
    --%>
    <% 
        Cookie removeCookie = new Cookie(cookieName, "");
        removeCookie.setMaxAge(0);
        response.addCookie(removeCookie);
    %>
    
    <p>쿠키가 제거되었습니다.</p>
</body>
</html>
