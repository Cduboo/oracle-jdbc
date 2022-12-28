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

@WebServlet("/member/updateMemberPw")
public class ModifyMemberPwController extends HttpServlet {
	private MemberService memberService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// forward
		request.getRequestDispatcher("/WEB-INF/view/member/updateMemberPwForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// 파라미터 수집
		String memberId = loginMember.getMemberId();
		String memberPw = request.getParameter("memberPw");
		String newMemberPw = request.getParameter("newMemberPw");
		String newMemberPwCk = request.getParameter("newMemberPwCk");
		
		// 새 비밀번호 일치 검사
		if(!newMemberPw.equals(newMemberPwCk)) {
			System.out.println("새 비밀번호 불일치");
			request.getRequestDispatcher("/WEB-INF/view/member/updateMemberPwForm.jsp").forward(request, response);
			return;
		}
		
		// service
		memberService = new MemberService();
		int row = memberService.updateMemberPw(memberId, memberPw, newMemberPw);
		
		if(row == 1) { 
			System.out.println("비밀번호 변경 성공");
			// redirect
			response.sendRedirect(request.getContextPath() + "/member/login");
		} else {
			System.out.println("비밀번호 변경 실패 : 비밀번호 불일치");
			request.getRequestDispatcher("/WEB-INF/view/member/updateMemberPwForm.jsp").forward(request, response);
		}
		
		
	}

}
