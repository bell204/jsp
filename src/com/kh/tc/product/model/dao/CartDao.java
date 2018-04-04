package com.kh.tc.product.model.dao;
  
import static com.kh.tc.common.JDBCTemplet.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import java.util.ArrayList;
import java.util.Properties; 
import com.kh.tc.customer.model.dao.CustomerDao;
 
import com.kh.tc.product.model.vo.Cart;
 
 
public class CartDao {
   
   private Properties prop = new Properties();
   
   public CartDao(){
      String fileName = CustomerDao.class.getResource("/sql/product/cart-query.properties").getPath();
      try {
         prop.load(new FileReader(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
    
   public int wishbuy(Connection con, String c_code, int p_code) {
    
      System.out.println(c_code);
      System.out.println(p_code);
      int result = 0;
    
      PreparedStatement pstmt = null;
 
      String query = prop.getProperty("insertCart");
      System.out.println(query);
      try {
         pstmt=con.prepareStatement(query);
         pstmt.setInt(1,  p_code);
         pstmt.setString(2, c_code);
         result=pstmt.executeUpdate();
       
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
 
      }
      
      return result;
       
   }
 
    
   
   public int deleteCart(Connection con, int cart_code) {
    
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("deleteCart");
      System.out.println("delete 오나");
      System.out.println(cart_code); 
      
      System.out.println(query);
      try {
         pstmt=con.prepareStatement(query);
         pstmt.setInt(1, cart_code);
         result=pstmt.executeUpdate();
         
           
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
    
      }
      
      return result;
      }
 
   
   public ArrayList<Cart> selectCart(Connection con, String c_code, int p_code) {
      ArrayList<Cart> list = new ArrayList<Cart>();
      int result = 0;
      ResultSet rset = null;
      PreparedStatement pstmt = null;
 
      String query = prop.getProperty("selectCart");
      System.out.println(query);
      try {
         pstmt=con.prepareStatement(query);
         pstmt.setString(1, c_code);
 
         rset=pstmt.executeQuery();
          
         
         while(rset.next()) {
            Cart cart = new Cart();
              cart.setCart_code(rset.getInt("cart_code"));
              cart.setCate1(rset.getString("cate1"));
                 cart.setCate2(rset.getString("cate2"));
                 cart.setCate3(rset.getString("cate3"));
                 cart.setCate4(rset.getString("cate4"));
            cart.setP_content(rset.getString("FILE_ROOT"));      
             cart.setOriginFiles(rset.getString("OR_FILE_NAME"));
            cart.setSaveFiles(rset.getString("SEC_FILE_NAME"));
            cart.setC_code(rset.getString("c_id"));
            cart.setP_code(rset.getInt("p_code"));
               cart.setP_name(rset.getString("p_name"));
               
            
            list.add(cart);
         }
         System.out.println("CartDao : "+list);
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
         close(rset);
      }
      
      return list;
       
   }

   public ArrayList<Cart> DeleteSelectCart(Connection con) {
      ArrayList<Cart> list = new ArrayList<Cart>();
      int result = 0;
      ResultSet rset = null;
      PreparedStatement pstmt = null;
 
      String query = prop.getProperty("DeleteSelectCart");
      System.out.println(query);
      try {
         pstmt=con.prepareStatement(query);
       
         rset=pstmt.executeQuery();
          
         
         while(rset.next()) {
            Cart cart = new Cart();
            cart.setCart_code(rset.getInt("cart_code"));
            cart.setP_content(rset.getString("FILE_ROOT"));      
             cart.setOriginFiles(rset.getString("OR_FILE_NAME"));
            cart.setSaveFiles(rset.getString("SEC_FILE_NAME"));
            cart.setC_code(rset.getString("c_id"));
            cart.setP_code(rset.getInt("p_code"));
            cart.setP_date(rset.getDate("p_date"));
               cart.setStar_point(rset.getInt("star_point"));
               cart.setP_name(rset.getString("p_name"));
               
            
            list.add(cart);
         }
         System.out.println("CartDao : "+list);
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
         close(rset);
      }
      
      return list;
   }

   public ArrayList<Cart> SelectCartList(Connection con, String c_code) {

      ArrayList<Cart> list = new ArrayList<Cart>();
      int result = 0;
      ResultSet rset = null;
      PreparedStatement pstmt = null;
 
      String query = prop.getProperty("SelectCartList");
      System.out.println(query);
      try {
         pstmt=con.prepareStatement(query);
         pstmt.setString(1, c_code);
         rset=pstmt.executeQuery();
          
         
         while(rset.next()) {
            Cart cart = new Cart();
            cart.setCart_code(rset.getInt("cart_code"));
             cart.setCate1(rset.getString("cate1"));
                 cart.setCate2(rset.getString("cate2"));
                 cart.setCate3(rset.getString("cate3"));
                 cart.setCate4(rset.getString("cate4"));
            cart.setP_content(rset.getString("FILE_ROOT"));      
             cart.setOriginFiles(rset.getString("OR_FILE_NAME"));
            cart.setSaveFiles(rset.getString("SEC_FILE_NAME"));
            cart.setC_code(rset.getString("c_id"));
            cart.setP_code(rset.getInt("p_code"));
               cart.setP_name(rset.getString("p_name"));
 
            list.add(cart);
         }
         System.out.println("MypageCart : "+list);
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
         close(rset);
      }
      
      return list;
   }
      
    
 
   

}