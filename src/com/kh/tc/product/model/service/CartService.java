package com.kh.tc.product.model.service;

import static com.kh.tc.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
 
import com.kh.tc.product.model.dao.CartDao;
import com.kh.tc.product.model.vo.Cart;
import com.kh.tc.product.model.vo.product;
 

public class CartService {
 
   public ArrayList<Cart> wishbuy(String c_code, int p_code) {
      ArrayList<Cart> list= null;
      Connection con = getConnection();
 
      int result = 0;
      result = new CartDao().wishbuy(con, c_code, p_code);
      if(result >0) {
         commit(con);
         System.out.println(c_code);
         System.out.println(p_code);
         list  = new CartDao().selectCart(con, c_code, p_code);
      
         close(con);
      }else{
         rollback(con);
      
   }
      return list;
   }
   
   public ArrayList<Cart> deleteCart(int cart_code) {
      ArrayList<Cart> list= null;
      Connection con = getConnection();
       
      
       int result = new CartDao().deleteCart(con, cart_code);
      if(result >0) {
         list  = new CartDao().DeleteSelectCart(con);
         
         commit(con);
         close(con);
      }else {
         rollback(con);
      }
      
      
      return list;
    
   }

   public ArrayList<Cart> selectCartList(String c_code) {
    
      Connection con = getConnection();
         
      ArrayList<Cart> list = new CartDao().SelectCartList(con, c_code);
         
         commit(con);
         close(con);
 
      return list;
   }
   
   
}