import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.member.MemberDAO;
import com.member.MemberDTO;

@WebServlet("/AdminMemberModifyOk")
public class AdminMemberModifyOk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = request.getParameter("memberId");

        try {
            MemberDAO memberDAO = new MemberDAO();
            MemberDTO memberDTO = memberDAO.getMemberById(memberId);

            if (memberDTO != null) {
                // 해당 회원의 정보를 업데이트
                // 여기서는 제약 조건을 적용하지 않고, 모든 필드를 수정합니다.
                memberDTO.setName(request.getParameter("name"));
                memberDTO.setEmail(request.getParameter("email"));
                memberDTO.setMemberStatus(request.getParameter("memberStatus"));
                memberDTO.setMemberRole(request.getParameter("memberRole"));

                // 회원 정보 업데이트
                memberDAO.updateMember(memberDTO);

                // 수정된 회원 정보를 request 속성에 설정하여 결과 페이지로 전달
                request.setAttribute("memberDTO", memberDTO);
                request.getRequestDispatcher("adminMemberModifyResult.jsp").forward(request, response);
            } else {
                response.sendRedirect("memberManagement.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("memberManagement.jsp");
        }
    }
}
