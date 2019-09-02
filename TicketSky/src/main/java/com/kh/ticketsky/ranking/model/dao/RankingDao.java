package com.kh.ticketsky.ranking.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface RankingDao 
{

	List<Map<String, String>> selectRankingList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int selectTotalCount(SqlSessionTemplate sqlSession);

	List<Map<String, String>> selectCategoryRankingList(SqlSessionTemplate sqlSession, int cPage,int numPerPage,Map<String, String> map);
	
}
