import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminLoginOk")
public class AdminLoginOk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminId = request.getParameter("adminId");
        String adminPassword = request.getParameter("adminPassword");

        // 관리자 아이디와 비밀번호 검증
        if (adminId.equals("HOON") && adminPassword.equals("skagns19")) {
            // 관리자 로그인 성공
            request.getSession().setAttribute("adminId", adminId);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // 관리자 로그인 실패
            response.sendRedirect("adminLogin.html");
        }
    }
}
