package com.kh.ticketsky.reserve.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;
import com.kh.ticketsky.reserve.model.service.ReserveService;
import com.kh.ticketsky.reserve.model.vo.Purchase;
import com.kh.ticketsky.user.model.vo.Member;

@Controller
public class ReseveController {
	
	@Autowired
	private ReserveService service;
	
	
	@RequestMapping("/reserve/selectSchedule")
	public ModelAndView orderForm(HttpSession session, int performNo)
	{
		ModelAndView mv = new ModelAndView();
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String id=m.getUserId();
		
//		performNo
		/*int performNo = 28;*/
		
		PerformInfo pi = service.selectPerformInfo(performNo);
		
		mv.addObject("userId", id);
		mv.addObject("pi",pi);
		mv.setViewName("reserve/selectSchedule");
		return mv;
	}
	
	@RequestMapping("reserve/getAvailableDates")
	@ResponseBody
	public String getAvailableDates(int performNo) throws Exception{
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		
		List<PerformDate> list = service.getAvailableDates(performNo);	
		
		for(int i=0; i<list.size(); i++)
		{			
			String date= list.get(i).getPerformDate().substring(0,10);			
			list.get(i).setPerformDate(date);
		}
		
		map.put("list", list);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	@RequestMapping("reserve/getTime")
	@ResponseBody
	public String getDate(String ymd, int performNo) throws Exception {
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		
		/*System.out.println("입력된날짜 : "+changeDate);
		System.out.println("공연번호 : "+performNo);*/
		
		Map<String,Object> dateMap = new HashMap<String, Object>();
		dateMap.put("changeDate", ymd);
		dateMap.put("changeDate2", ymd);
		dateMap.put("performNo", performNo);
		
		/*System.out.println("map에 저장된 데이터");
		System.out.println(dateMap.get("changeDate"));
		System.out.println(dateMap.get("changeDate2"));
		System.out.println(dateMap.get("performNo"));
		System.out.println("-----------------");*/
		
		List<PerformDate> list = service.getTime(dateMap);	
				
		/*for(int i=0; i<list.size(); i++)
		{			
			String str = list.get(i).getPerformDate().substring(11,16);
			String[] array = str.split(":");
			String time=array[0]+"시\t"+array[1]+"분";			
			list.get(i).setPerformDate(URLEncoder.encode(time,"UTF-8"));
			System.out.println(list.get(i).getPerformDate());
		}*/
		
		map.put("list", list);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
		
	}
	
	@RequestMapping("/reserve/getSeatInfo")
	@ResponseBody
	public String getSeatInfo(int performDateNo) throws Exception {
		
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		
		List<SeatInfo> list = service.getSeatInfo(performDateNo);
		
		for(int i=0; i<list.size(); i++)
		{
			list.get(i).setSeatLevel(URLEncoder.encode(list.get(i).getSeatLevel(),"UTF-8"));
			list.get(i).setSeatName(URLEncoder.encode(list.get(i).getSeatName(),"UTF-8"));
			int seatInfoNo = list.get(i).getSeatInfoNo();
			
//			예약가능한 좌석수 조회 
//			list의 seatCount는 시작부터 끝좌석까지의 수.... ㅠㅠ
			int count = service.getSeatCount(seatInfoNo);					
			list.get(i).setSeatCount(count);
			
		}		
		
		
		map.put("list", list);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	@RequestMapping("/reserve/getSeatImg")
	@ResponseBody
	public String getSeatImg(int performNo) throws Exception {
		
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		
		List<SeatImg> list = service.getSeatImg(performNo);
		
		for(int i=0; i<list.size(); i++)
		{
			list.get(i).setOriSeatImg(URLEncoder.encode(list.get(i).getOriSeatImg(),"UTF-8"));
			list.get(i).setSeatContent(URLEncoder.encode(list.get(i).getSeatContent(),"UTF-8"));
		}
		
		map.put("list", list);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	
	@RequestMapping("/reserve/selectSeats")
	public ModelAndView orderSeats(HttpServletRequest request) throws UnsupportedEncodingException
	{
		ModelAndView mv = new ModelAndView();
		
		
		int performNo = Integer.parseInt(request.getParameter("performNo"));
		int index = Integer.parseInt(request.getParameter("index"));
		int performDateNo = Integer.parseInt(request.getParameter("performDateNo_"+index));
		String performDate = request.getParameter("performDate");
		
		PerformInfo pi = service.selectPerformInfo(performNo);
		
		mv.addObject("pi",pi);
		mv.addObject("performNo", performNo);
		mv.addObject("performDateNo", performDateNo);
		mv.addObject("performDate",performDate);
		mv.setViewName("reserve/selectSeats");
		return mv;
		
	}
	
	@RequestMapping("/reserve/getAvailableSeat")
	@ResponseBody
	public String getAvailableSeat(int seatInfoNo) throws Exception {
		
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		
		SeatInfo si = service.selectSeat(seatInfoNo);
		
		List<SeatData> sdList = service.selectSeatData(seatInfoNo);
		
		map.put("seatInfo", si);
		map.put("sdList", sdList);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	@RequestMapping("/reserve/selectSeatInfo")
	@ResponseBody
	public String selectSeatInfo(int seatInfoNo) throws Exception {
		
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		
		SeatInfo seatInfo = service.selectSeat(seatInfoNo);		
		
		seatInfo.setSeatLevel(URLEncoder.encode(seatInfo.getSeatLevel(),"UTF-8"));
		seatInfo.setSeatName(URLEncoder.encode(seatInfo.getSeatName(),"UTF-8"));
		
		map.put("seatInfo", seatInfo);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	@RequestMapping("/reserve/selectPurchase")
	public ModelAndView selectPurchase(HttpServletRequest request,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		int performNo = Integer.parseInt(request.getParameter("performNo"));
		String performName = request.getParameter("performName");
		int count = Integer.parseInt(request.getParameter("selectCount"));
		String rePosterImg = request.getParameter("rePosterImg");
		String performDate = request.getParameter("performDate");
		List<Purchase> pcList = new ArrayList<Purchase>();
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		
		String id =m.getUserId();
		
		int totalPrice=0;
		for(int i=0; i<count; i++)
		{
			Purchase p = new Purchase();
//					
			p.setUserId(id);
			p.setPerformNo(performNo);	
			p.setPerformName(performName);	
			p.setOriPrice(Integer.parseInt(request.getParameter("seatPrice_"+i)));
			p.setActualPrice(Integer.parseInt(request.getParameter("seatPrice_"+i)));  //할인없음
//			cancel
			p.setWatchDate(performDate);
//			purchaseDate
			p.setPurchaseSeat(request.getParameter("purchaseSeat_"+i));
			p.setSeatDataNo(Integer.parseInt(request.getParameter("seatDataNo_"+i)));					
			totalPrice+=p.getOriPrice();
			pcList.add(p);
		}
		session.setAttribute("pcList", pcList);
		
		mv.addObject("performNo",performNo);
		mv.addObject("member", m);		
		mv.addObject("totalPrice",totalPrice);
		mv.addObject("performDate",performDate);
		mv.addObject("performName",performName);
		mv.addObject("rePosterImg",rePosterImg);
		mv.addObject("pcList",pcList);		
		mv.setViewName("reserve/selectPurchase");
		return mv;
	}
	
	@RequestMapping("/reserve/reserveEnd")
	public ModelAndView reserveEnd(HttpSession session,String payMethod)
	{
		ModelAndView mv = new ModelAndView();
		
		
		
//		결제정보 등록
		List<Purchase> pcList =(List)session.getAttribute("pcList");
		
		String paymentMethod= "";
		if(payMethod.equals("card"))
		{
			paymentMethod="카드결제";
		}
		else if(payMethod.equals("phone"))
		{
			paymentMethod="휴대폰 결제";
		}
		
		int result =0;
		
		
		for(int i=0; i< pcList.size(); i++)
		{
			Purchase p = new Purchase();
			p.setUserId(pcList.get(i).getUserId());
			p.setPerformNo(pcList.get(i).getPerformNo());
			p.setPerformName(pcList.get(i).getPerformName());
			p.setOriPrice(pcList.get(i).getOriPrice());
			p.setActualPrice(pcList.get(i).getActualPrice());
//			cancel
//			status
			p.setPaymentMethod(paymentMethod);
			p.setWatchDate(pcList.get(i).getWatchDate());
//			purchaseDate
			p.setPurchaseSeat(pcList.get(i).getPurchaseSeat());
			p.setSeatDataNo(pcList.get(i).getSeatDataNo());
			
//			예매내역 insert
			result = service.insertPurchase(p);
			
			if(result>0)
			{
//				결제한 좌석 예약유무 Y로 변경
				result= service.updateSeatData(pcList.get(i).getSeatDataNo());				
			}
			else
			{
//				insert실패
				return mv;
			}
		}
		
		session.removeAttribute("pcList");
		
		mv.setViewName("reserve/reserveEnd");
		return mv;
	}
	
}
