package com.kh.tc.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		File newFile = null;
		long currentTime = System.currentTimeMillis();
		System.out.println("currentTime : " + currentTime);

		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		// 파일명 뒤에 랜덤으로 숫자를 붙혀주어 좀 더 명확하게 구분해주기
		int randomNumber = (int) (Math.random() * 100000);

		// 확장자명 가져오기
		String name = oldFile.getName();
		// 파일명
		String body = null;
		// 확장자
		String ext = null;
		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			// dot전까지
			body = name.substring(0, dot);
			// dot포함
			ext = name.substring(dot);
		} else {
			// 확장자가 없는 경우
			body = name;
			ext = "";
		}
		String fileName = ft.format(new Date(currentTime)) + randomNumber + ext;

		newFile = new File(oldFile.getParent(), fileName);
		return newFile;
	}

}
