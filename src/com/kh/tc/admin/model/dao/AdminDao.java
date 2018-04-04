package com.kh.tc.admin.model.dao;

import java.io.FileNotFoundException;



import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.tc.common.JDBCTemplet.*;

import com.kh.tc.IncomeRecord.model.vo.IncomeRecord;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.message.model.dao.MessageDao;
import com.kh.tc.notice.model.vo.notice;
import com.kh.tc.pay.model.vo.Pay;
import com.kh.tc.product.model.vo.product;

public class AdminDao {

	private Properties prop = new Properties();
	
	public AdminDao(){
		String fileName = MessageDao.class.getResource("/sql/admin/admin.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int talMember(Connection con, String talId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("talMember");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, talId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public ArrayList<notice> selectBlackRequest(Connection con) {
		Statement stmt = null;
		ArrayList<notice> noList = new ArrayList<notice>();
		ResultSet rset = null;
		String query = prop.getProperty("selectBlackRequest");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				notice n = new notice();
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setC_id(rset.getString(7));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setQnaPassword(rset.getString("QNAPASSWORD"));
				noList.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return noList;
	}

	public notice selectBlackMember(Connection con, int comCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		notice n = new notice();
		String query = prop.getProperty("selectBlackMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, comCode);
			rset = pstmt.executeQuery();
			if(rset.next()){
				n.setCom_code(rset.getInt("com_code"));
				n.setCom_type(rset.getString("com_type"));
				n.setCate_code(rset.getInt("cate_code"));
				n.setCom_name(rset.getString("com_name"));
				n.setCom_content(rset.getString("com_content"));
				n.setCom_date(rset.getString("com_date"));
				n.setC_id(rset.getString("c_id"));
				n.setCom_count(rset.getInt("com_count"));
				n.setCom_status(rset.getString("com_status"));
				n.setFileName(rset.getString("file_name"));
				n.setCate_name(rset.getString("cate_name"));
				n.setQnaPassword(rset.getString("QNAPASSWORD"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return n;
	}

	public Customer selectBadUser(Connection con, String badUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Customer c = null;
		String query = prop.getProperty("selectBadUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(2, badUserId);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
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
				c.setC_type(rset.getString("c_type"));
				c.setMail_alarm(rset.getString("mail_alarm"));
				c.setSms_alarm(rset.getString("sms_alarm"));
				c.setDelete_reason(rset.getString("delete_reason"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return c;
	}

	public ArrayList<Customer> allTalRequestMemberList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Customer> coList = new ArrayList<Customer>();
		String query = prop.getProperty("allTalRequestMemList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				Customer c = new Customer();
				c.setC_code(rset.getString("c_code"));
				c.setC_id(rset.getString(2));
				c.setC_pwd(rset.getString(3));
				c.setC_email(rset.getString(4));
				c.setC_phone(rset.getString(5));
				c.setC_accout(rset.getString(6));
				c.setJoin_date(rset.getDate(7));
				c.setEnd_yn(rset.getString(8));
				c.setCerti_name(rset.getString(9));
				c.setToken(rset.getString(10));
				c.setLogintype(rset.getString(11));
				c.setC_name(rset.getString(12));
				c.setC_type(rset.getString(13));
				c.setMail_alarm(rset.getString(14));
				c.setSms_alarm(rset.getString(15));
				c.setDelete_reason(rset.getString(16));
				c.setOdongCash(rset.getInt(22));
				c.setDealingCount(rset.getInt(23));
				coList.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return coList;
	}

	public Customer selectTalUser(Connection con, String talId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTalUser");
		Customer c = null;
		System.out.println(talId);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, talId);
			pstmt.setString(2, talId);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				c = new Customer();
				c.setC_id(rset.getString(2));
				c.setC_pwd(rset.getString(3));
				c.setC_email(rset.getString(4));
				c.setC_phone(rset.getString(5));
				c.setC_accout(rset.getString(6));
				c.setJoin_date(rset.getDate(7));
				c.setEnd_yn(rset.getString(8));
				c.setCerti_name(rset.getString(9));
				c.setToken(rset.getString(10));
				c.setLogintype(rset.getString(11));
				c.setC_name(rset.getString(12));
				c.setC_type(rset.getString(13));
				c.setMail_alarm(rset.getString(14));
				c.setSms_alarm(rset.getString(15));
				c.setDelete_reason(rset.getString(16));
				c.setOdongCash(rset.getInt(22));
				c.setDealingCount(rset.getInt(23));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		System.out.println("c"+c);
		return c;
	}

	public ArrayList<product> selectAllRequestProduct(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<product> prList = new ArrayList<product>();
		
		String query = prop.getProperty("selectAllRequestProduct");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				product p = new product();
				p.setP_code(Integer.parseInt(rset.getString("p_code")));
				p.setP_type(rset.getString("p_type"));
				p.setCate_code(rset.getInt("cate_code"));
				p.setP_name(rset.getString("p_name"));
				p.setP_content(rset.getString("p_content"));
				p.setP_share_count(rset.getInt("p_share_count"));
				p.setPhone(rset.getString("phone"));
				p.setP_status(rset.getString("p_status"));
				p.setP_price(rset.getInt("p_price"));
				p.setC_code(rset.getString(1));
				p.setP_date(rset.getDate("p_date"));
				p.setAd_code(rset.getInt("ad_code"));
				p.setStar_point(rset.getFloat("star_point"));
				p.setP_simplecontent(rset.getString("p_simplecontent"));
			
				prList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		return prList;
	}

	public ArrayList<product> SelectDeleteRequestProductList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<product> prList = new ArrayList<product>();
		String query = prop.getProperty("selectDeleteRequestProductList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				product p = new product();
				
				p.setP_code(Integer.parseInt(rset.getString("p_code")));
				p.setP_type(rset.getString("p_type"));
				p.setCate_code(rset.getInt("cate_code"));
				p.setP_name(rset.getString("p_name"));
				p.setP_content(rset.getString("p_content"));
				p.setP_share_count(rset.getInt("p_share_count"));
				p.setPhone(rset.getString("phone"));
				p.setP_status(rset.getString("p_status"));
				p.setP_price(rset.getInt("p_price"));
				p.setC_code(rset.getString("c_id"));
				p.setP_date(rset.getDate("p_date"));
				p.setAd_code(rset.getInt("ad_code"));
				p.setStar_point(rset.getFloat("star_point"));
				p.setP_simplecontent(rset.getString("p_simplecontent"));
				p.setDealingCount(rset.getInt(19));
				
				prList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		System.out.println("악~~~~~~~~~~~"+prList.size());
		return prList;
	}

	public int requestProductAgree(Connection con, String pCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("requestProductAgree");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pCode);
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public product selectRequestProductDetail(Connection con, String pCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		product p = null;
		String query = prop.getProperty("selectRquestProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p = new product();
				p.setP_code(Integer.parseInt(rset.getString("p_code")));
				p.setP_type(rset.getString("p_type"));
				p.setCate_code(rset.getInt("cate_code"));
				p.setP_name(rset.getString("p_name"));
				p.setP_content(rset.getString("p_content"));
				p.setP_share_count(rset.getInt("p_share_count"));
				p.setPhone(rset.getString("phone"));
				p.setP_status(rset.getString("p_status"));
				p.setP_price(rset.getInt("p_price"));
				p.setC_code(rset.getString(1));
				p.setP_date(rset.getDate("p_date"));
				p.setAd_code(rset.getInt("ad_code"));
				p.setStar_point(rset.getFloat("star_point"));
				p.setP_simplecontent(rset.getString("p_simplecontent"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public ArrayList<IncomeRecord> selectAllMoneyOutRequestList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<IncomeRecord> cList = new ArrayList<IncomeRecord>();
		String query = prop.getProperty("selectAllMoneyRequestList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				IncomeRecord in = new IncomeRecord();
				
				in.setIn_come(rset.getInt("IN_CODE"));
				in.setC_code(rset.getString("c_code"));
				in.setOut_come(rset.getInt("outcome"));	
				in.setOut_date(rset.getString("out_date"));
				in.setOut_status(rset.getInt("OUT_STATUS"));
				in.setOut_tax(rset.getInt("OUT_TAX"));
				in.setReal_in(rset.getInt("REAL_IN"));
				in.setIn_date(rset.getString("IN_DATE"));
				
				cList.add(in);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		
		return cList;
	}

	public int outMoney(Connection con, int inCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		int result1 = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("outMoney");
		String query1 = prop.getProperty("getOutTax");
		String query2 = prop.getProperty("odongsget");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, inCode);
			result = pstmt.executeUpdate();
			if(result > 0){
				pstmt = con.prepareStatement(query1);
				pstmt.setInt(1, inCode);
				rset = pstmt.executeQuery();
			}
			if(rset.next()){
				int outTax = rset.getInt(1);
				pstmt = con.prepareStatement(query2);
				pstmt.setInt(1, outTax);
				result1 = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result1;
	}

	public ArrayList<IncomeRecord> selectOdongGet(Connection con, String startdate, String enddate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<IncomeRecord> cList = new ArrayList<IncomeRecord>();
		
		String query = prop.getProperty("selectOdongGet");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				IncomeRecord in = new IncomeRecord();
				in.setIn_come(rset.getInt("IN_CODE"));
				in.setC_code(rset.getString("c_id"));
				in.setOut_come(rset.getInt("outcome"));	
				in.setOut_date(rset.getString("out_date"));
				in.setOut_status(rset.getInt("OUT_STATUS"));
				in.setOut_tax(rset.getInt("OUT_TAX"));
				in.setReal_in(rset.getInt("REAL_IN"));
				in.setIn_date(rset.getString("IN_DATE"));
				
				cList.add(in);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	public ArrayList<Pay> selectOdongGwanggoGet(Connection con, String startdate, String enddate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Pay> pList = new ArrayList<Pay>();
		
		String query = prop.getProperty("selectOdongGwanggoGet");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			rset = pstmt.executeQuery();
			while(rset.next()){
				Pay p = new Pay();
				p.setPay_code(rset.getInt("PAY_CODE"));
				p.setAc_code(rset.getString("AC_CODE"));
				p.setC_code(rset.getString("c_id"));
				p.setPay_price(rset.getInt("PAY_PRICE"));
				p.setPay_time(rset.getString("PAY_TIME"));
				p.setP_code(rset.getString("P_CODE"));
				pList.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return pList;
	}

	public long[] allSuick(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		long susuSuick = 0;
		long gwanggoSuick = 0;
		long[] suick = new long[2];
		String query1 = prop.getProperty("susuSuick");
		String query2 = prop.getProperty("gwanggoSuick");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query1);
			if(rset.next()){
				susuSuick = rset.getInt(1);
				stmt = con.createStatement();
				rset = stmt.executeQuery(query2);
				if(rset.next()){
					gwanggoSuick = rset.getInt(1);
				}
			}
			
			suick[0] = susuSuick;
			suick[1] = gwanggoSuick;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return suick;
	}

	public long allsusuSuick(Connection con,String startdate, String enddate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		long suick = 0;
		String query = prop.getProperty("allsusuSuick");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			rset = pstmt.executeQuery();
			if(rset.next()){
				suick = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return suick;
	}

	public long allGwanggoSuick(Connection con, String startdate, String enddate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		long suick = 0;
		String query = prop.getProperty("allGwanggoSuick");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			rset = pstmt.executeQuery();
			if(rset.next()){
				suick = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return suick;
	}

	public long allSumSuick(Connection con, String startdate, String enddate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		long suick1 = 0;
		long suick2 = 0;
		long suick = 0;
		String query1 = prop.getProperty("allGwanggoSuick");
		String query2 = prop.getProperty("allsusuSuick");
		try {
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			rset = pstmt.executeQuery();
			if(rset.next()){
				suick1 = rset.getInt(1);
			}
			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			rset = pstmt.executeQuery();
			if(rset.next()){
				suick2 = rset.getInt(1);
			}
			System.out.println("1 : "+suick1);
			System.out.println("2 : "+suick2);
			suick = suick1+suick2;
			System.out.println("3 : "+suick);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return suick;
	}

	public int deleteProduct(Connection con, String pCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<notice> selectAllQnaList(Connection con) {
		Statement stmt = null;
		ResultSet rset= null;
		ArrayList<notice> noList = new ArrayList<notice>();
		
		String query = prop.getProperty("selectAllQnaList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				notice n = new notice();
				n.setCom_code(rset.getInt("COM_CODE"));
				n.setCate_code(rset.getInt("CATE_CODE"));
				n.setCom_name(rset.getString("COM_NAME"));
				n.setCom_content(rset.getString("COM_CONTENT"));
				n.setCom_date(rset.getString(6));
				n.setC_code(rset.getString("C_CODE"));
				n.setCom_count(rset.getInt("COM_COUNT"));
				n.setFileName(rset.getString("FILE_NAME"));
				n.setCate_name(rset.getString("cate_name"));
				n.setQnaPassword(rset.getString("QNAPASSWORD"));
				
				noList.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return noList;
	}

	public notice selectQnaDetail(Connection con, String com_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectQnaDetail");
		notice n = new notice();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, com_code);
			rset = pstmt.executeQuery();
			if(rset.next()){
				n.setCom_code(rset.getInt("COM_CODE"));
				n.setCate_code(rset.getInt("CATE_CODE"));
				n.setCom_name(rset.getString("COM_NAME"));
				n.setCom_content(rset.getString("COM_CONTENT"));
				n.setCom_date(rset.getString(6));
				n.setC_code(rset.getString("C_CODE"));
				n.setCom_count(rset.getInt("COM_COUNT"));
				n.setFileName(rset.getString("FILE_NAME"));
				n.setCate_name(rset.getString("cate_name"));
				n.setQnaPassword(rset.getString("QNAPASSWORD"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return n;
	}

	public int black(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("black");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		
		return result;
	}

}
