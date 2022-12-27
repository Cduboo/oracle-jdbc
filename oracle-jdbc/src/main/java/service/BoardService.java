package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
	private BoardDao boardDao;
	
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
}
