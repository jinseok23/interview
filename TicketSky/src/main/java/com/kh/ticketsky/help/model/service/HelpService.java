package com.kh.ticketsky.help.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ticketsky.help.model.vo.Consult;
import com.kh.ticketsky.help.model.vo.Faq;
import com.kh.ticketsky.help.model.vo.Notice;

public interface HelpService {

	List<Consult> selectConsultList();
	
	int consultInsert(Consult consult);

	int noticeEnroll(Map<String, Object> map);

	List<Map<String, Object>> selectNoticeList(Map<String, Object> map, int cPage, int numPerPage);

	int selectNoticeCount();

	Map<String, Object> selectNoticeOne(int noticeNo);

	Notice selectNotice(int noticeNo);

	int modifyEnd(Notice notice);

	int noticeDelete(int noticeNo);

	List<Map<String, Object>> faqSelectAll();

	List<Map<String, Object>> selectFaqList(int cateNo);

	int updateCount(int noticeNo);

	List<Map<String, Object>> consultView(String userId);

	Map<String, Object> selectMemberOne(String userId);

	int consultFrmInsert(Map<String, Object> map);

	List<Map<String, Object>> consultAdmin();

	Map<String, Object> consultAnswer(int consult_no);

	int answerInsert(Map<String, Object> map);

	Map<String, Object> consultAnswerCheck(int consult_no);
	
}
