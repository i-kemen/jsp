<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>ȸ������ â</h1>
    <form action="memberProc.jsp" method="post">
    <table border="3">
    <tr>
    <td> ���̵�</td>
    <td><input type ="text" name="id"> </td>
    </tr>
   
   <tr>
   <td>��й�ȣ </td>
   <td><input type ="text" name="password"> </td>
   </tr>
   
    <tr>
    <td> �̸�</td>
    <td><input type ="text" name="name"> </td>
    </tr>     
    
    <tr>
    <td> �̸���</td>
    <td><input type ="text" name="email"> </td>
    </tr> 
    
    <tr>

    <tr>  
    <td colspan ="2"> <center><input type="submit" value="���"> </center>  </td>
    </tr>
    
    </table>
    </form>
</body>
</html>