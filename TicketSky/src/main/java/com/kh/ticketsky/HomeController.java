package com.kh.ticketsky;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.ranking.model.service.RankingService;
import com.kh.ticketsky.recommend.model.service.RecommendService;
import com.kh.ticketsky.user.model.vo.Member;

@SessionAttributes(value= {"memberLoggedIn","snsLoginChk"})
@Controller
public class HomeController 
{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RankingService rankingService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,ModelAndView mv , 
			HttpSession session , HttpServletRequest req) 
	{
		
		logger.debug("목록페이지(cPage) : "+cPage);

		int numPerPage=8;
		
		session.getAttribute("memberLoggedIn");
		
		if(session.getAttribute("memberLoggedIn")==null || session.getAttribute("memberLoggedIn").equals(""))
		{
			List<Map<String,String>> newestList = recommendService.selectRecommendList(cPage,numPerPage);
			List<Map<String,String>> recommendList = rankingService.selectRankingList(cPage,numPerPage);
			
			mv.addObject("newestList",newestList);
			mv.addObject("recommendList",recommendList);
			
		}
		else
		{
			Member m = (Member)session.getAttribute("memberLoggedIn");
			System.out.println(m.getCategoryNo());
			List<Map<String,String>> newestList = recommendService.selectRecommendList(cPage,numPerPage);
			List<Map<String,String>> recommendList = recommendService.selectCategoryRecommendList(cPage,numPerPage,m.getCategoryNo());
			
			mv.addObject("newestList",newestList);
			mv.addObject("recommendList",recommendList);
		}
		
		mv.setViewName("home");
		return mv;
	}
}