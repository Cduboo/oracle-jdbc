package memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;


@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	private MemberService memberService;
	
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/member/loginForm.jsp").forward(request, response);
	}
	
	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태 -> 접근불가
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		
		// 파라미터 수집
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		// vo
		Member paramMember = new Member();
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		// service
		this.memberService = new MemberService();
		Member resultMember = this.memberService.login(paramMember);
		
		// 로그인 실패 -> 로그인 페이지로 이동
		if(resultMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// 로그인 성공
		session.setAttribute("loginMember", resultMember);
		response.sendRedirect(request.getContextPath() + "/home");
	}

}
