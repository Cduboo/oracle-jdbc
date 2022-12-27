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

/**
 * Servlet implementation class RegisterMemberActionController
 */
@WebServlet("/RegisterMemberActionController")
public class RegisterMemberActionController extends HttpServlet {
	private MemberService memberService;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태 -> 접근불가, 게시판 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/BoardListController");
			return;
		}
		
		// 파라미터 수집
		request.setCharacterEncoding("utf-8");
		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		// vo
		Member member = new Member();
		member.setMemberName(memberName);
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		// service
		memberService = new MemberService();
		int row = memberService.addMember(member);
		if(row == 1) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}
		
		// 페이지 전환 -> 로그인
		response.sendRedirect(request.getContextPath()+"/LoginFormController");
	}

}
