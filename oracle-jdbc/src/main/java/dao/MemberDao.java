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
		
		stmt.close();
		rs.close();
		
		return resultMember;
	}
}
