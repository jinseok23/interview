package com.kh.ticketsky.performance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PerformanceDaoImpl implements PerformanceDao {

	
	@Override
	public List<Map<String, String>> categoryList(SqlSessionTemplate sqlSession, String category) {

		return sqlSession.selectList("performance.categoryList",category);
	}
	
	@Override
	public List<Map<String, String>> performAllList(SqlSessionTemplate sqlSession, String category) {
	
		return sqlSession.selectList("performance.performAllList", category);
	}

	@Override
	public List<Map<String, String>> performSelectList(SqlSessionTemplate sqlSession, Map<String, String> map,int cPage, int numPerPage) {
		
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("performance.performSelectList",map,row);
	}

	@Override
	public Map<String, Object> performSelectOne(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.selectOne("performance.performSelectOne",no);
		
	}

	@Override
	public List<Map<String, Object>> performReview(SqlSessionTemplate sqlSession, int no, int cPage, int numPerPage) {

		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("performance.performReview", no, row);
	}

	@Override
	public int performReviewInsert(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	
		return sqlSession.insert("performance.performReviewInsert", map);
	}

	@Override
	public int performReviewDelete(SqlSessionTemplate sqlSession, int reviewNo) {

		return sqlSession.delete("performance.performReviewDelete", reviewNo);
	}

	@Override
	public Map<String, Object> performReviewOne(SqlSessionTemplate sqlSession, int reviewNo) {

		return sqlSession.selectOne("performance.performReviewOne",reviewNo);
	}

	@Override
	public int performReviewUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.update("performance.performReviewUpdateEnd", map);
	}

	@Override
	public int performSelectTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {

		return sqlSession.selectOne("performance.performSelectTotalCount",map);
	}

	@Override
	public int performReviewTotalCount(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectOne("performance.performReviewTotalCount", no);
	}

	@Override
	public int performQuestionInsert(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.insert("performance.performQuestionInsert", map);
	}

	@Override
	public List<Map<String, Object>> performQuestion(SqlSessionTemplate sqlSession, int no, int cPage, int numPerPage) {

		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("performance.performQuestion", no, row);
		
	}

	@Override
	public List<Map<String, String>> performQuestionReview(SqlSessionTemplate sqlSession, int no) {
	
		return sqlSession.selectList("performance.performQuestionReview",no);
	}

	@Override
	public int performQuestionReviewEnd(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("performance.performQuestionReviewEnd", map);
	}

	@Override
	public Map<String, Object> performQuestionOne(SqlSessionTemplate sqlSession, int questionNo) {

		return sqlSession.selectOne("performance.performQuestionOne",questionNo);
	}

	@Override
	public int performQuestionUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.update("performance.performQuestionUpdateEnd", map);
	}

	@Override
	public int performQuestionDelete(SqlSessionTemplate sqlSession, int questionNo) {

		return sqlSession.delete("performance.performQuestionDelete", questionNo);
	}

	@Override
	public int performQuestionReviewDelete(SqlSessionTemplate sqlSession, int questionNo) {

		return sqlSession.delete("performance.performQuestionReviewDelete", questionNo);
	}

	@Override
	public int performQuestionReviewUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	
		return sqlSession.update("performance.performQuestionReviewUpdateEnd", map);
	}

	@Override
	public int performQuestionTotalCount(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectOne("performance.performQuestionTotalCount",no);
	}

	@Override
	public List<Map<String, Object>> performReviewCheckList(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectList("performance.performReviewCheckList",no);
	}

	@Override
	public List<Map<String, Object>> performQuestionCheckList(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.selectList("performance.performQuestionCheckList",no);
	}

	@Override
	public List<Map<String, Object>> likeCheckList(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectList("performance.likeCheckList", no);
	}

	@Override
	public int performReivewLikeInsert(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.insert("performance.performReivewLikeInsert", map);
	}
	
	@Override
	public int performReivewLikeDelete(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	
		return sqlSession.delete("performance.performReivewLikeDelete", map);
	}
	
	@Override
	public int reviewLikeCount(SqlSessionTemplate sqlSession,int reviewNo) {
		
		return sqlSession.selectOne("performance.reviewLikeCount", reviewNo);
	}	
	
	@Override
	public int performReviewNo(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectOne("performance.performReviewNo",map);
	}
	
	@Override
	public int likeCheckDefault(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("performance.likeCheckDefault", map);
	}

	@Override
	public List<Map<String, Object>> performAutocomplete(SqlSessionTemplate sqlSession, String value) {
		
		return sqlSession.selectList("performance.performAutocomplete", value);
	}

	@Override
	public List<Map<String, String>> performNameList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("performance.performNameList");
	}

	@Override
	public int searchPerformName(SqlSessionTemplate sqlSession,String performName) {

		return sqlSession.selectOne("performance.searchPerformName",performName);
	}

	@Override
	public List<Map<String, String>> rankList(SqlSessionTemplate sqlSession, String category) {

		return sqlSession.selectList("performance.rankList",category);
	}

	@Override
	public List<Map<String, String>> contentList(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.selectList("performance.contentList", no);
	}

	@Override
	public int performReviewAvgScore(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.selectOne("performance.performReviewAvgScore", no);
	}

	
}
