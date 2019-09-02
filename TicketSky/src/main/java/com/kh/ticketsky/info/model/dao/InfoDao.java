package com.kh.ticketsky.info.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.info.model.vo.Category;
import com.kh.ticketsky.info.model.vo.PerformContent;
import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;


public interface InfoDao {

	int insertPerformInfo(PerformInfo pi, SqlSessionTemplate session);

	int selectCategoryNo(SqlSessionTemplate session, Map<String, String> category);

	int insertPerformContent(PerformContent pc, SqlSessionTemplate session);

	int insertPerformDate(PerformDate pd, SqlSessionTemplate session);

	int insertSeatImg(SeatImg si, SqlSessionTemplate session);

	int insertSeatInfo(SeatInfo sif, SqlSessionTemplate session);

	List<Category> selectCategory(SqlSessionTemplate session);

	List<Category> selectSubCategory(SqlSessionTemplate session, String majorCategory);

	int insertSeatData(SeatData sd, SqlSessionTemplate session);

	int deletePerform(SqlSessionTemplate session, int performNo);

	int confirmChangeY(int performNo, SqlSessionTemplate session);
	
	int confirmChangeE(int performNo, SqlSessionTemplate session);

}
