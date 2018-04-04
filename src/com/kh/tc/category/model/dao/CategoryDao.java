package com.kh.tc.category.model.dao;
import static com.kh.tc.common.JDBCTemplet.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.tc.customer.model.dao.CustomerDao;

public class CategoryDao {
	private Properties prop = new Properties();

	public CategoryDao() {
		String fileName = CategoryDao.class.getResource("/sql/category/category-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public ArrayList<String> selectCate(Connection con, String cate1,String msg) {
		PreparedStatement pstmt = null;
		ArrayList<String> list =  null;
		ResultSet rset = null;
		String query = null;
		
		if(msg.equals("2차")) {
			query =prop.getProperty("selectCate2");
		}else if(msg.equals("3차")) {
			query =prop.getProperty("selectCate3");
		}else {
			 query =prop.getProperty("selectCate4");
		}




		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cate1);
			rset = pstmt.executeQuery();
			list = new ArrayList<String>();
			while(rset.next()){
				list.add(rset.getString(1));
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}



		return list;
	}

}
