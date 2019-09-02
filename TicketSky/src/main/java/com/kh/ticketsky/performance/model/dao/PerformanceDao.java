package com.kh.ticketsky.performance.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface PerformanceDao {

	List<Map<String, String>> categoryList(SqlSessionTemplate sqlSession, String category);
	
	List<Map<String, String>> performAllList(SqlSessionTemplate sqlSession, String category);

	List<Map<String, String>> performSelectList(SqlSessionTemplate sqlSession, Map<String, String> map,int cPage, int numPerPage);

	Map<String, Object> performSelectOne(SqlSessionTemplate sqlSession, int no);

	List<Map<String, Object>> performReview(SqlSessionTemplate sqlSession, int no, int cPage, int numPerPage);

	int performReviewInsert(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int performReviewDelete(SqlSessionTemplate sqlSession, int reviewNo);

	Map<String, Object> performReviewOne(SqlSessionTemplate sqlSession, int reviewNo);

	int performReviewUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int performSelectTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map);

	int performReviewTotalCount(SqlSessionTemplate sqlSession, int no);

	int performQuestionInsert(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Map<String, Object>> performQuestion(SqlSessionTemplate sqlSession, int no, int cPage, int numPerPage);

	List<Map<String, String>> performQuestionReview(SqlSessionTemplate sqlSession, int no);

	int performQuestionReviewEnd(SqlSessionTemplate sqlSession, Map<String, Object> map);

	Map<String, Object> performQuestionOne(SqlSessionTemplate sqlSession, int questionNo);

	int performQuestionUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int performQuestionDelete(SqlSessionTemplate sqlSession, int questionNo);

	int performQuestionReviewDelete(SqlSessionTemplate sqlSession, int questionNo);

	int performQuestionReviewUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int performQuestionTotalCount(SqlSessionTemplate sqlSession, int no);

	List<Map<String, Object>> performReviewCheckList(SqlSessionTemplate sqlSession, int no);

	List<Map<String, Object>> performQuestionCheckList(SqlSessionTemplate sqlSession, int no);

	List<Map<String, Object>> likeCheckList(SqlSessionTemplate sqlSession, int no);

	int performReivewLikeInsert(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	int performReivewLikeDelete(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	int reviewLikeCount(SqlSessionTemplate sqlSession, int reviewNo);
	
	int performReviewNo(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int likeCheckDefault(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	
	
	List<Map<String, Object>> performAutocomplete(SqlSessionTemplate sqlSession, String value);

	List<Map<String, String>> performNameList(SqlSessionTemplate sqlSession);

	int searchPerformName(SqlSessionTemplate sqlSession,String performName);

	List<Map<String, String>> rankList(SqlSessionTemplate sqlSession, String category);

	List<Map<String, String>> contentList(SqlSessionTemplate sqlSession, int no);

	int performReviewAvgScore(SqlSessionTemplate sqlSession, int no);


	

	


	


	

	

	

	

	

}
