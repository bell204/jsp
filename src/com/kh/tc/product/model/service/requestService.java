package com.kh.tc.product.model.service;

import static com.kh.tc.common.JDBCTemplet.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.tc.product.model.dao.ProductDao;

import com.kh.tc.product.model.dao.requestDao;
import com.kh.tc.product.model.vo.Pay;
import com.kh.tc.product.model.vo.product;

public class requestService {



	public int getListCount() {
		Connection con = getConnection();
		int listCount = new requestDao().getListCount(con);
		
		close(con);
		return listCount;
	}
	
	public product selectOne(int num) {
		Connection con = getConnection();
		 
		product product = new ProductDao().selectOne(con, num);
		close(con);
		
		return product;
	}

	 
		public ArrayList<product> selectOneRequest(int num) {
			Connection con = getConnection();
			ArrayList<product> list=null;
			list = new requestDao().selectOneRequest(con, num);
			
			close(con);
			return list;
		}
 
		///// 페이징

		public int getListCount(String req_status) {
			Connection con = getConnection();
			int listCount = new requestDao().getListCount(con, req_status);
			
			close(con);
			return listCount;
		}

		public ArrayList<product> selectRequestList(String req_status, int currentPage, int limit) {
			Connection con = getConnection();
		 
			System.out.println("서비스"+req_status);
			System.out.println(currentPage);
			System.out.println("서비스 페이징 이상없음");
			ArrayList<product> list=new requestDao().selectRequestList(con, req_status, currentPage,limit);
			
			  System.out.println("서비스 페이지 조회 성공");
			close(con);
			return list;
		}
		
		
		
		public int insertRequest(product p) {
	  
			Connection con = getConnection();
			int result= 0;
		
			result = new requestDao().insertRequest(con, p);
			if(result>0) {
				commit(con);
			
			}else {
				rollback(con);
			}
			close(con);
		 
		return result;
	}


		


		public ArrayList<Pay> updateRequest(String c_code) {
			Connection con = getConnection();
			ArrayList<Pay> list=null;
			int result=0;
			int result2=0;
		
			//insert 
			//result = new requestDao().insertRequest(con, c_code);
			
			if(result>0){
				commit(con);
				
				// delete
				//result2 = new requestDao().deleteRequest(con, c_code);
				 
				
				close(con);
				
				
			}
			
			return list;
		}
		public ArrayList<product> searchRequestEngine(String search3, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<product> list=null;
			list = new requestDao().selectRequestEngine(con, search3, currentPage, limit);
			
			close(con);
			return list;
		}

		public ArrayList<product> searchRequestEngine1(String search3) {
			Connection con = getConnection();
			ArrayList<product> list=null;
			list = new requestDao().selectRequestEngine1(con,  search3);
			
			close(con);
			return list;
		}

 

	 
 
	
}
