import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.member.MemberDAO;
import com.member.MemberDTO;

@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            MemberDAO memberDAO = new MemberDAO();
            MemberDTO memberDTO = memberDAO.getMemberById(id);

            if (memberDTO != null && memberDTO.getPassword().equals(password)) {
                String memberStatus = memberDTO.getMemberStatus();
                if (memberStatus.equals("정상")) {
                    // ID 승인됨
                    System.out.println("Login success");
                    // 로그인 정보를 세션에 저장
                    request.getSession().setAttribute("id", id);
                    response.sendRedirect("loginResult.jsp"); // 승인된 로그인 결과 페이지로 이동
                } else if (memberStatus.equals("승인 전")) {
                    // ID 미승인
                    System.out.println("ID not approved");
                    response.sendRedirect("joinResultApproval.jsp"); // 승인되지 않은 로그인 결과 페이지로 이동
                } else {
                    // 기타 상태
                    System.out.println("Invalid member status");
                    response.sendRedirect("login.html?error=invalid_status"); // 기타 상태로 인한 로그인 실패 페이지로 이동
                }
            } else {
                // 로그인 실패
                System.out.println("Login fail");
                if (memberDTO != null) {
                    // 비밀번호를 잘못 입력한 경우
                    response.sendRedirect("login.html?error=invalid_password"); // 비밀번호 오류 메시지와 함께 로그인 페이지로 이동
                } else {
                    // 아이디를 잘못 입력한 경우
                    response.sendRedirect("login.html?error=invalid_id"); // 아이디 오류 메시지와 함께 로그인 페이지로 이동
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.html?error=unknown_error"); // 알 수 없는 오류 메시지와 함께 로그인 페이지로 이동
        }
    }
}
