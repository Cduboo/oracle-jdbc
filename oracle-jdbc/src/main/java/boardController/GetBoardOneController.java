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

@WebServlet("/board/boardOne")
public class GetBoardOneController extends HttpServlet {
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
		Board boardOne = boardService.getBoardOne(boardNo);
		
		// view 메뉴구성
		// 수정/ 삭제 조건 -> 로그인멤버 == 글쓴멤버 
		
		// 객체 바인딩 -> forward
		request.setAttribute("boardOne", boardOne);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp");
		rd.forward(request, response);
	}

}
