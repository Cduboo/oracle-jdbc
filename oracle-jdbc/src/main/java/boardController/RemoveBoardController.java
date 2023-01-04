package boardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Member;

@WebServlet("/board/deleteBoard")
public class RemoveBoardController extends HttpServlet {
	private BoardService boardService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}	
		
		// 파라미터 수집
		if(request.getParameter("boardNo") == null || ("").equals(request.getParameter("boardNo"))) {
			response.sendRedirect(request.getContextPath() + "/board/boardList");
			return;
		}
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// service
		this.boardService = new BoardService();
		int row = boardService.removeBoard(boardNo);
	
		if(row == 1) {
			System.out.println("삭제 성공");
			response.sendRedirect(request.getContextPath() + "/board/boardList");
		} else {
			System.out.println("삭제 실패");
			response.sendRedirect(request.getContextPath() + "/board/deleteBoard");
		}
	}
}
