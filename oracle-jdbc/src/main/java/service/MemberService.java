package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	
	// 회원가입
	public int addMember(Member member) {
		int row = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			memberDao = new MemberDao();
			row = memberDao.insertMember(conn, member);
			
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
	
	// 로그인
	public Member login(Member paramMember) {
		Member resultMember = null;
		Connection conn = null;
		
		try {
			this.memberDao = new MemberDao();
			conn = DBUtil.getConnection();
			resultMember = memberDao.login(conn, paramMember);
			
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
		
		return resultMember;
	}
}
