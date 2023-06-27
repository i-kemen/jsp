<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Database Connection and Query Result</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet empResultSet = null;

    try {
        String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink";
        String user = "scott";
        String password = "tiger";
        out.println("pre class");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        out.println("after class");
        conn = DriverManager.getConnection(url, user, password);
        out.println("오라클 연결 성공<br>");

        // EMP 테이블 조회
        stmt = conn.createStatement();
        empResultSet = stmt.executeQuery("SELECT * FROM EMP");

        // 결과 처리
        out.println("<h1>Employee Information:</h1>");
        out.println("<table border='1'>");
        out.println("<tr><th>EMPNO</th><th>ENAME</th><th>JOB</th><th>MGR</th><th>HIREDATE</th><th>SAL</th><th>COMM</th><th>DEPTNO</th></tr>");
        while (empResultSet.next()) {
            int empNo = empResultSet.getInt("EMPNO");
            String empName = empResultSet.getString("ENAME");
            String job = empResultSet.getString("JOB");
            int mgr = empResultSet.getInt("MGR");
            String hireDate = empResultSet.getString("HIREDATE");
            double sal = empResultSet.getDouble("SAL");
            double comm = empResultSet.getDouble("COMM");
            int deptNo = empResultSet.getInt("DEPTNO");

            out.println("<tr><td>" + empNo + "</td><td>" + empName + "</td><td>" + job + "</td><td>" + mgr + "</td><td>" + hireDate + "</td><td>" + sal + "</td><td>" + comm + "</td><td>" + deptNo + "</td></tr>");
        }
        out.println("</table>");

    } catch (SQLException e) {
        out.println(e);
    } finally {
        // 리소스 해제
        if (empResultSet != null) {
            try {
                empResultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
