package com.kh.ticketsky.recommend.model.service;

import java.util.List;
import java.util.Map;

public interface RecommendService 
{

	List<Map<String, String>> selectRecommendList(int cPage, int numPerPage);

	int selectTotalCount();

	List<Map<String, String>> selectCategoryRecommendList(int cPage, int numPerPage, int categoryNo);

	
}
