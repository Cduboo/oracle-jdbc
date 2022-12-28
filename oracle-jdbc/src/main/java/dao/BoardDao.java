package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Board;

public class BoardDao {
	// 리스트(페이징,검색)
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow, String search) throws Exception {
		ArrayList<Board> list = new ArrayList<>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, createdate"
				+ "			FROM (SELECT board_no, board_title, createdate"
				+ "					FROM board ORDER BY TO_NUMBER(board_no) DESC))"
				+ " WHERE rnum BETWEEN ? AND ? AND board_title LIKE ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		stmt.setString(3, "%" + search + "%");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		
		rs.close();
		stmt.close();
		
		return list;
	}
	
	// 전체 게시글 개수
	public int selectBoardCount(Connection conn, String search) throws Exception {
		String sql = "SELECT COUNT(*) count FROM board WHERE board_title LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + search + "%");
		ResultSet rs = stmt.executeQuery();
		
		int boardCount = 0;
		if(rs.next()) {
			boardCount = rs.getInt("count");
		}
		
		return boardCount;
	}
	
	// 게시글 상세 정보
	public Board selectBoardOne(Connection conn, int boardNo) throws Exception {
		String sql = "SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, updatedate, createdate FROM board WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		
		Board board = null;
		if(rs.next()) {
			board = new Board();
			board.setBoardNo(rs.getInt("boardNo"));
			board.setBoardTitle(rs.getString("boardTitle"));
			board.setBoardContent(rs.getString("boardContent"));
			board.setMemberId(rs.getString("memberId"));
			board.setUpdatedate(rs.getString("updatedate"));
			board.setCreatedate(rs.getString("createdate"));
		}
		
		rs.close();
		stmt.close();
		
		return board;
	}
	
	// 게시글 입력
	public int insertBoard(Connection conn, Board board) throws Exception {
		String sql = "INSERT INTO board(board_no, board_title, board_content, member_id, updatedate, createdate) VALUES(board_seq.nextval, ?, ?, ?, SYSDATE, SYSDATE)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// 게시글 수정
	public int updateBoard(Connection conn, Board board) throws Exception {
		String sql = "UPDATE board SET board_title = ?, board_content = ? WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setInt(3, board.getBoardNo());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// 게시글 삭제
	public int deleteBoard(Connection conn, int boardNo) throws Exception {
		String sql = "DELETE FROM board WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
}
