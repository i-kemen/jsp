import java.io.IOException;
import com.member.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/HandleJoinRequest")
public class HandleJoinRequest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = request.getParameter("id");
        String action = request.getParameter("action");

        MemberDAO memberDAO = new MemberDAO();

        if ("approve".equals(action)) {
            memberDAO.approveMembership(memberId);
        } else if ("reject".equals(action)) {
            memberDAO.deleteMember(memberId);
        }

        response.sendRedirect("joinRequests.jsp");
    }
}
