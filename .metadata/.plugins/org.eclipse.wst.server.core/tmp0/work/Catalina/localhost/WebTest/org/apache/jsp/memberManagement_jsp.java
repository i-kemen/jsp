/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.6
 * Generated at: 2023-06-27 04:12:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.util.List;
import com.member.MemberDTO;
import com.member.MemberDAO;

public final class memberManagement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {


        // 마스킹된 연락처를 반환하는 함수
        public String maskPhoneNumber(String phoneNumber) {
            if (phoneNumber != null && phoneNumber.startsWith("010-")) {
                return "010-XXXX-XXXX";
            }
            return phoneNumber;
        }
    
  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.member.MemberDTO");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.member.MemberDAO");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Member Management</title>\r\n");
      out.write("    <style>\r\n");
      out.write("        table {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            border-collapse: collapse;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        th, td {\r\n");
      out.write("            padding: 8px;\r\n");
      out.write("            text-align: left;\r\n");
      out.write("            border-bottom: 1px solid #ddd;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        tr:hover {\r\n");
      out.write("            background-color: #f5f5f5;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        form {\r\n");
      out.write("            margin-bottom: 20px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        label {\r\n");
      out.write("            display: inline-block;\r\n");
      out.write("            width: 100px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        input[type=\"text\"],\r\n");
      out.write("        input[type=\"password\"],\r\n");
      out.write("        input[type=\"email\"],\r\n");
      out.write("        select {\r\n");
      out.write("            margin-bottom: 10px;\r\n");
      out.write("            padding: 5px;\r\n");
      out.write("            width: 200px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        input[type=\"submit\"] {\r\n");
      out.write("            padding: 5px 10px;\r\n");
      out.write("            background-color: #4CAF50;\r\n");
      out.write("            color: white;\r\n");
      out.write("            border: none;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        input[type=\"submit\"]:hover {\r\n");
      out.write("            background-color: #45a049;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* 버튼 컨테이너 */\r\n");
      out.write("        .button-container {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            justify-content: space-between;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            margin-bottom: 20px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* 버튼 스타일 */\r\n");
      out.write("        .button-container button {\r\n");
      out.write("            padding: 5px 10px;\r\n");
      out.write("            background-color: #4CAF50;\r\n");
      out.write("            color: white;\r\n");
      out.write("            border: none;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .button-container button:hover {\r\n");
      out.write("            background-color: #45a049;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <h1>Member Management</h1>\r\n");
      out.write("\r\n");
      out.write("    <h2>Member List</h2>\r\n");
      out.write("\r\n");
      out.write("    <table>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>Name</th>\r\n");
      out.write("            <th>ID</th>\r\n");
      out.write("            <th>Password</th>\r\n");
      out.write("            <th>Phone</th>\r\n");
      out.write("            <th>Email</th>\r\n");
      out.write("            <th>Status</th>\r\n");
      out.write("            <th>Role</th>\r\n");
      out.write("            <th>Action</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");
 List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
           if (memberList != null && !memberList.isEmpty()) {
               for (MemberDTO member : memberList) { 
      out.write("\r\n");
      out.write("                   <tr>\r\n");
      out.write("                       <td>");
      out.print( member.getName() );
      out.write("</td>\r\n");
      out.write("                       <td>");
      out.print( member.getId() );
      out.write("</td>\r\n");
      out.write("                       <td>");
      out.print( member.getPassword() );
      out.write("</td>\r\n");
      out.write("                       <td>");
      out.print( maskPhoneNumber(member.getPhone()) );
      out.write("</td>\r\n");
      out.write("                       <td>");
      out.print( member.getEmail() );
      out.write("</td>\r\n");
      out.write("                       <td>");
      out.print( member.getMemberStatus() );
      out.write("</td>\r\n");
      out.write("                       <td>");
      out.print( member.getMemberRole() );
      out.write("</td>\r\n");
      out.write("                       <td>\r\n");
      out.write("                           <form method=\"post\" action=\"adminModify.jsp\">\r\n");
      out.write("                               <input type=\"hidden\" name=\"memberId\" value=\"");
      out.print( member.getId() );
      out.write("\">\r\n");
      out.write("                               <button type=\"submit\">Edit</button>\r\n");
      out.write("                           </form>\r\n");
      out.write("                       </td>\r\n");
      out.write("                   </tr>\r\n");
      out.write("               ");
 }
           } else { 
      out.write("\r\n");
      out.write("               <tr>\r\n");
      out.write("                   <td colspan=\"8\">No search results.</td>\r\n");
      out.write("               </tr>\r\n");
      out.write("           ");
 } 
      out.write("\r\n");
      out.write("    </table>\r\n");
      out.write("\r\n");
      out.write("    <!-- 버튼 컨테이너 -->\r\n");
      out.write("    <div class=\"button-container\">\r\n");
      out.write("        <!-- adminDashboard.jsp로 이동하는 버튼 -->\r\n");
      out.write("        <form method=\"post\" action=\"adminDashboard.jsp\">\r\n");
      out.write("            <button type=\"submit\">Go to Admin Dashboard</button>\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("        <!-- Show All Members 버튼 -->\r\n");
      out.write("        <form method=\"post\" action=\"MemberManagementOKServlet\">\r\n");
      out.write("            <input type=\"hidden\" name=\"action\" value=\"allMembers\">\r\n");
      out.write("            <button type=\"submit\">Show All Members</button>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <form method=\"post\" action=\"MemberManagementOKServlet\">\r\n");
      out.write("        <input type=\"hidden\" name=\"action\" value=\"search\">\r\n");
      out.write("        <label for=\"searchColumn\">Search Column:</label>\r\n");
      out.write("        <select name=\"searchColumn\" id=\"searchColumn\">\r\n");
      out.write("            <option value=\"name\">Name</option>\r\n");
      out.write("            <option value=\"id\">ID</option>\r\n");
      out.write("            <option value=\"password\">Password</option>\r\n");
      out.write("            <option value=\"phone\">Phone</option>\r\n");
      out.write("            <option value=\"email\">Email</option>\r\n");
      out.write("            <option value=\"memberStatus\">Status</option>\r\n");
      out.write("            <option value=\"memberRole\">Role</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <label for=\"searchKeyword\">Search Keyword:</label>\r\n");
      out.write("        <input type=\"text\" name=\"searchKeyword\" placeholder=\"Enter keyword\">\r\n");
      out.write("        <input type=\"submit\" value=\"Search\">\r\n");
      out.write("    </form>\r\n");
      out.write("\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
