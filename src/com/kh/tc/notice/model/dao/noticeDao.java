package com.kh.tc.notice.model.dao;

import static com.kh.tc.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.tc.notice.model.vo.notice;

public class noticeDao {
	private Properties prop = new Properties();

	public noticeDao() {
		String fileName = noticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertNotice(Connection con, notice n, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertNotice");
		// INSERT INTO COMMUNITY
		// VALUES(COM_SEQ.NEXTVAL,'notice',null,?,?,sysdate,?,null,null)
		System.out.println("dao userCode : " + userCode);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getCom_name());
			pstmt.setString(2, n.getCom_content());
			pstmt.setString(3, userCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public notice selectOneNotice(Connection con, int num) {
		notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			System.out.println("Dao num : " + num);
			if (rset.next()) {
				n = new notice();

				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setC_code(rset.getString("c_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
			}
			System.out.println(n);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return n;
	}

	public int updateCount(Connection con, notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, n.getCom_code());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public ArrayList<notice> selectList(Connection con, int currentPage, int limit) {
		ArrayList<notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectList");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			System.out.println("startRow : " + startRow);
			System.out.println("endRow : " + endRow);
			// where rnum between ? and ?
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			list = new ArrayList<notice>();

			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));

				list.add(n);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteNotice(Connection con, String com_code) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteNotice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, com_code);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateNotice(Connection con, notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateNotice");
		// UPDATE COMMUNITY SET COM_NAME=?, COM_CONTENT=?,COM_DATE=? WHERE COM_CODE=?

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getCom_name());
			pstmt.setString(2, n.getCom_content());
			pstmt.setString(3, n.getCom_date());
			pstmt.setInt(4, n.getCom_code());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public int insertFreeBoard(Connection con, notice n, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertFreeBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, n.getCate_code());
			pstmt.setString(2, n.getCom_name());
			pstmt.setString(3, n.getCom_content());
			pstmt.setString(4, userCode);
			pstmt.setString(5, n.getCate_name());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<notice> selectFreeBoardList(Connection con, int currentPage, int limit) {
		ArrayList<notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectFreeBoardList");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			System.out.println("startRow : " + startRow);
			System.out.println("endRow : " + endRow);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			list = new ArrayList<notice>();

			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public notice selectOneFreeBoard(Connection con, int num) {
		notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneFreeBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			System.out.println("Dao num : " + num);
			if (rset.next()) {
				n = new notice();

				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setC_code(rset.getString("c_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
			}

			System.out.println(n);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return n;
	}

	public int updateFreeBoard(Connection con, notice n) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateFreeBoard");
		// updateFreeBoard=UPDATE COMMUNITY SET COM_NAME=?, COM_CONTENT=?, COM_DATE=?,
		// CATE_NAME=? WHERE COM_CODE=?
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getCom_name());
			pstmt.setString(2, n.getCom_content());
			pstmt.setString(3, n.getCom_date());
			pstmt.setString(4, n.getCate_name());
			pstmt.setInt(5, n.getCom_code());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertUserRequest(Connection con, notice n, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertUserRequest");
		// insertFreeBoard=INSERT INTO COMMUNITY
		// VALUES(COM_SEQ.NEXTVAL,'freeboard',?,?,?,sysdate,?,0,default,null)
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, n.getCate_code());
			pstmt.setString(2, n.getCom_name());
			pstmt.setString(3, n.getCom_content());
			pstmt.setString(4, userCode);
			pstmt.setString(5, n.getCate_name());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<notice> selectUserRequestList(Connection con, int currentPage, int limit) {
		ArrayList<notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectUserRequestList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<notice>();

			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				list.add(n);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<notice> selectUserRequestList1(Connection con) {
		ArrayList<notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectUserRequestList1");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<notice>();

			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public notice selectOneUserRequest(Connection con, int num) {
		notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneUserRequest");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				n = new notice();

				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setC_code(rset.getString("c_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
			}
			System.out.println(n);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return n;
	}

	public int updateUserRequest(Connection con, notice n) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateUserRequest");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getCom_name());
			pstmt.setString(2, n.getCom_content());
			pstmt.setString(3, n.getCom_date());
			pstmt.setString(4, n.getCate_name());
			pstmt.setInt(5, n.getCom_code());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// for Paging
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("listCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public int getFreeBoardListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("FreeBoardlistCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<notice> selectFreeBoardList1(Connection con) {
		ArrayList<notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectFreeBoardList1");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<notice>();

			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int getUserRequestCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("UserRequestCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public int insertQnA(Connection con, notice n, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertQnA");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getCom_name());
			pstmt.setString(2, n.getCom_content());
			pstmt.setString(3, userCode);
			pstmt.setString(4, n.getFileName());
			pstmt.setString(5, n.getQnaPassword());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int getQnAListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("QnAlistCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<notice> selectQnAList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<notice> list = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectQnAList");

		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<notice>();
			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				n.setQnaPassword(rset.getString("QNAPASSWORD"));
				list.add(n);
			}
			System.out.println("dao list : " + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<notice> selectQnAList1(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<notice> list = null;
		String query = prop.getProperty("selectQnAList1");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while (rset.next()) {
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setCom_num(rset.getInt("r"));
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				n.setQnaPassword(rset.getString("QNAPASSWORD"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public notice selectOneQnA(Connection con, int com_code, String com_name, String QnAPassword) {
		PreparedStatement pstmt = null;
		notice n = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneQnA");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, com_code);
			pstmt.setString(2, com_name);
			pstmt.setString(3, QnAPassword);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setC_code(rset.getString("c_code"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				/* n.setCom_num(rset.getInt("r")); */
				n.setCate_name(rset.getString("cate_name"));
				n.setC_id(rset.getString("c_id"));
				n.setQnaPassword(rset.getString("qnapassword"));
				n.setFileName(rset.getString("file_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return n;
	}

	// 패스워드 치는 창으로 넘어가기 전에 아이디와 제목으로 비교해서 가져오기
	public notice getOneQnA(Connection con, String com_name, int com_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		notice n = null;
		String query = prop.getProperty("getOneQnA");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, com_name);
			pstmt.setInt(2, com_code);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setQnaPassword(rset.getString("qnapassword"));
				n.setFileName(rset.getString("file_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return n;
	}

	public int insertSingo(Connection con, String title, String singoId, String content, String cCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSingo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, cCode);
			pstmt.setString(4, singoId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		System.out.println("졸려"+result);
		
		return result;
	}



}
