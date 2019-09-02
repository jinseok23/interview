package com.kh.ticketsky.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.user.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int consumerReviewDelete(SqlSessionTemplate sqlSession, String reviewno) {
		return sqlSession.update("consumer.consumerReviewDelete",reviewno);
	}

	@Override
	public int consumerInquiryDelete(SqlSessionTemplate sqlSession, String questionno) {
		return sqlSession.update("consumer.consumerInquiryDelete",questionno);
	}

	@Override
	public int selectconsumerMyInquiry(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("consumer.selectconsumerMyInquiry",map);
	}

	@Override
	public List<Map<String, String>> selectSellermonthAcount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectList("seller.selectSellermonthAcount",map);

	}

	@Override
	public List<Map<String, String>> consumerMyInquiry(SqlSessionTemplate sqlSession, int cPage, int numPerPage,
			Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);

		return sqlSession.selectList("consumer.consumerMyInquiry",map,row);
	}

	@Override
	public int selectconsumerMyReview(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("consumer.selectconsumerMyReview",map);
	}

	@Override
	public int deleteReserve(SqlSessionTemplate sqlSession, String purchasecode) {
		return sqlSession.update("consumer.deleteReserve",purchasecode);
	}

	@Override
	public List<Map<String, String>> consumerMyReview(SqlSessionTemplate sqlSession, int cPage, int numPerPage, Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);

		return sqlSession.selectList("consumer.consumerMyReview",map,row);
	}

	@Override
	public List<Map<String, String>> selectSellerMonthStatus(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectList("seller.selectSellerMonthStatus",map);
	}

	@Override
	public int selectSellerStatusUserIdCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("seller.selectSellerStatusUserIdCount",map);
	}

	@Override
	public List<Map<String, String>> selectSellerAgeStatus(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectList("seller.selectSellerAgeStatus",map);

	}

	@Override
	public List<Map<String, String>> selectSellerGenderStatus(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectList("seller.selectSellerGenderStatus",map);
	}

	@Override
	public int selectReserveListCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("consumer.selectReserveListCount",map);
	}

	@Override
	public int selectSellerPlayTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("seller.selectSellerPlayTotalCount",map);
	}

	@Override
	public List<Map<String, String>> selectSellerStatusUserId(SqlSessionTemplate sqlSession,int cPage, int numPerPage, Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("seller.selectSellerStatusUserId",map,row);
	}

	@Override
	public List<Map<String, String>> selectMyPlayList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,
			Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("seller.selectMyPlayList",map,row);
	}

	@Override
	public List<Map<String, String>> selectReserveList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,
			Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("consumer.selectReserveList",map,row);
	}


	@Override
	public int selectSellerTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("member.selectSellerTotalCount",map);
	}

	@Override
	public List<Member> selectSellerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectSellerList",map,row);
	}

	@Override
	public int updateConsumerRating(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("member.updateConsumerRating",map);
	}

	@Override
	public List<Map<String, String>> selectConsumerRating(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("member.selectConsumerRating");
	}

	@Override
	public List<Member> selectConsumerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectConsumerList",map,row);
	}

	@Override
	public int selectConsumerTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("member.selectConsumerTotalCount",map);
	}

	@Override
	public int insertSeller(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("member.insertSeller",member);

	}

	@Override
	public int deleteConsumer(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("member.deleteConsumer",userId);
	}

	@Override
	public int updateConsumer(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member.updateConsumer",m);
	}

	@Override
	public int insertConsumer(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("member.insertConsumer",member);
	}

	@Override
	public Member selectOne(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("member.selectOne", userId);
	}
	
	
	
	
	
	
	
	@Override
	   public int findPassword(SqlSessionTemplate sqlSession, Member m)
	   {
	      return sqlSession.update("member.findPassword",m);
	   }

	   @Override
	   public Member selectId(SqlSessionTemplate sqlSession, Map<String, String> map) 
	   {
	      return sqlSession.selectOne("member.selectId",map);
	   }

	@Override
	public List<PerformInfo> selectAllowablePerform(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("info.selectAllowablePerform");
	}

	@Override
	public List<PerformInfo> selectDisallowancePerform(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("info.selectDisallowancePerform");
	}

	   
		
	   
	   

}
