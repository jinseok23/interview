package com.kh.ticketsky.user.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.user.model.vo.Member;

public interface UserService {

	int insertConsumer(Member member);

	Member selectOne(String userId);

	int updateConsumer(Member m);

	int deleteConsumer(String userId);

	int insertSeller(Member member);

	List<Member> selectConsumerList(int cPage, int numPerPage, Map<String, String> map);

	int selectConsumerTotalCount( Map<String, String> map);

	List<Map<String, String>> selectConsumerRating();

	int updateConsumerRating(Map<String, String> map);

	List<Member> selectSellerList(int cPage, int numPerPage, Map<String, String> map);

	int selectSellerTotalCount(Map<String, String> map);

	List<Map<String, String>> selectMyPlayList(int cPage, int numPerPage, Map<String, String> map);

	int selectSellerPlayTotalCount(Map<String, String> map);

	List<Map<String, String>> selectReserveList(int cPage, int numPerPage, Map<String, String> map);

	int selectReserveListCount(Map<String, String> map);

	List<Map<String, String>> selectSellerStatusUserId(int cPage, int numPerPage, Map<String, String> map);

	List<Map<String, String>> selectSellerGenderStatus(Map<String, String> map);

	List<Map<String, String>> selectSellerAgeStatus(Map<String, String> map);

	List<Map<String, String>> selectSellerMonthStatus(Map<String, String> map);

	List<Map<String, String>> selectSellermonthAcount(Map<String, String> map);
	
	
	
	
	  int findPassword(Member m);

	   Member selectId(Map<String, String> map);

	int selectSellerStatusUserIdCount(Map<String, String> map);

	int deleteReserve(String purchasecode);
	
	List<PerformInfo> selectAllowablePerform();

	List<PerformInfo> selectDisallowancePerform();

	
	
	int consumerReviewDelete(String reviewno);

	List<Map<String, String>> consumerMyReview(int cPage, int numPerPage, Map<String, String> map);

	int selectconsumerMyReview(Map<String, String> map);

	List<Map<String, String>> consumerMyInquiry(int cPage, int numPerPage, Map<String, String> map);

	int selectconsumerMyInquiry(Map<String, String> map);

	int consumerInquiryDelete(String questionno);
	

}
