package com.kh.tc.message.model.service;

import static com.kh.tc.common.JDBCTemplet.*;

import java.sql.Array;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tc.file.model.vo.File;
import com.kh.tc.message.model.dao.MessageDao;
import com.kh.tc.message.model.vo.Message;

public class MessageService {

	public int insertMsg(Message m) {
		Connection con = getConnection();
		Message me= new Message();
		int result = new MessageDao().insertMessage(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}


	public int updateStarCheck(String userId, String receveId) {
		Connection con = getConnection();
		
		int result = new MessageDao().updateStarCheck(con, userId, receveId);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int updateStarCheck2(String userId, String receveId) {
		Connection con = getConnection();
		
		int result = new MessageDao().updateStarCheck2(con, userId, receveId);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		close(con);
		
		return result;
	}

	public int messageCheck(String userId, String receveId) {
		Connection con = getConnection();
		
		int result = new MessageDao().messageCheck(con, userId, receveId);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public ArrayList<Message> selectAllMessage(Message m) {
		Connection con = getConnection();
		ArrayList<Message> meList = null;
		
		meList = new MessageDao().selectMessage2(con, m);
		
		close(con);
		return meList;
	}

	public HashMap<String, String> selectAllMessageRoom(String userId) {
		Connection con = getConnection();
		
		HashMap<String, String> hMap = new MessageDao().selectAllMessageRoom1(con, userId);
		
		close(con);
		return hMap;
	}

	public ArrayList<Message> selectMessageRoom(String userId, ArrayList<String> list) {
		Connection con = getConnection();
		ArrayList<Message> meList = new MessageDao().selectMessageRoom(con, userId, list); 
		
		close(con);
		return meList;
	}

	public ArrayList<Message> selectStarMessageRoom(String userId, ArrayList<String> list) {
		Connection con = getConnection();
		ArrayList<Message> meList = new MessageDao().selectStarMessageRoom(con, userId, list); 
		
		close(con);
		return meList;
	}

	public ArrayList<Message> selectUnCheckMessageRoom(String userId, ArrayList<String> list) {
		Connection con = getConnection();
		ArrayList<Message> meList = new MessageDao().selectUnCheckMessageRoom(con, userId, list); 
		
		close(con);
		return meList;
	}

	public int deleteMessage(String userId, String[] receveId) {
		Connection con = getConnection();
		int result = new MessageDao().deleteMessage(con, userId, receveId); 
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public File insertFileMessage(Message m, File file1) {
		Connection con = getConnection();
		int result = 0;
		File file= new File();
		file.setSec_file_name(file1.getSec_file_name());
		
		result = new MessageDao().insertFile(con, file1, m);
		if(result > 0){
			commit(con);	
			file = new MessageDao().selectOneFile(con, file);
			if(file != null){
				commit(con);
			}else{
				rollback(con);
			}
		}else{
			rollback(con);
		}
		close(con);
		return file;
	}

	public File selectOneServlet(String fileCode) {
		Connection con = getConnection();
		File file = new MessageDao().selectOneServlet(con, fileCode);
		close(con);
		return file;
	}

	public File selectFileMessage(String fileCode) {
		Connection con = getConnection();
		
		File file = new MessageDao().selectFileMessage(con, fileCode);
		close(con);
		
		return file;
	}


	public String selectCustomer(String c_code) {
		Connection con = getConnection();
		String receveId = new MessageDao().selectCustomer(con, c_code);
		close(con);
		return receveId;
	}


	public Message selectMessage(String msgCode) {
		Connection con = getConnection();
		Message m = new MessageDao().selectMessage(con, msgCode);
		System.out.println("ㅇ기"+m);
		close(con);
		return m;
	}

}
