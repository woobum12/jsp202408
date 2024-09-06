package controller;

import java.io.IOException;
import java.util.ArrayList;

import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberMoneyVO;

@WebServlet("/memberMoneyList")
public class MemberMoneyListController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//----------money_tbl 테이블에서 회원 매출 자료 select---------
		MemberDao dao = new MemberDao();
		ArrayList<MemberMoneyVO> memberMoneyList = dao.getMemberMoney();
		
		//----------- request객체에 담아서 보내기------------
		request.setAttribute("memberMoneyList", memberMoneyList);
		request.getRequestDispatcher("/memberMoneyList.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			doGet(request, response);
		}
}
