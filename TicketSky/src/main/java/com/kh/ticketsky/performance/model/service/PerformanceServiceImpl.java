package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.performance.model.dao.PerformanceDao;

@Service
public class PerformanceServiceImpl implements PerformanceService {

	@Autowired
	private PerformanceDao dao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> categoryList(String category) {
		
		List<Map<String,String>> list = dao.categoryList(sqlSession,category);
		return list;
	}
	
	@Override
	public List<Map<String, String>> performAllList(String category) {
		
		List<Map<String,String>> list= dao.performAllList(sqlSession, category);
		return list;
	}
	
	@Override
	public List<Map<String, String>> performSelectList(Map<String, String> map,int cPage, int numPerPage) {
		
		List<Map<String,String>> list = dao.performSelectList(sqlSession,map,cPage,numPerPage);
		
		return list;
	}

	@Override
	public Map<String, Object> performSelectOne(int no) {
		Map<String, Object> map = dao.performSelectOne(sqlSession, no);
		return map;
	}

	@Override
	public List<Map<String, Object>> performReview(int no, int cPage, int numPerPage) {
		List<Map<String,Object>> list = dao.performReview(sqlSession, no, cPage, numPerPage);
		return list;
	}

	@Override
	public int performReviewInsert(Map<String, Object> map) {
		int result = dao.performReviewInsert(sqlSession, map);
		return result;
	}

	@Override
	public int performReviewDelete(int reviewNo) {

		int result = dao.performReviewDelete(sqlSession, reviewNo);
		return result;
	}

	@Override
	public Map<String, Object> performReviewOne(int reviewNo) {
		Map<String, Object> map = dao.performReviewOne(sqlSession, reviewNo);
		return map;
	}

	@Override
	public int performReviewUpdateEnd(Map<String, Object> map) {

		int result = dao.performReviewUpdateEnd(sqlSession, map);
		return result;
	}

	@Override
	public int performSelectTotalCount(Map<String, String> map) {

		return dao.performSelectTotalCount(sqlSession,map);
	}

	@Override
	public int performReviewTotalCount(int no) {

		return dao.performReviewTotalCount(sqlSession,no);
	}

	@Override
	public int performQuestionInsert(Map<String, Object> map) {

		return dao.performQuestionInsert(sqlSession,map);
	}

	@Override
	public List<Map<String, Object>> performQuestion(int no, int cPage, int numPerPage) {

		return dao.performQuestion(sqlSession, no, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> performQuestionReview(int no) {

		return dao.performQuestionReview(sqlSession, no);
	}

	@Override
	public int performQuestionReviewEnd(Map<String, Object> map) {

		return dao.performQuestionReviewEnd(sqlSession, map);
	}

	@Override
	public Map<String, Object> performQuestionOne(int questionNo) {

		return dao.performQuestionOne(sqlSession,questionNo);
	}

	@Override
	public int performQuestionUpdateEnd(Map<String, Object> map) {

		return dao.performQuestionUpdateEnd(sqlSession,map);
	}

	@Override
	public int performQuestionDelete(int questionNo) {

		return dao.performQuestionDelete(sqlSession,questionNo);
	}

	@Override
	public int performQuestionReviewDelete(int questionNo) {

		return dao.performQuestionReviewDelete(sqlSession,questionNo);
	}

	@Override
	public int performQuestionReviewUpdateEnd(Map<String, Object> map) {
		
		return dao.performQuestionReviewUpdateEnd(sqlSession,map);
	}

	@Override
	public int performQuestionTotalCount(int no) {

		return dao.performQuestionTotalCount(sqlSession,no);
	}

	@Override
	public List<Map<String, Object>> performReviewCheckList(int no) {

		return dao.performReviewCheckList(sqlSession,no);
	}

	@Override
	public List<Map<String, Object>> performQuestionCheckList(int no) {

		return dao.performQuestionCheckList(sqlSession,no);
	}

	@Override
	public List<Map<String, Object>> likeCheckList(int no) {
		
		return dao.likeCheckList(sqlSession,no);
	}

	@Override
	public int performReivewLikeInsert(Map<String, Object> map) {

		return dao.performReivewLikeInsert(sqlSession,map);
	}

	@Override
	public int performReivewLikeDelete(Map<String, Object> map) {
	
		return dao.performReivewLikeDelete(sqlSession,map);
	}
	
	@Override
	public int reviewLikeCount(int reviewNo) {
	
		return dao.reviewLikeCount(sqlSession,reviewNo);
	}
	
	@Override
	public int performReviewNo(Map<String, Object> map) {
		
		return dao.performReviewNo(sqlSession,map);
	}

	@Override
	public int likeCheckDefault(Map<String, Object> map) {

		return dao.likeCheckDefault(sqlSession,map);
	}
	
	@Override
	public List<Map<String, Object>> performAutocomplete(String value) {

		return dao.performAutocomplete(sqlSession,value);
	}

	@Override
	public List<Map<String, String>> performNameList() {
	
		return dao.performNameList(sqlSession);
	}

	@Override
	public int searchPerformName(String performName) {

		return dao.searchPerformName(sqlSession,performName);
	}

	@Override
	public List<Map<String, String>> rankList(String category) {

		return dao.rankList(sqlSession,category);
	}

	@Override
	public List<Map<String, String>> contentList(int no) {

		return dao.contentList(sqlSession, no);
	}

	@Override
	public int performReviewAvgScore(int no) {

		return dao.performReviewAvgScore(sqlSession,no);
	}
	
	
	
}
