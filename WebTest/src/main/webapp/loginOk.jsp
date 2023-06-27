<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Result</title>
</head>
<body>
    <%-- 로그인 정보 확인 --%>
    <% 
        String username = request.getParameter("id");
        String password = request.getParameter("passwd");
        
        // 등록된 사용자명과 비밀번호
        String registeredUsername = "김남훈";
        String registeredPassword = "305305";
        
        boolean loginSuccessful = registeredUsername.equals(username) && registeredPassword.equals(password);
    %>
    
    <%-- 로그인 결과에 따른 처리 --%>
    <% if (loginSuccessful) { 
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        
        
        // 로그인 성공 시 welcome.jsp로 포워딩
        request.setAttribute("username", username);
        request.getRequestDispatcher("welcome.jsp").forward(request, response);
        
        // 쿠키 생성
        Cookie cookie = new Cookie("usernameCookie", username);
        cookie.setMaxAge(3600); // 쿠키의 수명 설정 (초 단위)
        response.addCookie(cookie);
    } else { 
        // 로그인 실패 시 다시 login.jsp로 리다이렉트
        response.sendRedirect("login.jsp");
    } %>
    

</body>
</html>
