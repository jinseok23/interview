package com.kh.ticketsky.help.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.help.model.dao.HelpDao;
import com.kh.ticketsky.help.model.vo.Consult;
import com.kh.ticketsky.help.model.vo.Faq;
import com.kh.ticketsky.help.model.vo.Notice;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	HelpDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;

	// 상담 화면 이동(내역)
	@Override
	public List<Consult> selectConsultList() {
		return dao.selectConsultList(sqlSession);
	}

	@Override
	public int consultInsert(Consult consult) {
		int result = dao.consultInsert(sqlSession, consult);
		return result;
	}

	@Override
	public int noticeEnroll(Map<String, Object> map) {
		int result = dao.noticeEnroll(sqlSession, map);
		return result;
	}

	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map, int cPage, int numPerPage) {
		return dao.selectNoticeList(sqlSession, map, cPage, numPerPage);
	}

	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount(sqlSession);
	}

	@Override
	public Map<String, Object> selectNoticeOne(int noticeNo) {
		return dao.selectNoticeOne(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		Notice notice = dao.selectNotice(sqlSession, noticeNo);
		return notice;
	}

	@Override
	public int modifyEnd(Notice notice) {
		int result = dao.modifyEnd(sqlSession, notice);
		return result;
	}

	@Override
	public int noticeDelete(int noticeNo) {
		int result = dao.noticeDelete(sqlSession,noticeNo);
		return result;
	}

	@Override
	public List<Map<String, Object>> faqSelectAll() {
		return dao.faqSelectAll(sqlSession);
	}

	@Override
	public List<Map<String, Object>> selectFaqList(int cateNo) {
		return dao.selectFaqList(sqlSession,cateNo);
	}

	@Override
	public int updateCount(int noticeNo) {
		return dao.updateCount(sqlSession,noticeNo);
	}

	@Override
	public List<Map<String, Object>> consultView(String userId) {
		return dao.consultView(sqlSession,userId);
	}

	@Override
	public Map<String, Object> selectMemberOne(String userId) {
		return dao.selectMemberOne(sqlSession, userId);
	}

	@Override
	public int consultFrmInsert(Map<String, Object> map) {
		return dao.consultFrmInsert(sqlSession,map);
	}

	@Override
	public List<Map<String, Object>> consultAdmin() {
		return dao.consultAdmin(sqlSession);
	}

	@Override
	public Map<String, Object> consultAnswer(int consult_no) {
		return dao.consultAnswer(sqlSession,consult_no);
	}

	@Override
	public int answerInsert(Map<String, Object> map) {
		return dao.answerInsert(sqlSession,map);
	}

	@Override
	public Map<String, Object> consultAnswerCheck(int consult_no) {
		return dao.consultAnswerCheck(sqlSession,consult_no);
	}
	
}
