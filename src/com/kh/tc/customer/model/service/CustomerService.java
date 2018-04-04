package com.kh.tc.customer.model.service;

import static com.kh.tc.common.JDBCTemplet.close;
import static com.kh.tc.common.JDBCTemplet.commit;
import static com.kh.tc.common.JDBCTemplet.getConnection;
import static com.kh.tc.common.JDBCTemplet.rollback;

import java.sql.Connection;

import com.kh.tc.customer.model.dao.CustomerDao;
import com.kh.tc.customer.model.vo.Customer;

public class CustomerService {

	public Customer loginCheck(String userId, String password) {
		Connection con = getConnection();
		Customer loginUser = new CustomerDao().loginCheck(con, userId, password);
		return loginUser;
	}

	public Customer selectOne(String id) {
		Connection con = getConnection();

		Customer c = new CustomerDao().selectOne(con, id);

		close(con);

		return c;
	}

	public Customer insertNaver(String id, String email, String actoken) {

		Connection con = getConnection();
		int result = 0;
		Customer c = null;

		result = new CustomerDao().insertNaver(con, id, email, actoken);
		if (result > 0) {
			commit(con);
			c = new CustomerDao().selectOne(con, id);
		} else {
			rollback(con);

		}

		close(con);
		return c;
	}

	public Customer insertGoogle(String id, String name, String email, String actoken) {
		Connection con = getConnection();
		int result = 0;
		Customer c = null;

		result = new CustomerDao().insertGoogle(con, id, name, email, actoken);
		if (result > 0) {
			commit(con);
			c = new CustomerDao().selectOne(con, id + "g");
		} else {
			rollback(con);

		}

		close(con);
		return c;
	}

	public int profileUpdate(Customer c) {
		Connection con = getConnection();
		int result = new CustomerDao().profileUpdate(con, c);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public int deleteCustomer(String userId, String deleteReason) {
		Connection con = getConnection();
		int result = new CustomerDao().deleteCustomer(con, userId, deleteReason);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public int updateOtherInfo(Customer c) {
		Connection con = getConnection();
		int result = new CustomerDao().updateOtherInfo(con, c);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public String getEmail(String c_code) {
		Connection con = getConnection();
		String email = new CustomerDao().getEmail(con, c_code);
		close(con);
		return email;
	}

	public int updateAccountYN(String userId) {
		Connection con = getConnection();
		int result = new CustomerDao().updateAccountYN(con, userId);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int updateEmailtYN(String userId) {
		Connection con = getConnection();
		int result = new CustomerDao().updateEmailYN(con, userId);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int idCheck(String userId) {
		Connection con = getConnection();

		int result = new CustomerDao().idCheck(con, userId);

		close(con);

		return result;
	}

	public int insertmember(Customer c) {
		Connection con = getConnection();

		int result = new CustomerDao().insertMember(con, c);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public String selectUserId(String userName, String email) {
		Connection con = getConnection();
		String userId = new CustomerDao().selectUserId(con, userName, email);

		close(con);
		return userId;
	}

	public int updatePwd(String shaPwd, String userId) {
		Connection con = getConnection();
		int result = new CustomerDao().updatePwd(con, shaPwd, userId);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

}
