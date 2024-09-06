package controller;

import java.io.IOException;
import java.io.PrintWriter;

import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberMoneyVO;
import vo.MemberVO;

@WebServlet("/memberDelete")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		
		MemberDao dao = new MemberDao();
		int result = dao.deleteMember(custno);
		if (result <= 0) {
			out.println("<script>alert('회원 삭제 실패');</script>");
		}
		response.sendRedirect("/memberList");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
