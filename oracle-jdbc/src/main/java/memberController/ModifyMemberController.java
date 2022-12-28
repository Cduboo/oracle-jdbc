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


@WebServlet("/member/updateMember")
public class ModifyMemberController extends HttpServlet {
	private MemberService memberService;
	
	// 회원 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// forward
		request.getRequestDispatcher("/WEB-INF/view/member/updateMemberForm.jsp").forward(request, response);
	}
	
	// 회원 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// redirect -> /member/memberOne?key값
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// 파라미터 수집
		request.setCharacterEncoding("utf-8");
		String memberName = request.getParameter("memberName");
		String memberId = loginMember.getMemberId();

		// vo
		Member member = new Member();
		member.setMemberName(memberName);
		member.setMemberId(memberId);
		
		
		// service
		memberService = new MemberService();
		int row = memberService.updateMember(member);
		
		// redirect
		if(row == 1) {
			System.out.println("수정 성공");
			loginMember.setMemberName(memberName);
			response.sendRedirect(request.getContextPath() + "/member/memberOne");
		} else {
			System.out.println("수정 실패");
			response.sendRedirect(request.getContextPath() + "/member/updateMember");
		}
	}

}
