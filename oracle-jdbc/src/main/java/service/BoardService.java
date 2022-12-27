package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
	private BoardDao boardDao;
	
	// 게시판 리스트
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage) {
		ArrayList<Board> list = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage - 1) * rowPerPage;
			int endRow = beginRow + rowPerPage - 1;
	
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
			
			// DBUtil -> 오토커밋 false 설정
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	// 게시글 상세 정보
	public Board getBoardOne(int boardNo) {
		Board board = new Board();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			board = boardDao.selectBoardOne(conn, boardNo);
			
			if(board == null) {
				throw new Exception();
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return board;
	}
	
	// 게시글 입력
	public int addBoard(Board board) {
		int row = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			row = boardDao.insertBoard(conn, board);
			
			if(row == 0) {
				throw new Exception();
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}
	
	// 게시글 수정
	public int modifyBoard(Board board) {
		int row = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			row = boardDao.updateBoard(conn, board);
			
			if(row == 0) {
				throw new Exception();
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}
	
	// 게시글 삭제
	public int removeBoard(int boardNo) {
		int row = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			row = boardDao.deleteBoard(conn, boardNo);
			
			if(row == 0) {
				throw new Exception();
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}
}
