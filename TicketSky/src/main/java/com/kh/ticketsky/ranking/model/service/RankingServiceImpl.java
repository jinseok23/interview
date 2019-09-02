package com.kh.ticketsky.ranking.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.ranking.model.dao.RankingDao;

@Service
public class RankingServiceImpl implements RankingService 
{
	@Autowired
	private RankingDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<Map<String, String>> selectRankingList(int cPage, int numPerPage) 
	{
		return dao.selectRankingList(sqlSession,cPage, numPerPage);
	}

	@Override
	public int selectTotalCount() 
	{
		return dao.selectTotalCount(sqlSession);
	}

	@Override
	public List<Map<String, String>> selectCategoryRankingList(int cPage, int numPerPage, Map<String, String> map) 
	{
		return dao.selectCategoryRankingList(sqlSession,cPage,numPerPage,map);
	}

	
	
}
