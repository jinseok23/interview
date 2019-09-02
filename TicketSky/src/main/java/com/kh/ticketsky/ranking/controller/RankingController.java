package com.kh.ticketsky.ranking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.ranking.model.service.RankingService;

@Controller
public class RankingController 
{
	
	
	private Logger logger=LoggerFactory.getLogger(RankingController.class);
	
	@Autowired
	private RankingService service;
	
	@RequestMapping("/ranking/ranking.do")
	public ModelAndView Ranking(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam(value="category", required=false, defaultValue="")String category,ModelAndView mv)
	{
		System.out.println("카테고리 : "+category);
		int numPerPage=10;
		Map<String,String> map = new HashMap<String, String>();
		map.put("cateGory", category );
		List<Map<String,String>> list = new ArrayList<Map<String, String>>();
		
		if(category.equals("") && category.isEmpty())
		{
			list = service.selectRankingList(cPage,numPerPage);
			logger.debug("if 일시 : "+list);
		}
		else
		{
			list = service.selectCategoryRankingList(cPage,numPerPage,map);
			logger.debug("else일시 : "+list);
		}
		
		int totalCount=service.selectTotalCount();
		
		mv.addObject("list",list);
		mv.addObject("totalCount",totalCount);
		mv.addObject("pageBar",Page.getPage(cPage, numPerPage, totalCount, "ranking.do"));

		mv.setViewName("ranking/ranking");
		
		return mv; 
	}

	
	
	
}




