package com.kh.tc.file.model.service;

import static com.kh.tc.common.JDBCTemplet.close;
import static com.kh.tc.common.JDBCTemplet.commit;
import static com.kh.tc.common.JDBCTemplet.getConnection;
import static com.kh.tc.common.JDBCTemplet.rollback;

import java.sql.Connection;

import com.kh.tc.file.model.dao.fileDao;
import com.kh.tc.file.model.vo.File;

public class fileService {

	public int insertProfilImg(File profileFile, String userId) {
		Connection con = getConnection();

		int result = new fileDao().insertProfilImg(con, profileFile, userId);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public File selectProfilImg(String userId) {
		Connection con = getConnection();
		File profilImg = new fileDao().selectProfilImg(con, userId);

		close(con);
		return profilImg;
	}

	public int insertQnAFile(File qnaFile) {
		Connection con = getConnection();

		int result = new fileDao().insertQnAFile(con, qnaFile);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public File selectQnAFile(String fileName) {
		Connection con = getConnection();
		File qnaFile = new fileDao().selectQnAFile(con, fileName);
		close(con);
		return qnaFile;
	}

}
