package vo;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String updatedate;
	private String createadate;
	
	public Member() {
		super();
	}
	
	public Member(String memberId, String memberPw, String memberName, String updatedate, String createadate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.updatedate = updatedate;
		this.createadate = createadate;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getCreateadate() {
		return createadate;
	}
	public void setCreateadate(String createadate) {
		this.createadate = createadate;
	}
}
