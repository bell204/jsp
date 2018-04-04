package com.kh.tc.product.model.service;


import static com.kh.tc.common.JDBCTemplet.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.tc.product.model.dao.ProductDao;
import com.kh.tc.product.model.vo.Advertise;
import com.kh.tc.product.model.vo.Dealrecord;
import com.kh.tc.product.model.vo.DetailCycle;
import com.kh.tc.product.model.vo.Income;
import com.kh.tc.product.model.vo.IncomeStory;
import com.kh.tc.product.model.vo.Pay;
import com.kh.tc.product.model.vo.ProductDetail;
import com.kh.tc.product.model.vo.Reply;
import com.kh.tc.product.model.vo.product;

public class ProductService {

	public int selectCate(String cate1, String cate2, String cate3, String cate4) {
		Connection con = getConnection();
		int cate_code = new ProductDao().selectCate(con, cate1,  cate2,  cate3,  cate4);
		
		close(con);
		
		return cate_code;
	}

	public int insertProduct(product p,String option) {
		Connection con = getConnection();
		int result = new ProductDao().insertProduct(con,p);
		
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<String> selectCategory(String cate1,String cate2,String cate3,String cate4) {
		Connection con = getConnection();
		ArrayList<String> cateList = new ProductDao().selectCategory(con,cate1,cate2,cate3,cate4);
		
		close(con);
		
		return cateList;
	}

	public ArrayList<product> selectPro(String cate1,String cate2,String cate3,String cate4) {
		Connection con = getConnection();
		ArrayList<product> proList = new ProductDao().selectPro(con, cate1,cate2, cate3,cate4);
		
		close(con);
		
		return proList;
	}

	public ArrayList<product> selectProPage(int minPage, int maxPage, String cate1, String cate2, String cate3,
			String cate4) 
	{
		Connection con = getConnection();
		ArrayList<product> proList = new ProductDao().selectPro(con, minPage,  maxPage, cate1,cate2, cate3,cate4);
		
		close(con);
		
		return proList;
	}
	


	public ArrayList searchProduct(int p_code) {
		Connection con = getConnection();
		
		ArrayList detail = new ProductDao().searchProduct(con, p_code);
		
		
		close(con);
		return detail;
	}

	public ArrayList<Reply>  addReply(Reply r) {
		Connection con = getConnection();
		Reply reply = null;
		ArrayList<Reply>  replyList = null;
		
		int result = new ProductDao().addReply(con, r);
		
		if(result>0) {
			commit(con);
			int result2 = new ProductDao().updateStarPoint(con,r);
			if(result2>0) {
				commit(con);
				replyList =  new ProductDao().selectReply(con,r);
				
			}else {
				rollback(con);
			}
	
		}else {
			rollback(con);
		}
		
		
		close(con);
		return replyList;
	}

	public int getListCount(int p_code) {
		Connection con = getConnection();
		int listCount =  new ProductDao().getListCount(con,p_code);
		
		close(con);
		return listCount;
	}

	public ArrayList<Reply> selectList(int currentPage, int limit, int p_code) {
		Connection con = getConnection();
		ArrayList<Reply> list = new ProductDao().selectList(con,currentPage,limit,p_code);
		
		close(con);
		
		return list;
	}
	
	//////////////////////////////////////////////////
	

	public Pay insertPay(Pay pay, String ac_code) {
	       
        Connection con = getConnection();
        
        int result = new ProductDao().insertPay(con, pay, ac_code);
        if(result>0){
    
              pay = new ProductDao().selectPayList(con, ac_code);
           
           commit(con);
        }else{
           rollback(con);
        }
        
        close(con);
        
         System.out.println(pay);
        return pay;
  }

   
	   
	   
	   public Pay selectfinishPay(String ac_code) {
	      Connection con = getConnection();
	       
	      Pay pay = new ProductDao().selectfinishPay(con, ac_code);
	      close(con);
	    
	      System.out.println("서비스"+pay);
	      
	      return pay;
	   }


	

	public Dealrecord recordSum(String c_code) {
		 	Connection con = getConnection();
	       
		 	Dealrecord dr = new ProductDao().recordSum(con, c_code);
	       
	      
	      close(con);
	      
	      
	      return dr;
	}

	public Income sumIncome(String c_code, Date fromDate, Date toDate) {
		Connection con = getConnection();
	       
	 	Income in = new ProductDao().sumIncome(con, c_code,fromDate,toDate);
       
      
	 	close(con);
      
		return in;
	}

	public int requestIncome(int getmoney, String c_code) {
		Connection con = getConnection();
		int result2 =0;
	 	int result = new ProductDao().requestIncome(con, c_code,getmoney);
	 	
	 	if(result>0) {
	 		commit(con);
	 		result2= new ProductDao().updateCash(con, c_code,getmoney);
	 		if(result2>0) {
	 			commit(con);
	 		}else {
	 			rollback(con);
	 		}
	 	}else {
	 		rollback(con);
	 	}
	 	close(con);
	 	
	 	
	 	
	 	
		return result;
	}

	public ArrayList<IncomeStory> selectIncomeStory(String c_code, int currentPage,int limit) {
		Connection con = getConnection();
		
		ArrayList<IncomeStory> incomeList = new ProductDao().selectIncomeStory(con,c_code,currentPage,limit);
		
		return incomeList;
	}

	public int getIncomeListCount(String c_code) {
		Connection con = getConnection();
		int listCount =  new ProductDao().getIncomeListCount(con,c_code);
		
		close(con);
		return listCount;
	}

	public ArrayList<product> selectMyProduct(int currentPage,int limit,String c_code,String status) {
		Connection con = getConnection();
		
		ArrayList<product> myList = new ProductDao().selectMyProduct(con,currentPage,limit,c_code ,status);
		
		close(con); 
		
		return myList;
	}

	public int getMyProductListCount(String c_code,String status) {
		Connection con = getConnection();
		int listCount =  new ProductDao().getMyProductListCount(con,c_code,status);
		
		close(con);
		return listCount;
	}

	public int deleteSellProduct(int p_code) {
		Connection con = getConnection();
		int result =  new ProductDao().deleteSellProduct(con,p_code);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getMyProductListCount(String c_code, String keyword,String status) {
		Connection con = getConnection();
		int listCount =  new ProductDao().getMyProductListCount(con,c_code,keyword,status);
		
		close(con);
		return listCount;
	}

	public ArrayList<product> selectMyProduct(int currentPage, int limit, String c_code, String keyword,String status) {
		Connection con = getConnection();
		
		ArrayList<product> myList = new ProductDao().selectMyProduct(con,currentPage,limit,c_code,keyword,status);
		
		close(con); 
		
		return myList;
	}

	public int checkProduct(int p_code) {
		Connection con = getConnection();
		int result = new ProductDao().checkProduct(con,p_code);
		close(con);
		
		return result;
	}

	public ProductDetail changeProduct(int p_code) {
		Connection con = getConnection();
		ProductDetail detail = new ProductDao().changeProduct(con,p_code);
		close(con);
		return detail;
	}

	public int updateProduct(product p, String option) {
		Connection con = getConnection();
		int result = new ProductDao().updateProduct(con,p);
		
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<product> selectPro(int num) {
		Connection con = getConnection();
		ArrayList<product> proList = new ProductDao().selectPro(con, num);
		
		close(con);
		
		return proList;
	}

	public ArrayList<product> myProductList(String c_code) {
		Connection con = getConnection();
		ArrayList<product> proList = new ProductDao().myProductList(con, c_code);
		
		close(con);
		
		return proList;
	}

	public int buyAdvertise(Advertise ad, String c_code) {
		Connection con = getConnection();
		int result = new ProductDao().updateOdong(con,ad, c_code);
		int result0 =0;
		if(result>0) {
			commit(con);
			int result2 = new ProductDao().updateProductAD(con,ad, c_code);
			if(result2>0) {
				commit(con);
				int result3 = new ProductDao().insertADRecord(con,ad, c_code);
				if(result3>0) {
					result0 = result3;
					commit(con);
				}else {
					rollback(con);
				}
			}else {
				rollback(con);
			}
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result0;
	}

	public DetailCycle detailCycle(int p_code, int status, String c_code,int num) {
		Connection con = getConnection();
		DetailCycle  dc = new ProductDao().detailCycle(con,p_code,status, c_code,num);
		
		close(con);
		
		return dc;
	}

	public int complteDeal(int record_code,int num) {
		Connection con = getConnection();
		int result = new ProductDao().complteDeal(con,record_code,num);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	///////////////////////////////////////////////////
	

	 
	

	public int insertRequest(product p) {
			int result= 0;
			Connection con = getConnection();
			
			result = new ProductDao().insertRequest(con, p);
			System.out.println("서비스");
			System.out.println(result);
			close(con);
		 
		return result;
	}






	
	//////////////////////////////////////////////////
	
	   
	   public product selectOne(int num) {
	      Connection con = getConnection();
	       
	      product product = new ProductDao().selectOne(con, num);
	      close(con);
	      
	      return product;
	   }

	   
	  

	   public Pay searchPayCount(String c_code) {
	      Connection con = getConnection();
	    
	      Pay searchPayCount = new ProductDao().searchPayCount(con, c_code);
	       
	      
	      close(con);
	      
	      
	      return searchPayCount;
	   }

	   public ArrayList<Pay> searchMyPayCount(String c_code) {
	      
		   Connection con = getConnection();
	 
		   
		   ArrayList<Pay> list2 = new ProductDao().searchMyPayCount(con, c_code);
	       
	      
	      close(con);
	      
	      
	      return list2;
	   }


	public ArrayList<Pay> searchBuylist(String c_code) {
		Connection con =getConnection();
		ArrayList<Pay> list = null;
		
		list = new ProductDao().searchBuyList(con, c_code);
		
		close(con);
		return list;
	}

	public int insertBank(Pay pay) {
	 
		Connection con =getConnection();
 
		int result = new ProductDao().insertBank(con, pay);
		 
		close(con);
		return result;
	}

	public ArrayList<Pay> buyList(String c_code) {
		Connection con =getConnection();
		
		ArrayList<Pay> list = null;
		
		list = new ProductDao().buyList(con, c_code);
		
		close(con);
		return list;
	}

	public ArrayList<product> searchProductEngine(String keyword, String c_code, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<product> list=null;
		list = new ProductDao().searchProductEngine(con,  keyword, c_code, currentPage, limit);
		
		close(con);
		return list;
	}

	public int getListCount() {
			Connection con = getConnection();
			int listCount = new ProductDao().getListCount(con);
			
			close(con);
			return listCount;
 
	}

	public ArrayList<product> buyList(String c_code, int currentPage, int limit) {
		Connection con = getConnection();
		 
		System.out.println("서비스"+c_code);
		System.out.println(currentPage);
		System.out.println("서비스 페이징 이상없음");
		ArrayList<product> list=new ProductDao().buyList(con, c_code, currentPage,limit);
		
		  System.out.println("서비스 페이지 조회 성공");
		close(con);
		return list;
	}

	public int updateRequest(String record_code) {
		int result =0;
		Connection con = getConnection();
		
		
		result = new ProductDao().updateRequest(con, record_code);
		
				close(con);
		
		
		return result;
	}

	public int FinishBuying(String record_code) {
		int result =0;
		Connection con = getConnection();
		
		
		result = new ProductDao().finishBuying(con, record_code);
		
				close(con);
		
		
		return result;
	}

	public product searchCategory(int p_code) {
		Connection con = getConnection();
		product p = new product();
		
		
		p=new ProductDao().searchCategory(con, p_code);
		 
		close(con);
		return p;
	}

	 

	public ArrayList<product> buyListDetail(String c_code, int record_status) {
		Connection con = getConnection();
		 
		System.out.println("서비스"+c_code);
		System.out.println("서비스"+record_status);
 
		ArrayList<product> list=new ProductDao().buyListDetail(con, c_code, record_status);
		
		  System.out.println("서비스 페이지 조회 성공");
		close(con);
		return list;
	}

	public int requestDeal(int dealcode, String c_code) {
		Connection con = getConnection();
		int result =0;
		
		result=  new ProductDao().requestDeal(con,dealcode,c_code);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public int cancelDeal(int dealcode, String c_code) {
		
		Connection con = getConnection();
		int result =0;
		
		result=  new ProductDao().cancelDeal(con,dealcode,c_code);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public int cancelDeal2(int dealcode, String c_code) {
		Connection con = getConnection();
		int result =0;
		
		result=  new ProductDao().cancelDeal2(con,dealcode,c_code);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public ArrayList<product> searchProduct(String keyword) {
		Connection con = getConnection();
		ArrayList<product> proList = new ProductDao().searchProduct(con,keyword);
		
		close(con);
		
		return proList;
	}

	public ArrayList<product> selectProPage(int minPage, int maxPage, String keyword) {
		Connection con = getConnection();
		ArrayList<product> proList = new ProductDao().selectPro(con, minPage,  maxPage,keyword);
		
		close(con);
		
		return proList;
	}
	
	
	 public ArrayList<Reply> insertReply(Reply r, int p_code) {
	       String c_code=r.getC_code();
	       System.out.println("서비스"+c_code);
	      Connection con = getConnection();
	      ArrayList<Reply> replyList= null;
	      int result = new ProductDao().insertReply(con, r, p_code);
	      
	      if(result >0) {
	         commit(con);
	         
	         replyList = new ProductDao().selectReplyList(con, c_code, p_code);
	         

	         System.out.println("서비스 되돌아 오나");
	         System.out.println(replyList);
	         
	      }else {
	         rollback(con);
	      }
	      close(con);
	      return replyList;
	   }




	  

}
