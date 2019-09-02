package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

public interface PerformanceService {

	List<Map<String, String>> categoryList(String category);
	
	List<Map<String, String>> performAllList(String category);

	List<Map<String, String>> performSelectList(Map<String, String> map, int cPage, int numPerPage);

	Map<String, Object> performSelectOne(int no);

	List<Map<String, Object>> performReview(int no, int cPage, int numPerPage);

	int performReviewInsert(Map<String, Object> map);

	int performReviewDelete(int reviewNo);

	Map<String, Object> performReviewOne(int reviewNo);

	int performReviewUpdateEnd(Map<String, Object> map);

	int performSelectTotalCount(Map<String, String> map);

	int performReviewTotalCount(int no);

	int performQuestionInsert(Map<String, Object> map);

	List<Map<String, Object>> performQuestion(int no, int cPage, int numPerPage);

	List<Map<String, String>> performQuestionReview(int no);

	int performQuestionReviewEnd(Map<String, Object> map);

	Map<String, Object> performQuestionOne(int questionNo);

	int performQuestionUpdateEnd(Map<String, Object> map);

	int performQuestionDelete(int questionNo);

	int performQuestionReviewDelete(int questionNo);

	int performQuestionReviewUpdateEnd(Map<String, Object> map);

	int performQuestionTotalCount(int no);

	List<Map<String, Object>> performReviewCheckList(int no);

	List<Map<String, Object>> performQuestionCheckList(int no);

	List<Map<String, Object>> likeCheckList(int no);

	int performReivewLikeInsert(Map<String, Object> map);
	
	int performReivewLikeDelete(Map<String, Object> map);

	int reviewLikeCount(int reviewNo);

	int performReviewNo(Map<String, Object> map);

	int likeCheckDefault(Map<String, Object> map);
	
	
	
	List<Map<String, Object>> performAutocomplete(String value);

	List<Map<String, String>> performNameList();

	int searchPerformName(String performName);

	List<Map<String, String>> rankList(String category);

	List<Map<String, String>> contentList(int no);

	int performReviewAvgScore(int no);



	


	

	

	

	

	

}
