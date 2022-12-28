package dao;

import java.sql.*;
import vo.Member;

public class MemberDao {
	// 회원가입
	public int insertMember(Connection conn, Member member) throws Exception {
		String sql = "INSERT INTO member(member_id, member_pw, member_name, updatedate, createdate) VALUES(?, ?, ?, SYSDATE, SYSDATE)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		int row = stmt.executeUpdate(); 
		
		stmt.close();
		
		return row;
	}
	
	// 로그인
	public Member login(Connection conn, Member paramMember) throws Exception {
		String sql = "SELECT member_id memberId, member_name memberName FROM member WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		
		Member resultMember = null; 
		if(rs.next()) {
			resultMember = new Member();
			resultMember.setMemberId(rs.getString("memberId"));
			resultMember.setMemberName(rs.getString("memberName"));
		}
		
		rs.close();
		stmt.close();
		
		return resultMember;
	}
	
	// 회원 상세정보
	public Member selectMemberOne(Connection conn, String memberId) throws Exception {
		String sql = "SELECT member_id memberId, member_name memberName, createdate FROM member WHERE member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		ResultSet rs = stmt.executeQuery();
		
		Member member = null;
		if(rs.next()) {
			member = new Member();
			member.setMemberId("memberId");
			member.setMemberName("memberName");
			member.setCreateadate("createdate");
		}
		
		rs.close();
		stmt.close();
		
		return member;
	}
	
	// 회원 정보 수정
	public int updateMember(Connection conn, Member member) throws Exception {
		String sql = "UPDATE member SET member_name = ? WHERE member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberName());
		stmt.setString(2, member.getMemberId());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// 회원 비밀번호 수정
	public int updateMemberPw(Connection conn, String memberId, String memberPw, String newMemberPw) throws Exception {
		String sql = "UPDATE member SET member_pw = ? WHERE member_id = ? AND  member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newMemberPw);
		stmt.setString(2, memberId);
		stmt.setString(3, memberPw);
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	// 회원 탈퇴
	public int deleteMember(Connection conn, Member member) throws Exception {
		String sql = "DELETE FROM member WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		int row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
}
