<%@page import="dao.MemberDao" %>
<%@page import="vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./header.jsp"%>

<%
	// ---------- request객체의 회원번호----------
	int custno = Integer.parseInt(request.getParameter("custno"));
	
	// ----------------- member_tbl 테이블에서 회원자료 select ----------------
	MemberDao dao = new MemberDao();
	MemberVO vo = dao.getMemberSelected(custno);
%>
<section>
	<div class="container">
		<h3 class="title">회원 목록 수정 </h3>
		<form action="/memberUpdate" method="post">
			<table>
				<tr>
					<td>회원번호</td>
					<td><input type="number" value="<%=vo.getCustno() %>" name="custno"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원설명</td>
					<td><input type="text" value="<%=vo.getCustname() %>" name="custname"></td>
				</tr>
			<tr>
    <td>회원전화</td>
    <td><input type="text" value="<%=vo.getPhone()%>" name="phone"></td>
</tr>
<tr>
    <td>회원주소</td>
    <td><input type="text" value="<%=vo.getAddress()%>" name="address"></td>
</tr>
<tr>
    <td>가입일자</td>
    <td><input type="date" value="<%=vo.getJoindate()%>" name="joindate"></td>
</tr>
<tr>
    <td>고객등급</td>
    <td><input type="text" value="<%=vo.getGrade()%>" name="grade"></td>
</tr>
<tr>
    <td>거주지역</td>
    <td><input type="text" value="<%=vo.getCity()%>" name="city"></td>
</tr>
<tr>
    <td colspan="2" align="center"><input type="submit" value="수정">
        <a href="/memberList"><input type="button" value="조회"></a>
    </td>
</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="./footer.jsp" %>