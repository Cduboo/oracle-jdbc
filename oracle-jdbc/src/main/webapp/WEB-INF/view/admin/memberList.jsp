<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	// C
	int rowPerPage = 10;
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// M
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdj58", "java1234");
	System.out.println("오라클 접속 성공");
	
	String sql = "SELECT t2.rnum rnum, t2.name name FROM (SELECT rownum rnum, t.member_name name FROM (SELECT member_name FROM member order by member_name) t) t2 WHERE rnum BETWEEN ? AND ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	int beginRow = (currentPage - 1) * rowPerPage+1;
	int endRow = beginRow + rowPerPage - 1;
	
	stmt.setInt(1, beginRow);
	stmt.setInt(2, endRow);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>멤버목록(페이징)</h1>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()) {
				%>
					<tr>
						<td><%=rs.getInt("rnum")%></td>
						<td><%=rs.getString("name")%></td>
					</tr>
				<%		
					}
				%>
			</tbody>
		</table>
		<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1%>">다음</a>
	</body>
</html>