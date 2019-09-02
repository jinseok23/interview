package com.kh.ticketsky.info.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.ticketsky.info.model.vo.Category;
import com.kh.ticketsky.info.model.vo.PerformContent;
import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;


public interface InfoService {
	
	
/*	int insertPerform(String saveDir, Map<String, String> category, PerformInfo pi, List<PerformContent> pcList,
			List<PerformDate> pdList, List<SeatImg> sigList, List<SeatInfo> siList);*/

	int selectCategoryNo(Map<String, String> category);

	List<Category> selectCategory();

	List<Category> selectSubCategory(String majorCategory);

	int insertPerform(String saveDir, Map<String, String> category, PerformInfo pi, List<PerformContent> pcList,
			List<PerformDate> pdList, List<SeatImg> sigList, List<SeatInfo> siList, HttpSession httpSession);

	int deletePerform(int performNo);

	int confirmChangeY(int performNo);
	
	int confirmChangeE(int performNo);
	
	

	

}
