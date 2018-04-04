package com.kh.tc.notice.model.service;

import static com.kh.tc.common.JDBCTemplet.close;
import static com.kh.tc.common.JDBCTemplet.commit;
import static com.kh.tc.common.JDBCTemplet.getConnection;
import static com.kh.tc.common.JDBCTemplet.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.tc.notice.model.dao.noticeDao;
import com.kh.tc.notice.model.vo.notice;

public class noticeService {

	public int insertNotice(notice n, String userCode) {
		Connection con = getConnection();
		int result = new noticeDao().insertNotice(con, n, userCode);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public notice selectOneNotice(int num) {
		Connection con = getConnection();
		notice n = new noticeDao().selectOneNotice(con, num);
		if (n != null) {
			int result = new noticeDao().updateCount(con, n);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		return n;
	}

	public ArrayList<notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectList(con, currentPage, limit);

		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public ArrayList<notice> deleteNotice(String com_code) {
		Connection con = getConnection();
		ArrayList<notice> list = null;
		int result = new noticeDao().deleteNotice(con, com_code);

		if (result > 0) {
			commit(con);
			list = new noticeDao().selectFreeBoardList1(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public ArrayList<notice> deleteUserRequest(String com_code) {
		Connection con = getConnection();
		ArrayList<notice> list = null;
		int result = new noticeDao().deleteNotice(con, com_code);

		if (result > 0) {
			commit(con);
			list = new noticeDao().selectUserRequestList1(con);
			System.out.println("list result>0일때 보이는 list" + list);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public int updateNotice(notice n) {
		Connection con = getConnection();
		int result = new noticeDao().updateNotice(con, n);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int insertFreeBoard(notice n, String userCode) {
		Connection con = getConnection();
		int result = new noticeDao().insertFreeBoard(con, n, userCode);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public ArrayList<notice> selectFreeBoardList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectFreeBoardList(con, currentPage, limit);

		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public ArrayList<notice> selectFreeBoardList1() {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectFreeBoardList1(con);

		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public notice selectOneFreeBoard(int num) {
		Connection con = getConnection();
		notice n = new noticeDao().selectOneFreeBoard(con, num);
		if (n != null) {
			int result = new noticeDao().updateCount(con, n);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		return n;
	}

	public int updateFreeBoard(notice n) {
		Connection con = getConnection();
		int result = new noticeDao().updateFreeBoard(con, n);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int getFreeBoardListCount() {
		Connection con = getConnection();
		int listCount = new noticeDao().getFreeBoardListCount(con);

		close(con);
		return listCount;
	}

	public int insertUserRequest(notice n, String userCode) {
		Connection con = getConnection();
		int result = new noticeDao().insertUserRequest(con, n, userCode);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public ArrayList<notice> selectUserRequestList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectUserRequestList(con, currentPage, limit);

		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public ArrayList<notice> selectUserRequestList1() {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectUserRequestList1(con);

		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public notice selectOneUserRequest(int num) {
		Connection con = getConnection();
		notice n = new noticeDao().selectOneUserRequest(con, num);
		if (n != null) {
			int result = new noticeDao().updateCount(con, n);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		return n;
	}

	public int updateUserRequest(notice n) {
		Connection con = getConnection();
		int result = new noticeDao().updateUserRequest(con, n);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new noticeDao().getListCount(con);

		close(con);
		return listCount;
	}

	public int getUserRequestCount() {
		Connection con = getConnection();
		int listCount = new noticeDao().getUserRequestCount(con);

		close(con);
		return listCount;
	}

	// QNA
	public int insertQnA(notice n, String userCode) {
		Connection con = getConnection();
		int result = new noticeDao().insertQnA(con, n, userCode);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public int getQnAListCount() {
		Connection con = getConnection();
		int listCount = new noticeDao().getQnAListCount(con);

		close(con);
		return listCount;
	}

	public ArrayList<notice> selectQnAList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectQnAList(con, currentPage, limit);
		System.out.println("Service list : " + list);
		if (list != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public notice selectOneQnA(int com_code, String com_name, String QnAPassword) {
		Connection con = getConnection();
		notice n = new noticeDao().selectOneQnA(con, com_code, com_name, QnAPassword);
		if (n != null) {
			int result = new noticeDao().updateCount(con, n);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		}

		close(con);
		return n;
	}

	public ArrayList<notice> selectQnAList1() {
		Connection con = getConnection();
		ArrayList<notice> list = new noticeDao().selectQnAList1(con);

		close(con);
		return list;
	}

	// 패스워드 치는 창으로 넘어가기 전에 아이디와 제목으로 비교해서 가져오기
	public notice getOneQnA(String com_name, int com_code) {
		Connection con = getConnection();
		notice n = new noticeDao().getOneQnA(con, com_name, com_code);

		close(con);
		return n;
	}

	public int insertSingo(String title, String singoId, String content, String cCode) {
		Connection con = getConnection();
		int result = new noticeDao().insertSingo(con, title, singoId, content, cCode);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

}
