package boardController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/updateBoard")
public class ModifyBoardController extends HttpServlet {
	private BoardService boardService;
	
	// 글 수정 폼
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
		Board boardOne = boardService.getBoardOne(boardNo);
		
		// 객체 바인딩
		request.setAttribute("boardOne", boardOne);
		
		// forward
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/updateBoardForm.jsp");
		rd.forward(request, response);
	}
	
	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/memeber/login");
			return;
		}
		
		// 파라미터 수집
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		// vo
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		
		// service 
		this.boardService = new BoardService();
		int row = boardService.modifyBoard(board);
		
		// redirect
		if(row == 1) {
			System.out.println("수정 성공");
			response.sendRedirect(request.getContextPath() + "/board/boardList");
		} else {
			System.out.println("수정 실패");
			response.sendRedirect(request.getContextPath() + "/board/updateBoard");
		}
	}

}
