package com.kh.tc.customer.model.dao;

import static com.kh.tc.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.tc.customer.model.vo.Customer;

public class CustomerDao {

	private Properties prop = new Properties();

	public CustomerDao() {
		String fileName = CustomerDao.class.getResource("/sql/customer/customer-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Customer loginCheck(Connection con, String userId, String password) {
		Customer loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {

			String query = prop.getProperty("loginCheck");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Customer();
				loginUser.setC_code(rset.getString("c_code"));
				loginUser.setC_id(rset.getString("c_id"));
				loginUser.setC_pwd(rset.getString("c_pwd"));
				loginUser.setC_email(rset.getString("c_email"));
				loginUser.setC_phone(rset.getString("c_phone"));
				loginUser.setC_accout(rset.getString("c_account"));
				loginUser.setJoin_date(rset.getDate("join_date"));
				loginUser.setEnd_yn(rset.getString("end_yn"));
				loginUser.setCerti_name(rset.getString("certi_name"));
				loginUser.setToken(rset.getString("token"));
				loginUser.setLogintype(rset.getString("logintype"));
				loginUser.setC_name(rset.getString("c_name"));
				loginUser.setC_type(rset.getString("c_type"));
				loginUser.setMail_alarm(rset.getString("mail_alarm"));
				loginUser.setSms_alarm(rset.getString("sms_alarm"));
				loginUser.setDelete_reason(rset.getString("delete_reason"));
				loginUser.setIntro_title(rset.getString("intro_title"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);

		}
		return loginUser;
	}

	

	

	

	// 프로필 업데이트
	public int profileUpdate(Connection con, Customer c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("profileUpdate");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getC_type());
			pstmt.setString(2, c.getC_pwd());
			pstmt.setString(3, c.getC_email());
			pstmt.setString(4, c.getC_phone());
			pstmt.setString(5, c.getC_accout());
			pstmt.setString(6, c.getMail_alarm());
			pstmt.setString(7, c.getSms_alarm());
			pstmt.setString(8, c.getC_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteCustomer(Connection con, String userId, String deleteReason) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteCustomer");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deleteReason);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateOtherInfo(Connection con, Customer c) {
		PreparedStatement pstmt = null;
		int result = 0;
		// updateOtherInfo=UPDATE CUSTOMER SET INTRO_TITLE=?, INTRODUCE=?, CAREER=?
		// WHERE C_ID=?
		String query = prop.getProperty("updateOtherInfo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getCerti_name());
			pstmt.setString(2, c.getIntro_title());
			pstmt.setString(3, c.getIntroduce());
			pstmt.setString(4, c.getCareer());
			pstmt.setString(5, c.getC_id());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public String getEmail(Connection con, String c_code) {
		PreparedStatement pstmt = null;
		String email = "";
		ResultSet rset = null;
		String query = prop.getProperty("getEmail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				email = rset.getString("c_email");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return email;
	}

	public int updateAccountYN(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateAccountYN");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateEmailYN(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateEmailYN");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int idCheck(Connection con, String userId) {
		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("idCheck");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int insertMember(Connection con, Customer c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getC_id());
			pstmt.setString(2, c.getC_pwd());
			pstmt.setString(3, c.getC_email());
			pstmt.setString(4, c.getC_name());
			pstmt.setString(5, c.getC_type());
			pstmt.setString(6, c.getC_id());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public String selectUserId(Connection con, String userName, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = "";

		String query = prop.getProperty("selectUserId");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				userId = rset.getString("c_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userId;
	}

	public int updatePwd(Connection con, String number, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updatePwd");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, number);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public Customer selectOne(Connection con, String id) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Customer c = null;

	      String query = prop.getProperty("selectOne");
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, id);

	         rset = pstmt.executeQuery();

	         if (rset.next()) {
	            c = new Customer();
	            c.setC_code(rset.getString("c_code"));
	            c.setC_id(rset.getString("c_id"));
	            c.setC_pwd(rset.getString("c_pwd"));
	            c.setC_email(rset.getString("c_email"));
	            c.setC_phone(rset.getString("c_phone"));
	            c.setC_accout(rset.getString("c_account"));
	            c.setJoin_date(rset.getDate("join_date"));
	            c.setEnd_yn(rset.getString("end_yn"));
	            c.setCerti_name(rset.getString("certi_name"));
	            c.setToken(rset.getString("token"));
	            c.setLogintype(rset.getString("logintype"));
	            c.setC_name(rset.getString("c_name"));
	            c.setOdongCash(rset.getInt("odongcash"));

	         }

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(rset);
	      }

	      return c;
	   }

	   public int insertNaver(Connection con, String id, String email, String actoken) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      int c_code = Integer.parseInt(id);
	      int where = email.indexOf("@");
	      String c_name = email.substring(0, where);

	      String query = prop.getProperty("insertNaver");
	      try {
	         pstmt = con.prepareStatement(query);

	         pstmt.setString(1, c_code + "");
	         pstmt.setString(2, email);
	         pstmt.setString(3, email);
	         pstmt.setString(4, actoken);
	         pstmt.setString(5, c_name);
	         pstmt.setString(6, email);

	         result = pstmt.executeUpdate();
	         System.out.println(result);

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }

	      return result;
	   }

	   public int insertGoogle(Connection con, String id, String name, String email, String actoken) {
	      PreparedStatement pstmt = null;
	      int result = 0;

	      String query = prop.getProperty("insertGoogle");

	      try {
	         pstmt = con.prepareStatement(query);

	         pstmt.setString(1, id + "g");
	         pstmt.setString(2, email);
	         pstmt.setString(3, email);
	         pstmt.setString(4, actoken);
	         pstmt.setString(5, name);
	         pstmt.setString(6, email);

	         result = pstmt.executeUpdate();

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }
}
