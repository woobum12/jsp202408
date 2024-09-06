<%@page import="vo.MemberMoneyVO" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./header.jsp"%>

<%
	ArrayList<MemberMoneyVO> memberMoneyList
	= (ArrayList<MemberMoneyVO>) request.getAttribute("memberMoneyList");
%>
<section>
	<div class ="container">
		<h3 class="title">회원 매출 조회</h3>
		<table>
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
				if (memberMoneyList != null) {
					for (MemberMoneyVO dat : memberMoneyList) {				
			%>
			<tr>
				<td><%=dat.getCustno() %></td>
				<td><%=dat.getCustname() %></td>
				<td><%=dat.getGrade() %></td>
				<td><%=dat.getPrice() %> </td>
			</tr>
			<%
					}
				}
			%>
				
		</table>
	</div>
</section>

<%@ include file="./footer.jsp"%>
