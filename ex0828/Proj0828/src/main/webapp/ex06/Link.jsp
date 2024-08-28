<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%">
	<tr>
	<td align="center">
	<!-- 로그인 여부에 따른 메뉴 변화 -->
	<% if (session.getAttribute("UserId")== null) {%>
		<a href="loginForm.jsp">로그인</a>
	<% } else { %>
		<a href ="logout.jsp">로그아웃</a>
	<% } %>
	<!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
	&npsp;&npsp;&npsp; <!-- 메뉴 사이의 공백(space) 확보용 특수 문자 -->
	<a href="../ex08/list.jsp">게시판(페이징X)</a>
	&npsp;&npsp;&npsp;
	<a href="../ex09/list.jsp">게시판(페이징O)</a>
</td>
</tr>
</table>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>