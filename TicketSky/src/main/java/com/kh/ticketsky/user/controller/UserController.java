package com.kh.ticketsky.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.user.model.service.UserService;
import com.kh.ticketsky.user.model.vo.Member;

//value = "" 이렇게 주면 session으로 값 저장하게 됨.
@SessionAttributes(value= {"memberLoggedIn","snsLoginChk"})

/* 대부분 return 쪽 consumer, seller, admin  을 보면 누가 하는지 알수있음 */
@Controller
public class UserController {

	@Autowired
	private JavaMailSender mailSender;
	private Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/* 구매자 - 마이페이지 */
	@RequestMapping("/user/consumerMyPage")
	public String consumerMyPage()
	{
		return "consumer/consumerMyPage";
	}
	
	/* 구매자 - 탈퇴페이지 */
	@RequestMapping("/user/userDelete")
	public String consumerDelete() {
		return "consumer/userDelete";
	}
	
	/* 구매자 - 구매내역 */
	@RequestMapping("/user/reserveList")
	public String reserveList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="year", required=false, defaultValue="") String year,
			@RequestParam(value="month", required=false, defaultValue="") String month,
			HttpServletRequest req, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		
		
		String searchdate = "";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
		if(year.equals("") || month.equals("")) {
			searchdate =sd.format(new Date());
			year = searchdate.substring(0,4);
			month = searchdate.substring(5,7);
		}else {
			searchdate = year + "-" + month;
		}
		
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("year", year);
		map.put("month", month);
		map.put("searchdate", searchdate);
		map.put("userId", m.getUserId());
		
		Date date = new Date();
		
		int numPerPage = 10;
		
		List<Map<String,String>> list = service.selectReserveList(cPage, numPerPage, map);
		int totalCount = service.selectReserveListCount(map);
		
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());

		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		model.addAttribute("date",date);
		return "consumer/reserveList";
		
	}
	
	/* 구매자 - 예매내역 삭제 */
	@RequestMapping("/user/reserveDelete")
	public String reserveDelete(String purchasecode, Model model) {
		String msg="";
		String loc="/user/reserveList";
		int result = service.deleteReserve(purchasecode);
		
		if(result>0){
			msg="예매 취소가 정상적으로 완료되었습니다.";
		}
		else {
			msg="예매 취소가 실패하였습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	/* 구매자 - 리뷰관리 페이지 */
	@RequestMapping("/user/reviewManage")
	public String reviewManage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="year", required=false, defaultValue="") String year,
			@RequestParam(value="month", required=false, defaultValue="") String month,
			HttpServletRequest req,Model model, HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		
		String searchdate = "";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
		if(year.equals("") || month.equals("")) {
			searchdate =sd.format(new Date());
			year = searchdate.substring(0,4);
			month = searchdate.substring(5,7);
		}else {
			searchdate = year + "-" + month;
		}
		
		map.put("searchType", searchType);
		map.put("year", year);
		map.put("month", month);
		map.put("searchdate", searchdate);
		map.put("userId", m.getUserId());
		int numPerPage = 10;

		List<Map<String,String>> list = service.consumerMyReview(cPage, numPerPage, map); 
		int totalCount = service.selectconsumerMyReview(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());

		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		model.addAttribute("searchType",searchType);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		return "consumer/reviewManage";
		
		
		/*
		 * Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		int numPerPage = 10;
		List<Member> list = service.selectConsumerList(cPage, numPerPage,map);

		int totalCount = service.selectConsumerTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchTitle",searchTitle);
		
		return "admin/consumerList";*/
		
	}
	

	@RequestMapping("/user/consumerReviewDelete")
	public String consumerReviewDelete(String reviewno, Model model) {
		
		String msg="";
		String loc="/user/reviewManage";
		
		int result = service.consumerReviewDelete(reviewno);
		
		if(result>0){
			msg="댓글 삭제가 정상적으로 완료되었습니다.";
		}
		else {
			msg="댓글 삭제가 실패하였습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	/* 구매자 - 문의고나리 페이지 */
	@RequestMapping("/user/inquiryManage")
	public String inquiryManage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="year", required=false, defaultValue="") String year,
			@RequestParam(value="month", required=false, defaultValue="") String month,
			HttpServletRequest req,Model model, HttpSession session) {
		
		Map<String,String> map = new HashMap<String,String>();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		
		String searchdate = "";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
		if(year.equals("") || month.equals("")) {
			searchdate =sd.format(new Date());
			year = searchdate.substring(0,4);
			month = searchdate.substring(5,7);
		}else {
			searchdate = year + "-" + month;
		}
		
		map.put("searchType", searchType);
		map.put("year", year);
		map.put("month", month);
		map.put("searchdate", searchdate);
		map.put("userId", m.getUserId());
		int numPerPage = 10;

		List<Map<String,String>> list = service.consumerMyInquiry(cPage, numPerPage, map); 
		int totalCount = service.selectconsumerMyInquiry(map);
		System.out.println("asdfasdf" + list);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());

		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		model.addAttribute("searchType",searchType);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		
		return "consumer/inquiryManage";
	}
	
	@RequestMapping("/user/consumerInquiryDelete")
	public String consumerInquiryDelete(String questionno, Model model) {
		
		String msg="";
		String loc="/user/inquiryManage";
		int result = service.consumerInquiryDelete(questionno);
		
		if(result>0){
			msg="문의 삭제가 정상적으로 완료되었습니다.";
		}
		else {
			msg="문의 삭제가 실패하였습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	/* 비밀번호 찾기 페이지 */
	@RequestMapping("/user/forgetPassword")
	public String forgetPassword() {
		return "consumer/forgetPassword";
	}
	
	/* 관리자 - 공연 컨펌 페이지 */
	@RequestMapping("/user/adminPlayConfirm")
	public ModelAndView adminPlayConfirm() {
		
		ModelAndView mv = new ModelAndView();
		List<PerformInfo> piList = service.selectDisallowancePerform();
		
		mv.addObject("piList",piList);
		mv.setViewName("admin/playConfirm");
		
		return mv;
	}
	
	/* 관리자 - 공연 관리 페이지 */
	@RequestMapping("/user/adminPlayManage")
	public ModelAndView adminPlayManage() {
		
		ModelAndView mv = new ModelAndView();
	
		List<PerformInfo> piList = service.selectAllowablePerform();
		
		mv.addObject("piList",piList);
		mv.setViewName("admin/playManage");
		
		return mv;
	}
	
	/* 구매자 - 업데이트 페이지 */
	@RequestMapping("/user/userUpdate")
	public String userUpdate() {
		return "consumer/userUpdate";
	}
	
	/* 관리자 - 사용자 정보 수정 페이지 */
	@RequestMapping("user/adminUserUpdate")
	public String adminUserUpdate(String userId, Model model) {
		Member m = service.selectOne(userId);
		
		model.addAttribute("m",m);
		return "admin/userUpdate";
	}
	
	/* 관리자 - 사용자 정보 수정 끝 */
	@RequestMapping("user/adminUserUpdateEnd")
	public String adminUserUpdateEnd(String address2, String address3, Member m, Model model) {
		m.setAddress(address3+","+address2+","+m.getAddress());

		String msg="";
		String loc="";
		
		int result = service.updateConsumer(m);
		if(result>0){
			msg="회원정보가 변경되었습니다.";
			if(m.getSeparator().equals("C"))
				loc="/user/consumerList";
			else if(m.getSeparator().equals("S"))
				loc="/user/sellerList";
		}
		else {
			msg="회원정보 수정이 실패하였습니다.";
			if(m.getSeparator().equals("C"))
				loc="/user/consumerList";
			else if(m.getSeparator().equals("S"))
				loc="/user/sellerList";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	/* 판매자 - 판매자 정보 수정 */
	@RequestMapping("/user/sellerUpdate")
	public String sellerUpdate() {
		return "seller/sellerUpdate";
	}
	
	/* 관리자 - 구매자등급관리 */ 
	@RequestMapping("/user/consumerRatingSetting")
	public String consumeRatingSetting(Model model) {
		List<Map<String,String>> list = service.selectConsumerRating(); 
		model.addAttribute("list",list);
		return "admin/ratingSetting";
	}
	
	/* 관리자 - 구매자등급관리 끝*/ 
	@RequestMapping("/user/consumerRatingSettingEnd")
	public String consumeRatingSettingEnd(String ratingCode, String ratingName, String discountrate, String ratingamount, Model model) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("ratingCode", ratingCode);
		map.put("ratingName", ratingName);
		map.put("discountrate", discountrate);
		map.put("ratingamount", ratingamount);
		
		System.out.println("ratingCode : " + ratingCode);
		System.out.println("ratingName : " + ratingName);
		System.out.println("discountrate : " + discountrate);
		System.out.println("ratingamount : " + ratingamount);
		
		int result = service.updateConsumerRating(map);	
		String msg="";
		String 	loc="/user/consumerRatingSetting";

		if(result>0){
			msg="등급 수정 완료.";
		}
		else {
			msg="등급 수정 실패.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	
	/* 관리자 - 구매자 목록 */ 
	@RequestMapping("/user/consumerList")
	public String consumerList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchTitle", required=false, defaultValue="") String searchTitle,
			HttpServletRequest req,Model model) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		int numPerPage = 10;
		List<Member> list = service.selectConsumerList(cPage, numPerPage,map);

		int totalCount = service.selectConsumerTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchTitle",searchTitle);
		
		return "admin/consumerList";
	}
	
	/* 관리자 - 판매자 목록 */ 
	@RequestMapping("/user/sellerList")
	public String sellerList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchTitle", required=false, defaultValue="") String searchTitle,
			HttpServletRequest req,Model model) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		int numPerPage = 10;
		List<Member> list = service.selectSellerList(cPage, numPerPage,map);

		int totalCount = service.selectSellerTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		
		return "admin/sellerList";
	}
	
	/* 판매자 - 판매 통계 페이지 */
	@RequestMapping("/user/sellerStatus")
	public String sellerStatus(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="performNo", required=false, defaultValue="") String performNo,
			@RequestParam(value="year", required=false, defaultValue="") String year,
			@RequestParam(value="month", required=false, defaultValue="") String month,HttpSession session, Model model, HttpServletRequest req) {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		String searchdate = "";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
		if(year.equals("") || month.equals("")) {
			searchdate =sd.format(new Date());
			year = searchdate.substring(0,4);
			month = searchdate.substring(5,7);
		}else {
			searchdate = year + "-" + month;
		}
		int numPerPage = 10;
		Map<String,String> map = new HashMap<String, String>();
		map.put("performNo", performNo);
		map.put("userId", userId);
		map.put("searchdate", searchdate);
		List<Map<String,String>> totalAcountList = service.selectSellerStatusUserId(cPage, numPerPage, map); // 총매출 리스트
		List<Map<String,String>> genderStatusList = service.selectSellerGenderStatus(map); // 성별 차트 리스트
		List<Map<String,String>> ageStatusList = service.selectSellerAgeStatus(map); // 연령별 차트 리스트
		List<Map<String,String>> monthStatusList = service.selectSellerMonthStatus(map); // 월별 차트 리스트

		int totalCount = service.selectSellerStatusUserIdCount(map);
		System.out.println("totalCount" + totalCount);

		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		System.out.println(totalAcountList);
		System.out.println(genderStatusList);
		System.out.println(ageStatusList);
		System.out.println(monthStatusList);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("performNo",performNo);
		model.addAttribute("totalAcountList",totalAcountList);
		model.addAttribute("genderStatusList",genderStatusList);
		model.addAttribute("ageStatusList",ageStatusList);
		model.addAttribute("monthStatusList",monthStatusList);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		return "seller/sellerStatus";
		
		/*int numPerPage = 10;

		List<Map<String,String>> list = service.selectMyPlayList(cPage, numPerPage,map);
		int totalCount = service.selectSellerPlayTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());

		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);

		return "seller/myPlayList";*/
	}
	
	/* 판매자 - 판매 상세 통계 */
	@RequestMapping("/user/sellerStatusInfo")
	public String sellerStatusInfo(@RequestParam(value="performNo", required=false, defaultValue="1") String performNo,
			@RequestParam(value="year", required=false, defaultValue="") String year,
			@RequestParam(value="month", required=false, defaultValue="") String month, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		String searchdate = "";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
		if(year.equals("") || month.equals("")) {
			searchdate =sd.format(new Date());
			year = searchdate.substring(0,4);
			month = searchdate.substring(5,7);
		}else {
			searchdate = year + "-" + month;
		}
		System.out.println("searchdate : " + searchdate);

		
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("performNo", performNo);
		map.put("userId", userId);
		map.put("searchdate", searchdate);
		
		List<Map<String,String>> monthAcountList = service.selectSellermonthAcount(map); // 총매출 리스트
		List<Map<String,String>> genderStatusList = service.selectSellerGenderStatus(map); // 성별 차트 리스트
		List<Map<String,String>> ageStatusList = service.selectSellerAgeStatus(map); // 연령별 차트 리스트
		List<Map<String,String>> monthStatusList = service.selectSellerMonthStatus(map); // 월별 차트 리스트
		System.out.println(monthAcountList);
		System.out.println(genderStatusList);
		System.out.println(ageStatusList);
		System.out.println(monthStatusList);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("performNo",performNo);
		model.addAttribute("monthAcountList",monthAcountList);
		model.addAttribute("genderStatusList",genderStatusList);
		model.addAttribute("ageStatusList",ageStatusList);
		model.addAttribute("monthStatusList",monthStatusList);
		
		return "seller/sellerStatusInfo";
	}
	
	/* 사용자 - 사용자 탈퇴 체크 페이지 */
	@RequestMapping("/user/userDeleteChk")
	public String userDeleteChk() {
		return "consumer/userDeleteChk";
	}
	
	/* 판매자 - 리뷰관리 페이지 */
	@RequestMapping("/user/sellerReviewManage")
	public String sellerReviewManage() {
		return "seller/reviewManage";
	}
	
	/* 판매자 - 문의관리 페이지 */
	@RequestMapping("/user/sellerInquiryManage")
	public String sellerInquiryManage() {
		return "seller/inquiryManage";
	}
	
	/* 판매자 - 공연 리스트*/
	@RequestMapping("/user/sellerMyPlayList")
	public String sellerMyPlayList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchTitle", required=false, defaultValue="") String searchTitle,
			HttpServletRequest req,Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("memberLoggedIn");

		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		map.put("userId", m.getUserId());
		int numPerPage = 10;

		List<Map<String,String>> list = service.selectMyPlayList(cPage, numPerPage,map);
		int totalCount = service.selectSellerPlayTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());

		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);

		return "seller/myPlayList";
	}
	
	@RequestMapping("/user/adminInquiryManage")
	public String adminInquiryManage() {
		return "admin/inquiryManage";
	}
	
	@RequestMapping("/user/adminReportBoard")
	public String adminReportBoard() {
		return "admin/reportBoard";
	}
	
	/* 관리자 - 구매자 삭제 */
	@RequestMapping("/user/consumerDeleteOne")
	public String consumerDeleteOne(String userId, Model model) {
		String msg="";
		String loc="/user/consumerList";
		int result = service.deleteConsumer(userId);
		
		if(result>0){
			msg="회원 삭제가 정상적으로 완료되었습니다.";
		}
		else {
			msg="회원 삭제가 실패하였습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}

	/* 사용자 - 회원탈퇴 */
	@RequestMapping("/user/userDelete.do")
	public String userDelete(@RequestParam(value="password", required=false, defaultValue="") String password, Model model,HttpSession session) {
		String msg="";
		String loc="";
		String deleteChk="";
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		String snsLoginChk = (String)session.getAttribute("snsLoginChk"); 
		if(bcryptPasswordEncoder.matches(password, memberLoggedIn.getPassword())){ // 현재 비밀번호가 일치하면
			int result = service.deleteConsumer(memberLoggedIn.getUserId());
			if(result>0){
				msg="회원탈퇴가 정상적으로 처리되었습니다.";
				loc="/user/userlogout.do";
			}
			else {
				msg="회원탈퇴가 실패하였습니다";
				loc="/user/userDelete";
			}
			deleteChk="1";

		}else {
			if(snsLoginChk.equals("1")) { // sns 로그인이면 
				int result = service.deleteConsumer(memberLoggedIn.getUserId());
				if(result>0){
					msg="회원탈퇴가 정상적으로 처리되었습니다.";
					loc="/user/userlogout.do";
				}
				else {
					msg="회원탈퇴가 실패하였습니다";
					loc="/user/userDelete";
				}
				deleteChk="1";
			}else {
				msg="비밀번호가 일치하지 않습니다.";
				loc="/user/userDeleteChk";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		model.addAttribute("deleteChk",deleteChk);
		return "common/msg";
	}
	
	/* 사용자  - 회원정보 변경 */
	@RequestMapping("/user/userUpdateEnd")
	public String userUpdateEnd(String address2, String address3,String oripassword, Member m, Model model,HttpSession session) {
		m.setAddress(address3+","+address2+","+m.getAddress());

		String msg="";
		String loc="";
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		String snsLoginChk= (String)session.getAttribute("snsLoginChk");
		String enPw = bcryptPasswordEncoder.encode(m.getPassword());
		m.setPassword(enPw);
		if(bcryptPasswordEncoder.matches(oripassword, memberLoggedIn.getPassword())){ // 현재 비밀번호가 일치하면
			int result = service.updateConsumer(m);
			if(result>0){
				msg="회원정보가 변경되었습니다. 다시 로그인 해주세요";
				loc="/user/userlogout.do";
			}
			else {
				msg="회원정보 수정이 실패하였습니다.";
				loc="/user/userUpdate";
			}
		}else {
			if(snsLoginChk.equals("1")) {
				int result = service.updateConsumer(m);
				if(result>0){
					msg="회원정보가 변경되었습니다. 다시 로그인 해주세요";
					loc="/user/userlogout.do";
				}
				else {
					msg="회원정보 수정이 실패하였습니다.";
					loc="/user/userUpdate";
				}
			}else {
				msg="비밀번호가 일치하지 않습니다.";
				loc="/user/userUpdate";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	/* 로그인 페이지 */
	@RequestMapping("/user/login")
	public String login() {
		return "consumer/login";
	}
	
	/* 로그아웃 */
	@RequestMapping("/user/userlogout.do")
	public String memberLogout(SessionStatus ss)
	{
		if(logger.isDebugEnabled()) {
			logger.debug("로그인아웃  : "+ss);
		}
		//SessionStatus ss에 완료가 됬으면 세션값이 끊어지는데 완료 안됬다고 조건을 주고
		//조건문 안에 setCompelete를 하면 세션이 끊어짐!!
		if(!ss.isComplete())
		{
			ss.setComplete();
		}
		
		return "redirect:/";
	}
	
	/* 구매자 회원가입 페이지 */
	@RequestMapping("/user/consumerEnroll")
	public String consumerEnroll(@RequestParam(value="userId", required=false, defaultValue="") String userId, 
			@RequestParam(value="userName", required=false, defaultValue="") String userName,
			@RequestParam(value="snsLogin", required=false, defaultValue="0") String snsLogin, Model model) {
		if(snsLogin.equals("1")) {
			model.addAttribute("userName",userName);
			model.addAttribute("userId",userId);
			model.addAttribute("snsLogin",snsLogin);
		}
		return "consumer/consumerEnroll";
	}
	
	/* 판매자 회원가입 페이지 */
	@RequestMapping("/user/sellerEnroll")
	public String sellerEnroll() {
		return "seller/sellerEnroll";
	}
	
	/* 구매자 회원가입 */
	@RequestMapping("/user/sellerEnrollEnd")
	public String sellerEnrollEnd(String address2, String address3, Member member, Model model)
	{		
		member.setAddress(address3+","+address2+","+member.getAddress());
		//암호화 처리
		String enPw = bcryptPasswordEncoder.encode(member.getPassword());
		
		member.setPassword(enPw);
		
		int result=service.insertSeller(member);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="회원가입을 성공하였습니다. 로그인을 해주세요.";
		}
		else
			msg="회원가입을 실패하였습니다.";
		loc="/";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	/* 구매자 회원가입 끝 */
	@RequestMapping("/user/consumerEnrollEnd")
	public String memberEnrollEnd(String address2, String address3, Member member, Model model)
	{		
		member.setAddress(address3+","+address2+","+member.getAddress());
		//암호화 처리
		String enPw = bcryptPasswordEncoder.encode(member.getPassword());
///*		String tt = bcryptPasswordEncoder.encode("123");
//		System.out.println("############################:tt"+tt);
		member.setPassword(enPw);
		
		int result=service.insertConsumer(member);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="회원가입을 성공하였습니다. 로그인을 해주세요.";
		}
		else
			msg="회원가입을 실패하였습니다.";
		loc="/";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	/* 아이디 중복체크 */
	@RequestMapping("/user/checkDuplicate.do")
	@ResponseBody
	public String duplicate(String userId, Model model) throws Exception
	{
		Map<String,Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		boolean flag=service.selectOne(userId)!=null?true:false; 
		
		map.put("flag", flag);
		
		jsonStr = mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	/* 로그인 로직 */
	@RequestMapping(value="/user/memberLogin.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(@RequestParam(value="saveId", required=false, defaultValue="0") String saveId,@RequestParam(value="snsLoginChk", required=false, defaultValue="0") String snsLoginChk, String userId, String password, HttpServletResponse response) throws Exception
	{		
		Member m = service.selectOne(userId);
		
		ModelAndView mv=new ModelAndView();
		//객체를 String, model로 나뉜걸 같이 쓰는게 ModelAndView 이다.
		String msg="";
		String loc="";
		String userChk = "";
		if(m==null)
		{
			msg="존재하지 않는 아이디입니다.";
			loc="/user/login";
			System.out.println(bcryptPasswordEncoder.encode("!a123123"));
		}
		else
		{
			
			if(bcryptPasswordEncoder.matches(password, m.getPassword())){
				//위에 조건문은 Encoder가 매칭 메소드에서 내가 적은 비밀번호와 디비에있는 비밀번호를 써주면
				//맞는지 비교해줌.
				msg="로그인 성공";
				mv.addObject("memberLoggedIn",m);
				mv.addObject("snsLoginChk",snsLoginChk);
				userChk = m.getSeparator();
				if(saveId.equals("1")) {
					Cookie setCookie = new Cookie("saveId", saveId); // 쿠키 생성
					Cookie id = new Cookie("id", userId); // 쿠키 생성
					setCookie.setMaxAge(60*60*24*30);
					response.addCookie(setCookie);
					id.setMaxAge(60*60*24*30);
					response.addCookie(id);
				}else {
					Cookie setCookie = new Cookie("saveId", null); // 쿠키 생성
					setCookie.setMaxAge(0); // 기간을 하루로 지정
					response.addCookie(setCookie);
					Cookie id = new Cookie("id", null); // 쿠키 생성
					id.setMaxAge(0); // 기간을 하루로 지정
					response.addCookie(id);
				}
			}
			else
			{
				if(snsLoginChk.equals("1")) {
					msg="로그인 성공";
					mv.addObject("memberLoggedIn",m);
					mv.addObject("snsLoginChk",snsLoginChk);
					userChk = m.getSeparator();
					if(saveId.equals("1")) {
						Cookie setCookie = new Cookie("saveId", saveId); // 쿠키 생성
						Cookie id = new Cookie("id", userId); // 쿠키 생성
						setCookie.setMaxAge(60*60*24*30);
						response.addCookie(setCookie);
						id.setMaxAge(60*60*24*30);
						response.addCookie(id);
					}else {
						Cookie setCookie = new Cookie("saveId", null); // 쿠키 생성
						setCookie.setMaxAge(0); // 기간을 하루로 지정
						response.addCookie(setCookie);
						Cookie id = new Cookie("id", null); // 쿠키 생성
						id.setMaxAge(0); // 기간을 하루로 지정
						response.addCookie(id);
					}
				}else {
					msg="비밀번호가 일치하지 않습니다.";
					loc="/user/login";
				}
			}
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.addObject("userChk",userChk);
		mv.setViewName("common/msg");
		return mv;
		
		/*if("${userChk}" == "C"){
		self.close();
		opener.location.href="${path}/user/consumerMyPage";
	}else if("${userChk}" == "S"){
		self.close();
		opener.location.href="${path}/user/sellerStatus";
	}else if("${userChk}" == "A"){
		self.close();
		opener.location.href="${path}/user/consumerList";
	}*/
	}
	
	
	
	
	
	
	
	
	/* 아이디 찾기 */
	   
    @RequestMapping(value="/user/findId", method= {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView findId(String userName, String email, HttpServletResponse response,HttpServletRequest request) throws Exception
    {
       ModelAndView mv=new ModelAndView();
       //객체를 String, model로 나뉜걸 같이 쓰는게 ModelAndView 이다.

       Map<String,String> map = new HashMap<String,String>();
       map.put("userName", userName);
       map.put("email", email);
       System.out.println(map.get("email"));
       System.out.println(map.get("userName"));
       
       Member m = service.selectId(map);
       
       String msg="";
       String loc="";
       String userChk = "";
       
       if(m==null || m.equals(""))
       {
          
          msg =" 일치하는 정보가 없습니다"; 
          loc = "/user/forgetPassword";

       }
       else
       {
          
          msg="회원님의 아이디는 "+m.getUserId()+"입니다";
          loc = "/user/forgetPassword";
          
       }
       
       mv.addObject("msg",msg);
       mv.addObject("loc",loc);
       mv.addObject("userChk",userChk);
       mv.setViewName("common/msg");
       return mv;
    }
 
 
 /*비밀번호 찾기 - 진석이형*/
 
 @RequestMapping(value="/user/findPassword", method= {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView findPassword(String userId,String userName, String email, HttpServletResponse response,HttpServletRequest request) throws Exception
    {
       ModelAndView mv=new ModelAndView();
       //객체를 String, model로 나뉜걸 같이 쓰는게 ModelAndView 이다.

       Map<String,String> map = new HashMap<String,String>();
       map.put("userId", userId);
       map.put("userName", userName);
       map.put("email", email);
       
       Member m = service.selectId(map);
       
       String msg="";
       String loc="";
       String userChk = "";
       int temp = (int)(Math.random()*1000000); 
       String temp2 = String.valueOf(temp);
       System.out.println(temp2);
       
       // 비밀 번호 가져옴 ->  바꿈  -> 바꾼걸 인코딩해서 업데이트 
       
       if(m==null || m.equals(""))
       {
         msg =" 일치하는 정보가 없습니다"; 
          loc = "/user/forgetPassword";

       }
       else
       {
          String setfrom = "TicketSky7@gmail.com";  //이메일을 보낼 주소     
             
           try 
           {
             
             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
             
             //난수로 비밀번호를 변경 
             m.setPassword(temp2);
             
             System.out.println("암호화 전 비밀번호 : "+temp2);
            
             messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
             messageHelper.setTo(m.getEmail());     // 받는사람 이메일
             messageHelper.setSubject("TicketSky에서 요청하신 비밀번호입니다. ."); // 메일제목은 생략이 가능하다
             messageHelper.setText("변경된 비밀번호는 [ "+temp2+" ] 입니다");  // 메일 내용
            
             mailSender.send(message);
             
             //변경한 비밀번호를 문자로 변경
             
             String enPw = bcryptPasswordEncoder.encode(temp2);
             
             m.setPassword(enPw);
             
             int result = service.findPassword(m);
             System.out.println("result : "+result);
             
             if(result>0)
             {
                msg = "입력하신 메일 주소로 변경된 비밀번호를 발송하였습니다";
                loc = "/user/forgetPassword";
             }
             
             else
             {
                msg = "일치하는 회원정보가 없습니다.";
                loc = "/user/forgetPassword";
             }
           }
           catch(Exception e)
           {
              e.printStackTrace();
           }
       }
       
       mv.addObject("msg",msg);
       mv.addObject("loc",loc);
       mv.addObject("userChk",userChk);
       mv.setViewName("common/msg");
       return mv;
    }
	
}
