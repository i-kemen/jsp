import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.member.MemberDAO;
import com.member.MemberDTO;

@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // 회원 상태를 '승인 전'으로 설정
        String memberStatus = "승인 전";
        String memberRole = "일반사용자";

        MemberDAO memberDAO = new MemberDAO();
        MemberDTO existingMember = memberDAO.getMemberById(id);

        if (existingMember != null) {
            // 이미 가입된 회원이면 처리할 로직 추가
            if (existingMember.getMemberStatus().equals("승인 전")) {
                // 이미 가입된 회원이면서 memberStatus가 '승인 전'인 경우
                response.sendRedirect("joinResultApproval.jsp");
            } else {
                // 이미 가입된 회원이면서 memberStatus가 '정상'인 경우
                response.sendRedirect("joinResult.jsp");
            }
        } else {
            // 새로운 회원이면 가입 처리를 진행
            MemberDTO memberDTO = new MemberDTO(name, id, password, phone, email, memberStatus, memberRole);

            try {
                memberDAO.addMember(memberDTO);

                System.out.println("insert success");

                // 가입한 회원 정보를 다시 조회하여 업데이트된 정보를 가져옴
                MemberDTO updatedMemberDTO = memberDAO.getMemberById(id);

                // 세션에 회원 정보 저장
                request.getSession().setAttribute("memberDTO", updatedMemberDTO);

                // 신규 회원이므로 joinResultApproval.jsp로 리다이렉트
                response.sendRedirect("joinResultApproval.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("join.html");
            }
        }
    }
}
