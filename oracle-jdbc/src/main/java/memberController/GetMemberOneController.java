package memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import service.MemberService;
import vo.Member;

@WebServlet("/member/memberOne")
public class GetMemberOneController extends HttpServlet {
	private MemberService memberService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// 파라미터 수집
		String memberId = loginMember.getMemberId();
		
		// service
		memberService = new MemberService();
		Member memberOne = memberService.selectMemberOne(memberId);
		
		// 페이지 전환
		if(memberOne != null) {
			System.out.println("회원 상세 정보 가져오기 성공");
			request.setAttribute("memberOne", memberOne);
			request.getRequestDispatcher("/WEB-INF/view/member/memberOne.jsp").forward(request, response);			
		} else {
			System.out.println("회원 상세 정보 가져오기 실패");
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}

}
