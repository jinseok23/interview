package com.kh.ticketsky.info.controller;

import java.io.File;

public class InfoFileDelete {

	public String FileDelete(String saveDir)
	{
		String result="";
		
		File file = new File(saveDir);
        
        if( file.exists() ){ //파일존재여부확인
             
            if(file.isDirectory()){ //파일이 디렉토리인지 확인
                 
                File[] files = file.listFiles();
                 
                for( int i=0; i<files.length; i++){
                    if( files[i].delete() ){
                        result+=(files[i].getName()+" 삭제성공");
                    }else{
                        result+=(files[i].getName()+" 삭제실패");
                    }
                }
                 
            }
            if(file.delete()){
                result+=("파일삭제 성공");
            }else{
                result+=("파일삭제 실패");
            }
             
        }else{
            result+=("파일이 존재하지 않습니다.");
        }
				
		return result;
		
	}
}
