package com.kh.ticketsky.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ticketsky.payment.model.service.PaymentService;
import com.kh.ticketsky.performance.controller.PerformanceController;
import com.kh.ticketsky.performance.model.service.PerformanceService;
import com.kh.ticketsky.user.controller.UserController;
import com.kh.ticketsky.user.model.service.UserService;

@Controller
public class PaymentController 
{

	private Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	@Autowired
	private PaymentService service;
	
	@RequestMapping(value="/payment/payment.do",method= {RequestMethod.GET})
	public ModelAndView Payment(@RequestParam(value="performName", required=false, defaultValue="공연") String performName,
			int performNo)
	{
		
		ModelAndView mv=new ModelAndView();
		System.out.println(performName);
		System.out.println(performNo);
		
	    ObjectMapper mapper = new ObjectMapper();
	    
	    List<Map<String,String>> paymentList = service.performSelectOne(performNo);
	    
		logger.debug("paymentList 리스트 : "+paymentList );
	    
	    mv.addObject("paymentList",paymentList);
		mv.setViewName("payment/paymentResult");
		return mv;
		
	}

}