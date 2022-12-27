package memberController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

/**
 * Servlet implementation class RegisterMemberFormController
 */
@WebServlet("/RegisterMemberFormController")
public class RegisterMemberFormController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태 -> 접근불가, 게시판 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/BoardListController");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/member/insertMemberForm.jsp").forward(request, response);
	}

}
