package com.kh.ticketsky.performance.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.performance.model.service.PerformanceService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class PerformanceController {

	private Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	@Autowired
	private PerformanceService service;
	
	@RequestMapping(value="/performance/performanceAllList.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performanceAllList(String category, Model model)	{
		
		List<Map<String,String>> allList = service.performAllList(category);
		List<Map<String,String>> categoryList = service.categoryList(category);
		List<Map<String,String>> rankList = service.rankList(category);
		
		model.addAttribute("category", category);
		model.addAttribute("rankList", rankList);
		model.addAttribute("allList", allList);
		model.addAttribute("categoryList", categoryList);
		
		return "performance/performanceAllList";

	}
	
	@RequestMapping(value="/performance/performanceSelectList.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performanceSelectList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
			String category, String subCategory, Model model, HttpServletRequest req)
	{
		Map<String,String> map = new HashMap<String, String>();
		int numPerPage = 8;
		
		map.put("category", category);
		map.put("subCategory", subCategory);
		
		List<Map<String,String>> list = service.performSelectList(map, cPage, numPerPage);
		List<Map<String,String>> categoryList = service.categoryList(category);
	
		int totalCount = service.performSelectTotalCount(map);
		String pageBar = new Page().getPage(category, subCategory,cPage, numPerPage, totalCount, req.getRequestURI());
		
		model.addAttribute("category", category);
		model.addAttribute("subCategory",subCategory);
		model.addAttribute("selectList", list);		
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("totalCount", totalCount);
		
		return "performance/performanceSelectList";
		
	}
	
	@RequestMapping(value="/performance/performanceView.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performanceView(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, 
			ModelAndView mv, int no, HttpServletRequest req) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		int numPerPage = 5;
		List<Map<String,Object>> reviewList = service.performReview(no, cPage, numPerPage);
		List<Map<String,Object>> reviewCheckList = service.performReviewCheckList(no);
		int reviewTotalCount = service.performReviewTotalCount(no);
		List<Map<String,Object>> likeCheckList = service.likeCheckList(no);
		String reviewPageBar = new Page().getPage(no, cPage, numPerPage, reviewTotalCount, req.getRequestURI());
		List<Map<String,String>> contentList = service.contentList(no);
		
		List<Map<String,Object>> questionList = service.performQuestion(no, cPage, numPerPage);
		List<Map<String,Object>> questionCheckList = service.performQuestionCheckList(no);
		int questionTotalCount = service.performQuestionTotalCount(no);
		String questionPageBar = new Page().getQuestionPage(no, cPage, numPerPage, questionTotalCount, req.getRequestURI());
		
		int avgScore=1;
		try {
			avgScore = service.performReviewAvgScore(no);
		}
		catch(Exception e)
		{
			avgScore=1;
		}
		
		map = service.performSelectOne(no);
		
		logger.info("######################"+map);
		if(map==null)
		{
			String msg="접근할 수 없습니다.";
			String loc="/";
			mv.setViewName("common/msg");
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			return mv;
		}
		else {
			mv.addObject("contentList", contentList);
			mv.addObject("reviewTotalCount", reviewTotalCount);
			mv.addObject("reviewList", reviewList);
			mv.addObject("reviewCheckList", reviewCheckList);
			mv.addObject("likeCheckList", likeCheckList);
			
			mv.addObject("questionList", questionList);
			mv.addObject("questionCheckList", questionCheckList);
			
			mv.addAllObjects(map);
			mv.addObject("avgScore", avgScore);
			mv.addObject("reviewPageBar", reviewPageBar);
			mv.addObject("questionPageBar",questionPageBar);
			mv.addObject("no", no);
			mv.setViewName("performance/performanceView");
			
			return mv;
		}
	}
	
	@RequestMapping(value="/performance/performReviewInsert.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performReviewInsert(Model model, String review, int no,String userId, int starScore) {

		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("review", review);
		map.put("no", no);
		map.put("score",starScore);
		map.put("userId", userId);
		
		int result = service.performReviewInsert(map);
		int reviewNo = service.performReviewNo(map);
		map.put("reviewNo",reviewNo);
		int result2= service.likeCheckDefault(map);
		
		return "redirect:/performance/performanceView.do?no="+no;
	}
	
	@RequestMapping(value="/performance/performReviewDelete.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performReviewDelete(Model model, int reviewNo, int no)
	{
		
		int result = service.performReviewDelete(reviewNo);
		return "redirect:/performance/performanceView.do?no="+no;
	}
	
	@RequestMapping(value="/performance/performReviewUpdate.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performReviewUpdate(int reviewNo,int no, Model model) 
	{
		
		Map<String,Object> map = service.performReviewOne(reviewNo);
		List<Map<String,Object>> likeCheckList = service.likeCheckList(no);
		
		model.addAllAttributes(map);
		model.addAttribute("likeCheckList", likeCheckList);
		
		return "/performance/reviewUpdateForm";
	}
	
	@RequestMapping(value="/performance/performReviewUpdateCancel.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performReviewUpdateCancel(int reviewNo,int no, Model model)
	{
		
		Map<String,Object> map = service.performReviewOne(reviewNo);
		List<Map<String,Object>> likeCheckList = service.likeCheckList(no);
		
		model.addAttribute("likeCheckList", likeCheckList);
		model.addAllAttributes(map);
		
		return "/performance/reviewForm";
	}
	@RequestMapping(value="/performance/performReviewUpdateEnd.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performReviewUpdateEnd(Model model,int no, int reviewNo, int starUpdateScore, String reviewUp_message)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> likeCheckList = service.likeCheckList(no);
		
		
		map.put("reviewNo", reviewNo);
		map.put("reviewUp_message", reviewUp_message);
		map.put("starUpdateScore", starUpdateScore);
		int result = service.performReviewUpdateEnd(map);
		
		Map<String,Object> upMap = service.performReviewOne(reviewNo);
		model.addAllAttributes(upMap);
		model.addAttribute("likeCheckList", likeCheckList);
		
		return "/performance/reviewForm";
		
	} 
	@RequestMapping(value="/performance/performReviewPaging.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performReviewPaging(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, int no, ModelAndView mv, HttpServletRequest req) throws Exception
	{
		int numPerPage = 5;
		logger.info("################# no ="+no);
		List<Map<String,Object>> reviewList = service.performReview(no, cPage, numPerPage);
		int reviewTotalCount = service.performReviewTotalCount(no);
		String reviewPageBar = new Page().getPage(no, cPage, numPerPage, reviewTotalCount, req.getRequestURI());
		List<Map<String,Object>> likeCheckList = service.likeCheckList(no);
		
		mv.addObject("likeCheckList", likeCheckList);
		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewPageBar", reviewPageBar);
		mv.setViewName("/performance/reviewPaging");
		return mv;
	}

	@RequestMapping(value="/performance/performQuestionInsert.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performQuestionInsert(String question, int quest_level,String userId, int no, Model model)
	{
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("question", question);
		map.put("no", no);
		map.put("level", quest_level);
		map.put("userId", userId);
		
		int result = service.performQuestionInsert(map);
		
		return "redirect:/performance/performanceView.do?no="+no;
	}
	@RequestMapping(value="/performance/performQuestionReview.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionReview(int no, ModelAndView mv, HttpServletResponse res )
	{

		List<Map<String,String>> questionReviewList1 = service.performQuestionReview(no);
		List<Map<String,String>> questionReviewList=new ArrayList<Map<String,String>>();
		
		for(Map m : questionReviewList1)
		{
			Map temp=new HashMap();
			Set s=m.keySet();
			Iterator it=s.iterator();
			while(it.hasNext())
			{
				String key=(String)it.next();
				if(key.equals("QUESTIONDATE"))
				{
					temp.put(key, ((Date)m.get(key)).getTime());
				}
				else temp.put(key, m.get(key));
			}
			questionReviewList.add(temp);
		}
		
		logger.info(""+questionReviewList);
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionReviewList", questionReviewList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/performQuestionReviewForm.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionReviewForm(String userId,int no, ModelAndView mv, HttpServletResponse res)
	{
		
		List<Map<String,String>> questionReviewList1 = service.performQuestionReview(no);
		List<Map<String,String>> questionReviewList=new ArrayList<Map<String,String>>();
		
		
		for(Map m : questionReviewList1)
		{
			Map temp=new HashMap();
			Set s=m.keySet();
			Iterator it=s.iterator();
			while(it.hasNext())
			{
				String key=(String)it.next();
				if(key.equals("QUESTIONDATE"))
				{
					temp.put(key, ((Date)m.get(key)).getTime());
				}
				else temp.put(key, m.get(key));
			}
			questionReviewList.add(temp);
		}
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
		
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionReviewList", questionReviewList);
		mv.addObject("userId", userId);
		mv.addObject("mTime", mTime);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/performQuestionReviewEnd.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionReviewEnd(String questionReview_message,int level,
			int no,String userId,int performNo, ModelAndView mv, HttpServletResponse res)
	{
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("questionReview_message", questionReview_message);
		map.put("no", no);
		map.put("level", level);
		map.put("userId", userId);
		map.put("performNo", performNo);
		int result = service.performQuestionReviewEnd(map);
		
		List<Map<String,String>> questionReviewList1 = service.performQuestionReview(no);
		List<Map<String,String>> questionReviewList=new ArrayList<Map<String,String>>();
		
		for(Map m : questionReviewList1)
		{
			Map temp=new HashMap();
			Set s=m.keySet();
			Iterator it=s.iterator();
			while(it.hasNext())
			{
				String key=(String)it.next();
				if(key.equals("QUESTIONDATE"))
				{
					temp.put(key, ((Date)m.get(key)).getTime());
				}
				else temp.put(key, m.get(key));
			}
			questionReviewList.add(temp);
		}
		
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionReviewList", questionReviewList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/performQuestionUpdateCancel.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionUpdateCancel(int questionNo,ModelAndView mv, HttpServletResponse res)
	{
		
		Map<String,Object> questionMap = service.performQuestionOne(questionNo);
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionMap", questionMap);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="/performance/performQuestionUpdateEnd.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionUpdateEnd(int questionNo,String questionUpdate_message, ModelAndView mv, HttpServletResponse res)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("questionNo", questionNo);
		map.put("questionUpdate_message", questionUpdate_message);
		int result = service.performQuestionUpdateEnd(map);
		Map<String,Object> questionMap = service.performQuestionOne(questionNo);
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionMap", questionMap);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="/performance/performQuestionDelete.do", method={RequestMethod.POST,RequestMethod.GET})
	public String performQuestionDelete(int questionNo,int performNo)
	{
		Map<String,Object> questionMap = service.performQuestionOne(questionNo);
		int result = service.performQuestionDelete(questionNo);
		
		return "redirect:/performance/performanceView.do?no="+performNo;
	}
	@RequestMapping(value="/performance/performQuestionReviewUpdateCancel.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionReviewUpdateCancel(int questionNo, ModelAndView mv, HttpServletResponse res)
	{
		Map<String,Object> questionMap = service.performQuestionOne(questionNo);
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionMap", questionMap);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/performQuestionReviewUpdateEnd.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionReviewUpdateEnd(int questionNo, String questionReviewUpdate_message, 
			ModelAndView mv, HttpServletResponse res)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("questionReviewUpdate_message", questionReviewUpdate_message);
		map.put("questionNo", questionNo);
		
		int result = service.performQuestionReviewUpdateEnd(map);
		
		Map<String,Object> questionMap = service.performQuestionOne(questionNo);
		
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionMap", questionMap);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/performQuestionReviewDelete.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionReviewDelete(int questionNo, ModelAndView mv)
	{
		Map<String,Object> questionMap = service.performQuestionOne(questionNo);
		int result = service.performQuestionReviewDelete(questionNo);
		
		mv.addObject("questionMap", questionMap);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="/performance/performQuestionPaging.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performQuestionPaging(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, int no, ModelAndView mv, String USERID, HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		int numPerPage = 5;
		
		/*List<Map<String,Object>> reviewList = service.performReview(no, cPage, numPerPage);
		int reviewTotalCount = service.performReviewTotalCount(no);
		String reviewPageBar = new Page().getPage(no, cPage, numPerPage, reviewTotalCount, req.getRequestURI());*/
		List<Map<String,Object>> questionList = service.performQuestion(no, cPage, numPerPage);
		int questionTotalCount = service.performQuestionTotalCount(no);
		logger.info("###페이징처리 확인 :"+cPage+", "+no+", "+numPerPage+", "+questionTotalCount);
		String questionPageBar = new Page().getQuestionPage(no, cPage, numPerPage, questionTotalCount, req.getRequestURI());
		
		res.setCharacterEncoding("UTF-8");
		mv.addObject("questionList", questionList);
		mv.addObject("USERID", USERID);
		mv.addObject("questionPageBar", questionPageBar);
		mv.setViewName("/performance/questionPaging");
		return mv;
	}
	
	@RequestMapping(value="/performance/performReivewLikeInsert.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performReivewLikeInsert(ModelAndView mv, 
			String userId, int reviewNo, int performNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("reviewNo", reviewNo);
		map.put("performNo", performNo);
		int result = service.performReivewLikeInsert(map);
		
		int reviewLikeCount = service.reviewLikeCount(reviewNo);
		mv.addObject("reviewLikeCount", reviewLikeCount);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/performReivewLikeDelete.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performReivewLikeDelete(ModelAndView mv, 
			String userId, int reviewNo, int performNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("reviewNo", reviewNo);
		map.put("performNo", performNo);
		int result = service.performReivewLikeDelete(map);
		
		int reviewLikeCount = service.reviewLikeCount(reviewNo);
		mv.addObject("reviewLikeCount", reviewLikeCount);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	
	
	
	@RequestMapping(value="/performance/performAutocomplete.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performAutocomplete(ModelAndView mv, String value, HttpServletRequest request, HttpServletResponse res) throws Exception
	{
		
		res.setCharacterEncoding("UTF-8");
		logger.info("#########value="+value);
	    List<Map<String,Object>> pList = service.performAutocomplete(value);
	    
	    JSONArray list = new JSONArray();
	    JSONObject object = null;

	     object = new JSONObject();
	     for(Map<String,Object> map:pList)
	     {
	    	 object.put("data", map.get("PERFORMNAME"));
	    	 list.add(object);
	     }
	    
	    PrintWriter pw = res.getWriter();
	    pw.print(list);
	    pw.flush();
	    pw.close();
	    
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="/performance/performNameList.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView performNameList(ModelAndView mv,HttpServletResponse res)
	{
		
		List<Map<String,String>> performNameList = service.performNameList();
		res.setCharacterEncoding("UTF-8");
		logger.info("시발:"+performNameList);
		mv.addObject("performNameList", performNameList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/performance/searchPerformName", method={RequestMethod.POST,RequestMethod.GET})
	public String searchPerformName(Model model,String performName,HttpServletResponse res)
	{
		
		int performNo = service.searchPerformName(performName);

		
		return "redirect:/performance/performanceView.do?no="+performNo;
	}
	
}

