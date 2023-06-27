import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.member.MemberDAO;
import com.member.MemberDTO;

@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        try {
            MemberDAO memberDAO = new MemberDAO();
            MemberDTO memberDTO = memberDAO.getMemberById(id);

            if (memberDTO != null) {
                memberDTO.setName(name);
                memberDTO.setPassword(password);
                memberDTO.setPhone(phone);
                memberDTO.setEmail(email);

                memberDAO.updateMember(memberDTO); // 회원 정보 업데이트

                System.out.println("업데이트 성공");
                // 수정된 정보를 세션에 업데이트
                request.getSession().setAttribute("name", name);
                request.getSession().setAttribute("password", password);
                request.getSession().setAttribute("phone", phone);
                request.getSession().setAttribute("email", email);
                response.sendRedirect("modifyResult.jsp"); // 수정 결과 페이지로 이동
            } else {
                System.out.println("회원 정보 조회 실패");
                response.sendRedirect("modify.jsp"); // 회원 정보 조회 실패 시 수정 페이지로 이동
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify.jsp"); // 예외 발생 시 수정 페이지로 이동
        }
    }
}
