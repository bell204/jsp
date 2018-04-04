package com.kh.tc.file.model.dao;

import static com.kh.tc.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.tc.file.model.vo.File;

public class fileDao {
	private Properties prop = new Properties();

	public fileDao() {
		String fileName = fileDao.class.getResource("/sql/file/file-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertProfilImg(Connection con, File profileFile, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateProfileImg");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, profileFile.getFile_root());
			pstmt.setString(2, profileFile.getOr_file_name());
			pstmt.setString(3, profileFile.getSec_file_name());
			pstmt.setString(4, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public File selectProfilImg(Connection con, String userId) {
		PreparedStatement pstmt = null;
		File profilImg = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectProfilImg");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				profilImg = new File();
				profilImg.setFile_code(rset.getString("file_code"));
				profilImg.setF_from(rset.getString("f_from"));
				profilImg.setC_id(rset.getString("c_id"));
				profilImg.setFile_root(rset.getString("file_root"));
				profilImg.setOr_file_name(rset.getString("or_file_name"));
				profilImg.setSec_file_name(rset.getString("sec_file_name"));
				profilImg.setUpdate_time(rset.getString("update_time"));
				profilImg.setReceveId(rset.getString("receve_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return profilImg;
	}

	public int insertQnAFile(Connection con, File qnaFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertQnAFile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, qnaFile.getC_id());
			pstmt.setString(2, qnaFile.getFile_root());
			pstmt.setString(3, qnaFile.getOr_file_name());
			pstmt.setString(4, qnaFile.getSec_file_name());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public File selectQnAFile(Connection con, String fileName) {
		PreparedStatement pstmt = null;
		File qnaFile = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectQnAFile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileName);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				qnaFile = new File();
				qnaFile.setFile_code(rset.getString("file_code"));
				qnaFile.setF_from(rset.getString("f_from"));
				qnaFile.setC_id(rset.getString("c_id"));
				qnaFile.setFile_root(rset.getString("file_root"));
				qnaFile.setOr_file_name(rset.getString("or_file_name"));
				qnaFile.setSec_file_name(rset.getString("sec_file_name"));
				qnaFile.setUpdate_time(rset.getString("update_time"));

			}
			System.out.println("fileDao qna f : " + qnaFile);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return qnaFile;
	}

}
