import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.member.MemberDAO;
import com.member.MemberDTO;

@WebServlet("/WithdrawOk")
public class WithdrawOk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인된 사용자 ID 가져오기
        String id = request.getParameter("id");

        MemberDAO memberDAO = new MemberDAO();
        MemberDTO member = memberDAO.getMemberById(id);

        if (member != null) {
            // 회원 탈퇴 처리를 진행
            try {
                // 회원 상태를 '탈퇴요청'로 업데이트
                member.setMemberStatus("탈퇴요청");
                // 회원 정보를 업데이트
                memberDAO.updateMember(member);

                System.out.println("withdrawal success");

                // 회원 탈퇴 완료 페이지로 포워드
                request.getRequestDispatcher("withdrawalResult.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("withdraw.jsp");
            }
        } else {
            // 탈퇴할 회원이 존재하지 않음
            response.sendRedirect("withdraw.jsp");
        }
    }
}
