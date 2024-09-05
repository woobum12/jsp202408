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
					<td><input type="text" value="<%=vo.getCustname() %>"
			</table>
		</form>
	</div>
</section>