package com.kh.ticketsky.ranking.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RankingDaoImpl implements RankingDao 
{
	

	@Override
	public List<Map<String, String>> selectRankingList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) 
	{
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ranking.selectRankingList",row);
		

	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) 
	{
		return sqlSession.selectOne("ranking.selectRankingTotalCount");
	}

	@Override
	public List<Map<String, String>> selectCategoryRankingList(SqlSessionTemplate sqlSession, int cPage,int numPerPage,Map<String, String> map) 
	{
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ranking.selectCategoryRankingList",map,row);

	}

	
	
}
