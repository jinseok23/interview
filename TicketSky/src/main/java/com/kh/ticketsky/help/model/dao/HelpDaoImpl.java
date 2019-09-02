package com.kh.ticketsky.help.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.help.model.vo.Consult;
import com.kh.ticketsky.help.model.vo.Notice;

@Repository
public class HelpDaoImpl implements HelpDao {

	// 상담 화면 이동(내역)
	@Override
	public List<Consult> selectConsultList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("help.selectConsultList");
	}

	@Override
	public int consultInsert(SqlSessionTemplate sqlSession, Consult consult) {
		return sqlSession.insert("help.consultInsert", consult);
	}

	@Override
	public int noticeEnroll(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("help.noticeEnroll", map);
	}

	@Override
	public List<Map<String, Object>> selectNoticeList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage,
			int numPerPage) {
		return sqlSession.selectList("help.selectNoticeList", map, new RowBounds((cPage - 1) * numPerPage, numPerPage));
	}

	@Override
	public int selectNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("help.selectNoticeCount");
	}

	@Override
	public Map<String, Object> selectNoticeOne(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("help.selectNoticeOne", noticeNo);
	}

	@Override
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("help.selectNotice", noticeNo);
	}

	@Override
	public int modifyEnd(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.update("help.modifyEnd", notice);
	}

	@Override
	public int noticeDelete(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.delete("help.noticeDelete",noticeNo);
	}

	@Override
	public List<Map<String, Object>> faqSelectAll(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("help.faqSelectAll");
	}

	@Override
	public List<Map<String, Object>> selectFaqList(SqlSessionTemplate sqlSession, int cateNo) {
		return sqlSession.selectList("help.selectFaqList",cateNo);
	}

	@Override
	public int updateCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("help.updateCount",noticeNo);
	}

	@Override
	public List<Map<String, Object>> consultView(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("help.consultView",userId);
	}

	@Override
	public Map<String, Object> selectMemberOne(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("help.selectMemberOne",userId);
	}

	@Override
	public int consultFrmInsert(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("help.consultFrmInsert",map);
	}

	@Override
	public List<Map<String, Object>> consultAdmin(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("help.consultAdmin");
	}

	@Override
	public Map<String, Object> consultAnswer(SqlSessionTemplate sqlSession, int consult_no) {
		return sqlSession.selectOne("help.consultAnswer",consult_no);
	}

	@Override
	public int answerInsert(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("help.answerInsert",map);
	}

	@Override
	public Map<String, Object> consultAnswerCheck(SqlSessionTemplate sqlSession,int consult_no) {
		return sqlSession.selectOne("help.consultAnswerCheck",consult_no);
	}
	
	
	
	
}
