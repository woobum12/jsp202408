package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtils;
import oracle.jdbc.proxy.annotation.Pre;
import vo.MemberVO;

public class MemberDao {

	/*
	 * ===============회원목록조회
	 */
	public ArrayList<MemberVO> getMember() {
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO> ();
		//DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = DBUtils.getConnection();
		String sql = "SELECT custno, custname, phone, address, joindate, \r \n"
				+ "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, city \r \n"
				+ "FROM member_tbl \r \n"
				+ "ORDER BY custno";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				list.add(vo);
			}
		} catch(SQLException e) {
			System.out.println("-------회원목록조회중 오류-------");
			e.printStackTrace();
		}
		
		return list;
	}
	/*
	 *  //======== 회원_번호_조회=================
	 */
	public int getMaxNo() {
		
		int nextCustNO = 0;
		//DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = DBUtils.getConnection();
		String sql = "SELECT MAX(custno)+1 nextCustNO FROM member_tbl";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				nextCustNO = rs.getInt("nextCustNO");
			}
		} catch (SQLException e) {
			System.out.println("---------회원_번호_조회중 오류----------");
			e.printStackTrace();
		} finally {
			DBUtils.close(conn, ps, rs);
		}
		
		return nextCustNO;
	}
	/*
	 *  //=========== 회원 목록 추가===================
	 */
	public int insertMember (MemberVO vo) {
		
		int result = 0;
		//DB
		Connection conn = null;
		PreparedStatement ps = null;
		conn = DBUtils.getConnection();
		String sql = "INSERT INTO member_tbl VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getCustno());
			ps.setString(2, vo.getCustname());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getAddress());
			ps.setDate(5, vo.getJoindate());
			ps.setString(6, vo.getGrade());
			ps.setString(7, vo.getCity());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("------- 회원목록추가중 오류--------");
			e.printStackTrace();
		} finally {
			DBUtils.close(conn, ps);
		}
		
		return result;
	}
	/*
	 *  //========= 선택한 회원조회 ===================
	 */
	public MemberVO getMemberSelected(int custno) {
		
		MemberVO vo = new MemberVO();
		//DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = DBUtils.getConnection();
		String sql = "SELECT * FROM member_tbl where custno="+custno;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
			}
		} catch (SQLException e) {
			System.out.println("---------- 선택한 회원조회중 오류--------");
			e.printStackTrace();
		} finally {
			DBUtils.close(conn, ps, rs);
		}
		
		return vo;
	}
}
