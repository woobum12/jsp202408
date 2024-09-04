package biz;

import java.io.IOException;

import dao.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVO;

@WebServlet("/insertMember")
public class MemberInsertServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// super.doPost(req, resp); 지워주세요~
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		MemberVO vo = new MemberVO();
		vo.setName(req.getParameter("name"));
		vo.setTel(req.getParameter("tel"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.insertMember(vo);
		
		if (result > 0)
			resp.sendRedirect("listMember");
		else
			resp.sendRedirect("/memberInsert.jsp");
	}
}
