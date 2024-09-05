<%@page import="vo.MemberVO" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./header.jsp" %>

<%
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList");
%>
<section>
	<div class="container">
		<h3 class="title">회원 목록 조회/수정/삭제</h3>
		<table>
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>회원전화</td>
				<td>회원주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
				<td>[삭제]</td>
			</tr>
			<%
				if (memberList != null) {
					for (MemberVO dat : memberList) {
			%>
			<tr>
				<td>
					<a href="/memberUpdateForm.jsp?custno=<%=dat.getCustno() %>">
						<%=dat.getCustno() %></a></td>
					<td><%=dat.getCustname() %></td>
					<td><%=dat.getPhone() %></td>
					<td><%=dat.getAddress() %></td>
					<td><%=dat.getJoindate() %></td>
					<td><%=dat.getGrade() %></td>
					<td><%=dat.getCity() %></td>
					<td><a href="/memberDelete?custno=<%=dat.getCustno()%>"></a></td>
					</tr>
				<%
						}
						}
				%>
				
			</table>
			<p>회원 매출 정보가 남아있는 회원은 삭제할 수 없음</p>
			</div>
		</section>
		
		<%@ include file="./footer.jsp"%>
		</table>
	</div>
</section>
