package com.kh.ticketsky.recommend.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface RecommendDao 
{

	List<Map<String, String>> selectRecommendList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int selectTotalCount(SqlSessionTemplate sqlSession);

	List<Map<String, String>> selectCategoryRecommendList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,int categoryNo);

}
