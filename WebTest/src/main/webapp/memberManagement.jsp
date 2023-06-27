<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.member.MemberDTO" %>
<%@ page import="com.member.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Management</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: inline-block;
            width: 100px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            margin-bottom: 10px;
            padding: 5px;
            width: 200px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* 버튼 컨테이너 */
        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        /* 버튼 스타일 */
        .button-container button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .button-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Member Management</h1>

    <h2>Member List</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>ID</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Status</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        <% List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
           if (memberList != null && !memberList.isEmpty()) {
               for (MemberDTO member : memberList) { %>
                   <tr>
                       <td><%= member.getName() %></td>
                       <td><%= member.getId() %></td>
                       <td><%= member.getPassword() %></td>
                       <td><%= maskPhoneNumber(member.getPhone()) %></td>
                       <td><%= member.getEmail() %></td>
                       <td><%= member.getMemberStatus() %></td>
                       <td><%= member.getMemberRole() %></td>
                       <td>
                           <form method="post" action="adminModify.jsp">
                               <input type="hidden" name="memberId" value="<%= member.getId() %>">
                               <button type="submit">Edit</button>
                           </form>
                       </td>
                   </tr>
               <% }
           } else { %>
               <tr>
                   <td colspan="8">No search results.</td>
               </tr>
           <% } %>
    </table>

    <!-- 버튼 컨테이너 -->
    <div class="button-container">
        <!-- adminDashboard.jsp로 이동하는 버튼 -->
        <form method="post" action="adminDashboard.jsp">
            <button type="submit">Go to Admin Dashboard</button>
        </form>

        <!-- Show All Members 버튼 -->
        <form method="post" action="MemberManagementOKServlet">
            <input type="hidden" name="action" value="allMembers">
            <button type="submit">Show All Members</button>
        </form>
    </div>

    <form method="post" action="MemberManagementOKServlet">
        <input type="hidden" name="action" value="search">
        <label for="searchColumn">Search Column:</label>
        <select name="searchColumn" id="searchColumn">
            <option value="name">Name</option>
            <option value="id">ID</option>
            <option value="password">Password</option>
            <option value="phone">Phone</option>
            <option value="email">Email</option>
            <option value="memberStatus">Status</option>
            <option value="memberRole">Role</option>
        </select>
        <label for="searchKeyword">Search Keyword:</label>
        <input type="text" name="searchKeyword" placeholder="Enter keyword">
        <input type="submit" value="Search">
    </form>

    <%!
        // 마스킹된 연락처를 반환하는 함수
        public String maskPhoneNumber(String phoneNumber) {
            if (phoneNumber != null && phoneNumber.startsWith("010-")) {
                return "010-XXXX-XXXX";
            }
            return phoneNumber;
        }
    %>
</body>
</html>
