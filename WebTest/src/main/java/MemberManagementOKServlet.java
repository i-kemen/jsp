import java.io.IOException;
import java.util.List;
import com.member.MemberDAO;
import com.member.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MemberManagementOKServlet")
public class MemberManagementOKServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberDAO memberDAO;

    public void init() {
        memberDAO = new MemberDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("search")) {
            String searchKeyword = request.getParameter("searchKeyword");
            String searchColumn = request.getParameter("searchColumn");
            List<MemberDTO> memberList;
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                memberList = memberDAO.searchMembers(searchColumn, searchKeyword);
            } else {
                memberList = null;
            }
            request.setAttribute("memberList", memberList);
        } else if (action != null && action.equals("allMembers")) {
            List<MemberDTO> memberList = memberDAO.getAllMembers();
            request.setAttribute("memberList", memberList);
        }

        request.getRequestDispatcher("memberManagement.jsp").forward(request, response);
    }
}
