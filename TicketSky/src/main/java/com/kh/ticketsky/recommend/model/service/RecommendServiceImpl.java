package com.kh.ticketsky.recommend.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.recommend.model.dao.RecommendDao;

@Service
public class RecommendServiceImpl implements RecommendService 
{

	@Autowired
	private RecommendDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<Map<String, String>> selectRecommendList(int cPage, int numPerPage) 
	{
		return dao.selectRecommendList(sqlSession,cPage, numPerPage);
	}

	@Override
	public int selectTotalCount() 
	{
		return dao.selectTotalCount(sqlSession);
	}

	@Override
	public List<Map<String, String>> selectCategoryRecommendList(int cPage, int numPerPage, int categoryNo) 
	{
		return dao.selectCategoryRecommendList(sqlSession,cPage,numPerPage,categoryNo);
	}

	
}
