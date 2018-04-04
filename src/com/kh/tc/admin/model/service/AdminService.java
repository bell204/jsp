package com.kh.tc.admin.model.service;

import static com.kh.tc.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.tc.IncomeRecord.model.vo.IncomeRecord;
import com.kh.tc.admin.model.dao.AdminDao;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.notice.model.vo.notice;
import com.kh.tc.pay.model.vo.Pay;
import com.kh.tc.product.model.vo.product;

public class AdminService {

	public int talMember(String talId) {
		int result = 0;
		Connection con = getConnection();
		result = new AdminDao().talMember(con, talId);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<notice> selectBlackRequest() {
		Connection con = getConnection();
		ArrayList<notice> noList = new AdminDao().selectBlackRequest(con);
		close(con);
		return noList;
	}

	public notice selectBlackMember(int comCode) {
		Connection con = getConnection();
		notice n = new AdminDao().selectBlackMember(con, comCode);
		close(con);
		return n;
	}

	public Customer selectBadUser(String badUserId) {
		Connection con = getConnection();
		Customer c = new AdminDao().selectBadUser(con, badUserId);
		close(con);
		return c;
	}

	public ArrayList<Customer> allTalRequestMemberList() {
		Connection con = getConnection();
		ArrayList<Customer> coList = new AdminDao().allTalRequestMemberList(con);
		close(con);
		return coList;
	}

	public Customer selectTalUser(String talId) {
		Connection con = getConnection();
		Customer c = new AdminDao().selectTalUser(con, talId);
		close(con);
		return c;
	}

	public ArrayList<product> selectAllRequestProduct() {
		Connection con = getConnection();
		ArrayList<product> prList = new AdminDao().selectAllRequestProduct(con);
		close(con);
		return prList;
	}

	public ArrayList<product> SelectDeleteRequestProductList() {
		Connection con = getConnection();
		ArrayList<product> prList = new AdminDao().SelectDeleteRequestProductList(con);
		close(con);
		return prList;
	}

	public int requestProductAgree(String pCode) {
		Connection con = getConnection();
		int result = new AdminDao().requestProductAgree(con, pCode);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public product selectRequestProductDetail(String pCode) {
		Connection con = getConnection();
		product p = new AdminDao().selectRequestProductDetail(con, pCode);
		close(con);
		return p;
	}

	public ArrayList<IncomeRecord> selectAllMoneyOutRequestList() {
		Connection con = getConnection();
		ArrayList<IncomeRecord> cList = new AdminDao().selectAllMoneyOutRequestList(con);
		close(con);
		return cList;
	}

	public int outMoney(int inCode) {
		Connection con = getConnection();
		int result = new AdminDao().outMoney(con,inCode); 
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<IncomeRecord> selectOdongGet(String startdate, String enddate) {
		Connection con = getConnection();
		ArrayList<IncomeRecord> cList = new AdminDao().selectOdongGet(con, startdate, enddate);
		close(con);
		return cList;
	}

	public ArrayList<Pay> selectOdongGwanggoGet(String startdate, String enddate) {
		Connection con = getConnection();
		ArrayList<Pay> cList = new AdminDao().selectOdongGwanggoGet(con, startdate, enddate);
		close(con);
		return cList;
	}

	public long[] allSuick() {
		Connection con = getConnection();
		long[] suick = new long[2]; 
		suick = new AdminDao().allSuick(con);
		close(con);
		return suick;
	}

	public long allsusuSuick(String startdate, String enddate) {
		Connection con = getConnection();
		long suick = new AdminDao().allsusuSuick(con, startdate, enddate);
		close(con);
		return suick;
	}

	public long allGwanggoSuick(String startdate, String enddate) {
		Connection con = getConnection();
		long suick = new AdminDao().allGwanggoSuick(con, startdate, enddate);
		close(con);
		return suick;
	}

	public long allSumSuick(String startdate, String enddate) {
		Connection con = getConnection();
		long suick = new AdminDao().allSumSuick(con, startdate, enddate);
		close(con);
		return suick;
	}

	public int deleteProduct(String pCode) {
		Connection con = getConnection();
		int result = new AdminDao().deleteProduct(con, pCode);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<notice> selectAllQnaList() {
		Connection con = getConnection();
		ArrayList<notice> noList = new AdminDao().selectAllQnaList(con);
		close(con);
		return noList;
	}

	public notice selectQnaDetail(String com_code) {
		Connection con = getConnection();
		notice n = new AdminDao().selectQnaDetail(con, com_code);
		close(con);
		return n;
	}

	public int black(String userId) {
		Connection con = getConnection();
		int result = new AdminDao().black(con, userId);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
		
}
