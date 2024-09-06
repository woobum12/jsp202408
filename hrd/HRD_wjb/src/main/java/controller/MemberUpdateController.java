package controller;

import java.io.IOException;
import java.sql.Date;

import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVO;

@WebServlet("/memberUpdate")
public class MemberUpdateController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// --------------- <form>에서 전달받은 데이터를 VO에 저장 -------------
		MemberVO vo = new MemberVO();
		vo.setCustno(Integer.parseInt(request.getParameter("custno")));
		vo.setCustname(request.getParameter("custname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setAddress(request.getParameter("address"));
		vo.setJoindate(Date.valueOf(request.getParameter("joindate")));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));
		
		// ------------ member_tbl 테이블에서 회원 자료 update ------------
		MemberDao dao = new MemberDao();
		int result = dao.updateMember(vo);
		
		// ----------- update성공시에 회원 조회화면으로 전환 ---------
		if(result>0) {
			response.sendRedirect("/memberList");
		} else {
			response.sendRedirect("/memberUpdateForm.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
