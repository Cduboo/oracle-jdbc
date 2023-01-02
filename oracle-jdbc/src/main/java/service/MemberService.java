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
			
			if(memberDao.memberIdCk(conn, member.getMemberId())) { // 중복이 아닐 시 회원가입
				row = memberDao.insertMember(conn, member);				
			} else { // 중복 아이디 -1
				return -1;
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
	
	// 회원 상세 정보
	public Member selectMemberOne(String memberId) {
		Member member = null;
		Connection conn = null;
		
		try {
			this.memberDao = new MemberDao();
			conn = DBUtil.getConnection();
			member = memberDao.selectMemberOne(conn, memberId);
			
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
		
		return member;
	}
	
	// 회원 정보 수정
	public int updateMember(Member member) {
		int row = 0;
		Connection conn = null;
		
		try {
			this.memberDao = new MemberDao();
			conn = DBUtil.getConnection();
			row = memberDao.updateMember(conn, member);
			
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
	
	// 회원 비밀번호 수정
	public int updateMemberPw(String memberId, String memberPw, String newMemberPw) {
		int row = 0;
		Connection conn = null;
		
		try {
			this.memberDao = new MemberDao();
			conn = DBUtil.getConnection();
			row = memberDao.updateMemberPw(conn, memberId, memberPw, newMemberPw);
			
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
	
	// 회원 탈퇴
	public int deleteMember(Member member) {
		int row = 0;
		Connection conn = null;
		
		try {
			this.memberDao = new MemberDao();
			conn = DBUtil.getConnection();
			row = memberDao.deleteMember(conn, member);
			
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
