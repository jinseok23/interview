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

@Repository
public class InfoDaoImpl implements InfoDao {

	
	
	@Override
	public List<Category> selectCategory(SqlSessionTemplate session) {
		return session.selectList("info.selectCategory",session);
	}
	
	

	@Override
	public List<Category> selectSubCategory(SqlSessionTemplate session, String majorCategory) {
		return session.selectList("info.selectSubCategory",majorCategory);
	}



	@Override
	public int selectCategoryNo(SqlSessionTemplate session, Map<String, String> category) {
		
		return session.selectOne("info.selectCategoryNo",category);
	}

	@Override
	public int insertPerformInfo(PerformInfo pi, SqlSessionTemplate session) {
		
		return session.insert("info.insertPerformInfo", pi);
	}

	
	@Override
	public int insertPerformContent(PerformContent pc, SqlSessionTemplate session) {		
		return session.insert("info.insertContent",pc);
	}

	@Override
	public int insertPerformDate(PerformDate pd, SqlSessionTemplate session) {		
		return session.insert("info.insertDate",pd);
	}

	@Override
	public int insertSeatImg(SeatImg si, SqlSessionTemplate session) {
		
		return session.insert("info.insertSeatImg",si);
	}

	@Override
	public int insertSeatInfo(SeatInfo sif, SqlSessionTemplate session) {
		
		return session.insert("info.insertSeatInfo",sif);
	}



	@Override
	public int insertSeatData(SeatData sd, SqlSessionTemplate session) {
		
		return session.insert("info.insertSeatData",sd);
	}



	@Override
	public int deletePerform(SqlSessionTemplate session, int performNo) {
		
		return session.delete("info.deletePerform",performNo);
	}



	@Override
	public int confirmChangeY(int performNo, SqlSessionTemplate session) {
		
		return session.update("info.confirmChangeY",performNo);
	}



	@Override
	public int confirmChangeE(int performNo, SqlSessionTemplate session) {
		
		return session.update("info.confirmChangeE",performNo);
	}

	
	
	
	
	
}
