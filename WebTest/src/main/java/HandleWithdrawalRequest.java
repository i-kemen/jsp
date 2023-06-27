import com.member.MemberDAO;
import com.member.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.member.MemberDAO;
import com.member.MemberDTO;
import java.io.IOException;

public class HandleWithdrawalRequest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        MemberDAO memberDAO = new MemberDAO();

        if ("approve".equals(action)) {
            // 회원 탈퇴 승인 처리
            memberDAO.deleteMember(id);
        } else if ("reject".equals(action)) {
            // 회원 탈퇴 거절 처리
            MemberDTO member = memberDAO.getMemberById(id);
            if (member != null) {
                member.setMemberStatus("정상");
                memberDAO.updateMember(member);
            }
        }

        response.sendRedirect("withdrawalRequests.jsp");
    }
}
