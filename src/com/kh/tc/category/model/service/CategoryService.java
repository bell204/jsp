package com.kh.tc.category.model.service;
import static com.kh.tc.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.tc.category.model.dao.CategoryDao;

public class CategoryService {

	public ArrayList<String> selectCate(String cate1,String msg) {
		Connection con = getConnection();
		
		ArrayList<String> list = new CategoryDao().selectCate(con,cate1,msg);
		
		close(con);
		
		return list;
	}

}
