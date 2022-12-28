package boardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/insertBoard")
public class AddBoardController extends HttpServlet {
	private BoardService boardService;
	
	// 게시판 글 쓰기 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/board/insertBoardForm.jsp").forward(request, response);	
	}
	
	// 게시판 글 쓰기 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// 파라미터 수집
		request.setCharacterEncoding("utf-8");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String memberId = loginMember.getMemberId();
		
		// vo
		Board board = new Board();
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setMemberId(memberId);
		
		// service
		this.boardService = new BoardService();
		int row = boardService.addBoard(board);
		
		// redirect
		if(row == 1) {
			System.out.println("게시글 추가 성공");
			response.sendRedirect(request.getContextPath() + "/board/boardList");
		} else {
			System.out.println("게시글 추가 실패");
			response.sendRedirect(request.getContextPath() + "/board/insertBoard");
		}
	}

}
