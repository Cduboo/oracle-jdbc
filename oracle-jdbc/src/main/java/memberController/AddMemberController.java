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

@WebServlet("/member/insertMember")
public class AddMemberController extends HttpServlet {
	private MemberService memberService;
	
	// 회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태 -> 접근불가
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/member/insertMemberForm.jsp").forward(request, response);
	}
	
	// 회원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 상태 -> 접근불가
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/home");
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
		this.memberService = new MemberService();
		int row = memberService.addMember(member);
		
		// redirect
		if(row == 1) {
			System.out.println("회원가입 성공");
			response.sendRedirect(request.getContextPath()+"/member/login");
		} else {
			System.out.println("회원가입 실패");
			response.sendRedirect(request.getContextPath()+"/member/insertMember");
		}
	}

}
