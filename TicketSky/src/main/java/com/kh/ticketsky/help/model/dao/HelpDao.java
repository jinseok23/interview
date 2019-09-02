package com.kh.ticketsky.help.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.help.model.vo.Consult;
import com.kh.ticketsky.help.model.vo.Notice;

public interface HelpDao{

	List<Consult> selectConsultList(SqlSessionTemplate sqlSession);
	
	int consultInsert(SqlSessionTemplate sqlSession, Consult consult);

	int noticeEnroll(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Map<String, Object>> selectNoticeList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage,
			int numPerPage);

	int selectNoticeCount(SqlSessionTemplate sqlSession);

	Map<String, Object> selectNoticeOne(SqlSessionTemplate sqlSession, int noticeNo);

	Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo);

	int modifyEnd(SqlSessionTemplate sqlSession, Notice notice);

	int noticeDelete(SqlSessionTemplate sqlSession, int noticeNo);

	List<Map<String, Object>> faqSelectAll(SqlSessionTemplate sqlSession);

	List<Map<String, Object>> selectFaqList(SqlSessionTemplate sqlSession, int cateNo);

	int updateCount(SqlSessionTemplate sqlSession, int noticeNo);

	List<Map<String, Object>> consultView(SqlSessionTemplate sqlSession, String userId);

	Map<String, Object> selectMemberOne(SqlSessionTemplate sqlSession, String userId);

	int consultFrmInsert(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Map<String, Object>> consultAdmin(SqlSessionTemplate sqlSession);

	Map<String, Object> consultAnswer(SqlSessionTemplate sqlSession, int consult_no);

	int answerInsert(SqlSessionTemplate sqlSession, Map<String, Object> map);

	Map<String, Object> consultAnswerCheck(SqlSessionTemplate sqlSession,int consult_no);
	
}
