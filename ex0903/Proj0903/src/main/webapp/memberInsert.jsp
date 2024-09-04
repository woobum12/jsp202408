<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="./header.jsp"%>
    <%@ include file="./menu.jsp"%>
    
    <section>
    	<hr>
    	<h1>회원 입력 화면</h1>
    	
    	<form action="/insertMember" method="post">
    		회원이름: <input type="text" name="name"> 회원전화번호: <input type="text" name="tel">
    		<input type="submit" value="회원추가">
    		<input type="reset" value="초기화">
    	</form>
    </section>