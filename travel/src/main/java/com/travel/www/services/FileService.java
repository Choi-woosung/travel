package com.travel.www.services;

import java.io.*;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.travel.www.dao.FileDAO;

import com.travel.www.util.FileUtil;
import com.travel.www.vo.FileVO;
import com.travel.www.vo.MemberVO;

public class FileService {
	@Autowired
	public FileDAO fDAO;
	
	// 파일 업로드를 처리할 함수
	public String singleUpProc(MultipartFile upfile, HttpSession session, String spath) {
		// 이 함수는 파일을 업로드 하기 위해서 컨트롤러에서 업로드 할 파일의 정보를 받아와야 한다.
		// 그 정보는 MultipartFile 이라는 타입으로 전송이 될 것이고
		// 거기서 꺼내서 사용해야 한다.
		
		// 저장이름을 기억할 변수
		String saveName = "";
		long len = 0;
		
		 spath = session.getServletContext().getRealPath(spath);
		 
		 String rePath = spath.substring(0, spath.indexOf("source"));
		 String path2 = spath.replaceAll("/", "\\");
		 rePath = rePath + "git\\travel\\travel\\src\\main\\webapp\\" + path2;

		 // 먼저 클라이언트가 업로드한 원본이름을 알아낸다.
		String oriName = "";
		
		try {
		oriName = upfile.getOriginalFilename();
		} catch(Exception e) {
			return "";
		}
		
		if(oriName == null || oriName.length() == 0) {
			return "";
		}
		// 이 라인이 실행된다는 의미는 업로드할 파일이 존재한다는 이야기
		// 혹시 업로드할 파일하고 중복되는 이름의 파일이 이미 존재하는지 검사해서
		// 있는 경우는 다른이름으로 저장
		
		

		// 저장할 이름이 생겼으므로 준비된 변수에 기억해 놓는다.
		saveName = FileUtil.rename(spath, oriName);
		
		// 이제 업로드된 파일을 우리의 정상적인 경로에 저장한다.
		// 이 이름은 이후 데이터베이스에 등록할 때 사용해야 한다.
		// 따라서 이름을 기억해 놓을 필요가 생겻다.
		
//		FileInputStream fin = null; // 기본스트림
//		BufferedInputStream bin = null; // 보조스트림(필터스트림)
//		PrintStream ps = null; // 보조스트림(기본스트림을 만들어서 사용함)
//		
		
		
		
	try {
		File file = new File(spath, saveName);
		upfile.transferTo(file);
		
		len = upfile.getSize();
		
		// 작업 경로에 복사
		file = new File(rePath, saveName);
		upfile.transferTo(file);
			/*
			 fin = new FileInputStream(file); 
			 bin = new BufferedInputStream(fin); 
			 ps = new PrintStream(file2); 
			 byte[] buff = new byte[1024]; 
			 while(true) { 
				 int len1 = bin.read(buff); 
				 if(len1 == -1) { 
				 	break; 
				 } 
				 ps.write(buff, 0, len1); 
			 }
			 */
	}catch (Exception e) {
		e.printStackTrace();
	}	
			
		return saveName;
	}
	
	// 다중 파일 업로드 처리 함수
	public String[] uploadProc(MultipartFile[] upfile, HttpSession session, String spath) {
		// 이 함수는 다중 파일 업로드를 처리할 함수
		// 단일 파일 처리할 함수를 이미 만들어 놓았으니 호출해서 반복 처리하면된다.
		String[] saveName = new String[upfile.length];
		for(int i = 0; i < upfile.length; i++) {
			saveName[i] = singleUpProc(upfile[i], session, "resources/upload");
		}
		return saveName;
	}
	
	// 회원가입 파일업로드 전담 처리함수
	public int membAddProc(MemberVO mVO, HttpSession session, String spath) {
		int cnt = 0;
		String saveName = singleUpProc(mVO.getsFile(), session, "resources/upload");
		
		FileVO fVO = new FileVO();
		fVO.setMno(mVO.getmNo());
		fVO.setOriName(mVO.getsFile().getOriginalFilename());
		fVO.setSaveName(saveName);
		fVO.setDir();
		fVO.setLen(mVO.getsFile().getSize());
//		fDAO.insertPhoto(fVO);
		return cnt;
	}
}
