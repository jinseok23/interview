package com.kh.ticketsky.recommend.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class RecommendDaoImpl implements RecommendDao 
{

	@Override
	public List<Map<String, String>> selectRecommendList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) 
	{
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("recommend.selectRecommendList",row);
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) 
	{
		return sqlSession.selectOne("recommend.selectRecommendTotalCount");
	}

	
	@Override
	public List<Map<String, String>> selectCategoryRecommendList(SqlSessionTemplate sqlSession, int cPage,
			int numPerPage, int categoryNo) 
	{
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("recommend.selectCategoryRecommendList",categoryNo,row);

	}
	
	
}
