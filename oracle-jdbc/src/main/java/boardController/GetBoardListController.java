package boardController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/boardList")
public class GetBoardListController extends HttpServlet {
	private BoardService boardServiece;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 상태라면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 비로그인 상태
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// 파라미터 수집
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		String search = "";
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		// service - list
		this.boardServiece = new BoardService();
		ArrayList<Board> list = boardServiece.getBoardListByPage(currentPage, rowPerPage, search);
		int boardCount = boardServiece.getBoardCount(search);
		
		// 객체 바인딩 
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("search", search);
		
		// forward
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}

}
