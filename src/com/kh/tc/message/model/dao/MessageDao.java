package com.kh.tc.message.model.dao;

import java.io.FileNotFoundException;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.tc.file.model.vo.File;
import com.kh.tc.message.model.vo.Message;

import static com.kh.tc.common.JDBCTemplet.*;

public class MessageDao {
	private Properties prop = new Properties();
	
	public MessageDao(){
		String fileName = MessageDao.class.getResource("/sql/message/message.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMessage(Connection con, Message m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String me_code = "";
		String query = prop.getProperty("insertMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getcCode());
			pstmt.setString(2, m.getcCode());
			pstmt.setString(3, m.getMsgContent());
			pstmt.setString(4, m.getReceveCode());
			pstmt.setString(5, m.getFile_code());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateStarCheck(Connection con, String userId, String receveId) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateStarCheck1");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, receveId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int updateStarCheck2(Connection con, String userId, String receveId) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateStarCheck2");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, receveId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int messageCheck(Connection con, String userId, String receveId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("messageCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, receveId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public Message selectMessage(Connection con, Message m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Message me = null;
		String query = prop.getProperty("selectOneMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMsgCode());
		
			rset = pstmt.executeQuery();
			if(rset.next()){
				me = new Message();
				me.setcCode(rset.getString("c_code"));
				me.setMsgCode(rset.getString("m_code"));
				me.setMsgContent(rset.getString("m_content"));
				me.setSendTime(rset.getString(4));
				me.setCheck(rset.getString("check_1"));
				me.setReceveCode(rset.getString("receive_code"));
				me.setStarCheck(rset.getString("star_check"));
				me.setFile_code(rset.getString("file_code"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return me;
	}

	public ArrayList<Message> selectMessage2(Connection con, Message m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> meList = new ArrayList<Message>();
		
		String query = prop.getProperty("selectMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getcCode());
			pstmt.setString(2, m.getReceveCode());
			pstmt.setString(3, m.getReceveCode());
			pstmt.setString(4, m.getcCode());
			rset = pstmt.executeQuery();
			while(rset.next()){
				Message me = new Message();
				me.setcCode(rset.getString("c_code"));
				me.setMsgCode(rset.getString("m_code"));
				System.out.println("임양"+rset.getString("m_code"));
				me.setMsgContent(rset.getString("m_content"));
				me.setSendTime(rset.getString(4));
				me.setCheck(rset.getString("check_1"));
				me.setReceveCode(rset.getString("receive_code"));
				me.setStarCheck(rset.getString("star_check"));
				me.setFile_code(rset.getString("file_code"));
				/*System.out.println("dao : "+me.getcCode());
				System.out.println("dao : "+me.getMsgCode());
				System.out.println("dao : "+me.getMsgContent());
				System.out.println("dao : "+me.getReceveCode());
				System.out.println("dao : "+me.getSendTime());*/
				
				meList.add(me);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return meList;
	}
	
	public HashMap<String, String> selectAllMessageRoom1(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, String> hMap = null;
		
		String query = prop.getProperty("selectMessageRoom1");
		String query1 = prop.getProperty("selectMessageRoom2");
				
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			hMap = new HashMap<String, String>();
			while(rset.next()){
				hMap.put(rset.getString(1), "1");
			}
		
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				hMap.put(rset.getString(1), "1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return hMap;
	}

	public ArrayList<Message> selectMessageRoom(Connection con, String userId, ArrayList<String> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMessageRoom");
		
		ArrayList<Message> meList = new ArrayList<Message>();
		
	/*	System.out.println("daoList : "+ userId);
		System.out.println("daoList : "+ list.get(0));
		System.out.println("daoList : "+ list.get(1));
		System.out.println("daoList : "+ list.get(2));*/
		try {
			for(int i =0; i < list.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setString(2, list.get(i));
				pstmt.setString(3, list.get(i));
				pstmt.setString(4, userId);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					Message m = new Message();
					m.setcCode(rset.getString(2));
					m.setMsgCode(rset.getString(3));
					m.setMsgContent(rset.getString(4));
					m.setSendTime(rset.getString("m_s"));
					m.setCheck(rset.getString(6));
					m.setReceveCode(rset.getString(7));
					m.setStarCheck(rset.getString(8));
					
					meList.add(m);
					System.out.println("daoM : "+m.getcCode());
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return meList;
	}

	public ArrayList<Message> selectStarMessageRoom(Connection con, String userId, ArrayList<String> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectStarMessage");
		
		ArrayList<Message> meList = new ArrayList<Message>();
		
		/*System.out.println("daoList : "+ userId);
		System.out.println("daoList : "+ list.get(0));
		System.out.println("daoList : "+ list.get(1));
		System.out.println("daoList : "+ list.get(2));*/
		try {
			for(int i =0; i < list.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setString(2, list.get(i));
				pstmt.setString(3, list.get(i));
				pstmt.setString(4, userId);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					Message m = new Message();
					m.setcCode(rset.getString(2));
					m.setMsgCode(rset.getString(3));
					m.setMsgContent(rset.getString(4));
					m.setSendTime(rset.getString("m_s"));
					m.setCheck(rset.getString(6));
					m.setReceveCode(rset.getString(7));
					m.setStarCheck(rset.getString(8));
					
					meList.add(m);
					System.out.println("daoM : "+m.getcCode());
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return meList;
	}

	public ArrayList<Message> selectUnCheckMessageRoom(Connection con, String userId, ArrayList<String> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectUnCheckMessage");
		
		ArrayList<Message> meList = new ArrayList<Message>();
		
		try {
			for(int i =0; i < list.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setString(2, list.get(i));
				pstmt.setString(3, list.get(i));
				pstmt.setString(4, userId);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					Message m = new Message();
					m.setcCode(rset.getString(2));
					m.setMsgCode(rset.getString(3));
					m.setMsgContent(rset.getString(4));
					m.setSendTime(rset.getString("m_s"));
					m.setCheck(rset.getString(6));
					m.setReceveCode(rset.getString(7));
					m.setStarCheck(rset.getString(8));
					
					meList.add(m);
					System.out.println("daoM : "+m.getcCode());
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return meList;
	}

	public int deleteMessage(Connection con, String userId, String[] receveId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMessage");
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < receveId.length; i++){
				pstmt.setString(1, userId);
				pstmt.setString(2, receveId[i]);
				pstmt.setString(3, receveId[i]);
				pstmt.setString(4, userId);
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertFile(Connection con, File file1, Message m) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		String query = prop.getProperty("insertFileMessage");
		System.out.println("insertFileMessageDao 3");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getcCode());
			pstmt.setString(2, file1.getFile_root());
			pstmt.setString(3, file1.getOr_file_name());
			pstmt.setString(4, file1.getSec_file_name());
			pstmt.setString(5, m.getReceveCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public File selectOneServlet(Connection con, String fileCode) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		File file = null;
		String query = prop.getProperty("selectFileCode");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileCode);
			rset = pstmt.executeQuery();
			if(rset.next()){
				file = new File();
				file.setFile_code(rset.getString("FILE_CODE"));
				file.setF_from(rset.getString("F_FROM"));
				file.setFile_root(rset.getString("FILE_ROOT"));
				file.setOr_file_name(rset.getString("OR_FILE_NAME"));
				file.setC_id(rset.getString("C_ID"));
				file.setSec_file_name(rset.getString("SEC_FILE_NAME"));
				file.setUpdate_time(rset.getString("update_time"));
				file.setReceveId(rset.getString("update_time"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return file;
	}

	public File selectOneFile(Connection con, File file1) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		File file = new File();
		String query = prop.getProperty("selectOneFile");
		
		String sec = file1.getSec_file_name();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sec);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				file.setC_id(rset.getString("c_id"));
				file.setF_from(rset.getString("f_from"));
				file.setFile_code(rset.getString("file_code"));
				file.setFile_root(rset.getString("file_root"));
				file.setOr_file_name(rset.getString("or_file_name"));
				file.setReceveId(rset.getString("receve_id"));
				file.setSec_file_name(rset.getString("sec_file_name"));
				file.setUpdate_time(rset.getString("update_time"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return file;
	}

	public File selectFileMessage(Connection con, String fileCode) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		File file = new File();
		String query = prop.getProperty("selectFileCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileCode);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				file.setC_id(rset.getString("c_id"));
				file.setF_from(rset.getString("f_from"));
				file.setFile_code(rset.getString("file_code"));
				file.setFile_root(rset.getString("file_root"));
				file.setOr_file_name(rset.getString("or_file_name"));
				file.setReceveId(rset.getString("receve_id"));
				file.setSec_file_name(rset.getString("sec_file_name"));
				file.setUpdate_time(rset.getString(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return file;
	}

	public String selectCustomer(Connection con, String c_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String receveId = "";
		String query = prop.getProperty("selectCustomer");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()){
				receveId = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return receveId;
	}

	public Message selectMessage(Connection con, String msgCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMessage11");
		Message m = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, msgCode);
			rset = pstmt.executeQuery();
			if(rset.next()){
				m = new Message();
				m.setcCode(rset.getString("c_code"));
				System.out.println(rset.getString("c_code"));
				m.setMsgCode(rset.getString("m_code"));
				m.setMsgContent(rset.getString("m_content"));
				m.setSendTime(rset.getString(4));
				m.setCheck(rset.getString("CHECK_1"));
				m.setReceveCode(rset.getString("RECEIVE_CODE"));
				m.setStarCheck(rset.getString("STAR_CHECK"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return m;
	}

	


	




}
