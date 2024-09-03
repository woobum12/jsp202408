<%@page import="dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberDAO dao = new MemberDAO();
    
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    //out.print(name);
    
    int cnt = dao.insertMember(name, tel);
    
    if (cnt > 0)
    	//멤버추가 성공시에 1값을 받는다
    	response.sendRedirect("./memberList.jsp");
    else
    	out.print("<script>history.back();</script>");
    %>