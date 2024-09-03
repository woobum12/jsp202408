<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./header.jsp" %>

	<nav>
		<ul>
			<li><a href="./memberList.jsp">회원 목록조회</a></li>
			<li><a href="./memberInsert.jsp">회원 추가</a></li>
		</ul>
	</nav>
	<section>
	<hr>
	<h1>회원 입력 화면</h1>
	
	<form action="./insertProc.jsp" method="post">
		회원이름: <input type="text" name="name"> 회원전화번호: <input
		type="text" name="tel"> <input type="submit" value="회원추가">
		<input type="reset" value="초기화">
	</form>
	
	<a href="./index.jsp">홈으로</a>
	<hr>
	</section>
	
	<%@ include file="./footer.jsp" %>
