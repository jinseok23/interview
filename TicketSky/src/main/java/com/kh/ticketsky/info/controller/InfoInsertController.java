package com.kh.ticketsky.info.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ticketsky.info.model.service.InfoService;
import com.kh.ticketsky.info.model.vo.Category;
import com.kh.ticketsky.info.model.vo.PerformContent;
import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;
import com.kh.ticketsky.user.model.vo.Member;


@Controller
public class InfoInsertController {
	
	@Autowired
	private InfoService service;
	
	@RequestMapping("/info/insertInfo")
	public ModelAndView insertInfo()
	{				
		ModelAndView mv = new ModelAndView();
	/*	List<Category> category = service.selectCategory();
		List mCategory = new ArrayList();
		for(int i =0; i<category.size(); i++)
		{
			
			for(int j=i+1; j<category.size(); j++)
			{
				String major1 = category.get(i).getMajorCategory();
				String major2 = category.get(j).getMajorCategory();
				if(!major1.equals(major2))
				{
					mCategory.add(major1);
					System.out.println(major1);
				}
			}
		}
		
				
		mv.addObject("mCategory", mCategory);*/	
		
		mv.setViewName("info/insertInfo");
		return mv;		
	}
	
	
	@RequestMapping("/info/insertSubCategory")
	@ResponseBody
	public String insertSubCategory (String majorCategory) throws Exception
	{
				
		Map<String,Object> map= new HashMap<String, Object>();
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
			
		List<Category> list= service.selectSubCategory(majorCategory);
		
		List<Category> encodeList = new ArrayList();
		for(int i=0; i<list.size(); i++)
		{
			encodeList.add(new Category(list.get(i).getCategoryNo(), URLEncoder.encode(list.get(i).getMajorCategory(),"UTF-8"),URLEncoder.encode(list.get(i).getSubCategory(), "UTF-8")));
		}		
		
		map.put("list", encodeList);
		
		jsonStr=mapper.writeValueAsString(map);
		
		return jsonStr;
	}
	
	
	@RequestMapping("/info/insertDate")
	public ModelAndView insertDate(HttpSession session,PerformInfo performInfo, MultipartHttpServletRequest mt) throws Throwable
	{
			
		
		ModelAndView mv = new ModelAndView();		

		/*System.out.println("---서브카테고리 값---");
		System.out.println(performInfo.getSubCategory());
		System.out.println("----------------");*/
		
//		주소처리
		String placeAddress="";
		String address1= mt.getParameter("address1");
	    String address2= mt.getParameter("address2");
	    if(address2.equals(""))
	    {	    	
			placeAddress+=address1+" "+address2;
	    }
	    else
	    {
	    	placeAddress+=address1;
	    }
		
	    performInfo.setPlaceAddress(placeAddress);		
		
//	    등록페이지에서 등록되지 않는 정보 처리
	    
//	    찾아오는 길 데이터
	    if(performInfo.getPlaceRoute().equals(""))
	    {
	    		    	
	    }
	    	    
	    
//	    공연 시작일, 종료일 데이터 처리
		String startDate;
		String endDate;

		if(performInfo.getPerformDuration().length()>10)
		{
			String[] pDate = performInfo.getPerformDuration().split(" ~ ");
			
			startDate = pDate[0];
			endDate = pDate[1];
		}
		else
		{
			startDate = performInfo.getPerformDuration();
			endDate = performInfo.getPerformDuration();
		}		
	
		
//		공연 이미지 폴더 생성
		String saveDir=mt.getSession().getServletContext().getRealPath("/resources/upload/info/"+performInfo.getPerformName()+"/");		
		
		File dir=new File(saveDir);		
		
		if(dir.exists()==false)
			{
				dir.mkdirs();
			}	

		
//		포스터 이미지 처리
		MultipartFile poster = mt.getFile("poster");
		
		session.setAttribute("poster", poster);
		if(!poster.isEmpty())
		{
			
			String oriFilename = poster.getOriginalFilename();
			String ext=oriFilename.substring(oriFilename.lastIndexOf(".")+1);
			int rndNum=(int)(Math.random()*1000);
			String renamedFilename=System.currentTimeMillis()+"_"+rndNum+"_"+"poster."+ext;
			try
			{
				poster.transferTo(new File(saveDir+renamedFilename));
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			performInfo.setOriPosterImg(oriFilename);
			performInfo.setRePosterImg(renamedFilename);
		}
		else
		{
			performInfo.setOriPosterImg("");
			performInfo.setRePosterImg("");
		}
				
//		상세정보 내용 및 이미지 처리
		
		int count = Integer.parseInt(mt.getParameter("contentCount"));
		
		/*session.setAttribute("cCount", count);
		for(int i=0; i<count; i++)
		{
			session.setAttribute("contentImg_"+i, mt.getFile("contentImg_"+i));
			session.setAttribute("performContent_"+i, mt.getParameter("performContent_"+i));
		}*/
	
		List<PerformContent> pcList = new ArrayList<PerformContent>();
		for(int i=0; i<count; i++)
		{
			PerformContent pc = new PerformContent();
			MultipartFile contentImg = mt.getFile("contentImg_"+i);			
			
			String content = mt.getParameter("performContent_"+i);
			
			if(contentImg.isEmpty())
			{
				pc.setOriContentImg("");
				pc.setReContentImg("");
			}
			else			
			{
				String oriContentImg = contentImg.getOriginalFilename();
				String ext=oriContentImg.substring(oriContentImg.lastIndexOf(".")+1);
				int rndNum=(int)(Math.random()*1000);		
				String reContentImg = System.currentTimeMillis()+"_"+rndNum+"_"+"contentImg."+ext;
				
				
				pc.setOriContentImg(oriContentImg);
				pc.setReContentImg(reContentImg);
				try
				{
					contentImg.transferTo(new File(saveDir+reContentImg));
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			
			if(content == null)
			{
				pc.setPerformContent("");
			}
			else
			{
				pc.setPerformContent(content);
			}

			pcList.add(i, pc);
//			System.out.println("---------------------");
//			System.out.println("인덱스 : "+i);
//			System.out.println("이미지 : "+pcList.get(i).getOriContentImg());
//			System.out.println(pcList.get(i).getReContentImg());			
//			System.out.println("내용 : "+pcList.get(i).getPerformContent());
//			System.out.println("---------------------");
		}		
		

//		세션에 올려놓기
		session.setAttribute("pcList", pcList);
		session.setAttribute("performInfo", performInfo);
		
//		일정등록 페이지에 공연시작일 종료일 보내기
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);	
		mv.setViewName("info/insertDate");
		return mv;
	}
	
	@RequestMapping("/info/insertSeat")
	public ModelAndView insertSeat(HttpSession session,HttpServletRequest request, HttpServletResponse response)
	{
		
		ModelAndView mv = new ModelAndView();
		
//		세션 객체전달 테스트
/*		PerformInfo pi = (PerformInfo)session.getAttribute("performInfo");
			
		System.out.println(pi.getCompanyName());
		System.out.println(pi.getMajorCategory());
		System.out.println(pi.getSubCategory());*/
		
		List<PerformContent> pcList = (List)session.getAttribute("pcList");
		
//		for(int i=0; i<pcList.size(); i++)
//		{
//			System.out.println("pcList["+i+"] : ");
//			System.out.println(pcList.get(i).getPerformContent());
//			System.out.println(pcList.get(i).getOriContentImg());
//			System.out.println(pcList.get(i).getReContentImg());	
//			System.out.println("---------------------------------");
//		}
		
//		공연일정 저장 
//		PerformDate pd= new PerformDate();
		List<PerformDate> pdList = new ArrayList();
		
		String start = request.getParameter("startDate");
		String end = request.getParameter("endDate");
				
		String startDate =request.getParameter("performDate_start")+" "+request.getParameter("performTime_start");
				
		pdList.add(new PerformDate(startDate));
		
		if(!start.equals(end))
		{
			String endDate=request.getParameter("performDate_end")+" "+request.getParameter("performTime_end");
			
			pdList.add(new PerformDate(endDate));
		}
		
		int dCount = Integer.parseInt(request.getParameter("dateCount"));
		if(dCount>0)
		{
			for(int i=0; i<dCount; i++)
			{
				String performDate = request.getParameter("performDate_"+i)+" "+request.getParameter("performTime_"+i);
				pdList.add(new PerformDate(performDate));
			}	
		}
		
		
		
//		데이터확인
//		for(int i=0; i<pdList.size(); i++)
//		{
//			System.out.println("공연일정리스트["+i+"번 ]"+pdList.get(i).getPerformDate());
//			
//		}
		
//		세션에 보내기
		session.setAttribute("pdList", pdList);
		
		mv.setViewName("info/insertSeat");
		return mv;
	}
	
	@RequestMapping("/info/insertEnd")
	public ModelAndView insertEnd(MultipartHttpServletRequest mt, HttpSession session)
	{
		
		ModelAndView mv = new ModelAndView();
					
		PerformInfo pi = (PerformInfo) session.getAttribute("performInfo");
			
//		좌석 이미지 처리
		String saveDir=mt.getSession().getServletContext().getRealPath("/resources/upload/info/"+pi.getPerformName()+"/");		
		
		int siCount = Integer.parseInt(mt.getParameter("seatImgCount"));
		List<SeatImg> sigList = new ArrayList<SeatImg>();
		
		for(int i=0; i<siCount; i++)
		{
			SeatImg sig = new SeatImg();
			MultipartFile seatImg = mt.getFile("seatImg_"+i);			
			String seatContent = mt.getParameter("seatContent_"+i);
			
			
			if(seatImg.isEmpty())
			{
				sig.setOriSeatImg("");
				sig.setReSeatImg("");
			}
			else
			{
				String oriSeatImg = seatImg.getOriginalFilename();
				String ext=oriSeatImg.substring(oriSeatImg.lastIndexOf(".")+1);
				int rndNum=(int)(Math.random()*1000);		
				String reSeatImg = System.currentTimeMillis()+"_"+rndNum+"_"+"SeatImg."+ext;
				
				
				sig.setOriSeatImg(oriSeatImg);
				sig.setReSeatImg(reSeatImg);
				try
				{
					seatImg.transferTo(new File(saveDir+reSeatImg));
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			if(seatContent == null)
			{
				sig.setSeatContent("");
			}
			else
			{
				sig.setSeatContent(seatContent);
			}
//			참조 공연번호 추가
			sigList.add(sig);
		}
		
//		for(int i=0; i<siCount; i++)
//		{
//			System.out.println("------SeatImg 리스트-------");
//			System.out.println(sigList.get(i).getOriSeatImg());
//			System.out.println(sigList.get(i).getReSeatImg());
//			System.out.println(sigList.get(i).getSeatContent());
//			System.out.println("-----------------------");
//		}
		
//		좌석정보 처리
		
		int sCount = Integer.parseInt(mt.getParameter("seatInfoCount"));
		List<SeatInfo> siList = new ArrayList<SeatInfo>(); 
				
		for(int i=0; i<sCount; i++)
		{
			SeatInfo si = new SeatInfo();
			si.setSeatFloor(Integer.parseInt(mt.getParameter("seatFloor_"+i)));
			si.setSeatLevel(mt.getParameter("seatLevel_"+i));
			si.setSeatName(mt.getParameter("seatName_"+i));
			si.setSeatPrice(Integer.parseInt(mt.getParameter("seatPrice_"+i)));
			si.setNotReserved(mt.getParameter("notReserved_"+i));
			
			int startNum=Integer.parseInt(mt.getParameter("seatStartNum_"+i));
			int endNum=Integer.parseInt(mt.getParameter("seatEndNum_"+i));
			
			ArrayList<Integer> list = new ArrayList<Integer>();
			for(int j=startNum; j<=endNum; j++)
			{
				list.add(j);
			}
			
			int seatCount=list.size();
						
			si.setSeatStartNum(startNum);
			si.setSeatEndNum(endNum);
			si.setSeatCount(seatCount);
//			공연일정번호 추가
			
			siList.add(si);
		}
		
//		DB등록에 필요한 데이터 정리
		
		//session아이디 가져오기
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String id=m.getUserId();
		
//		String id="test"; 
		pi.setUserId(id);
		
	
		Map<String, String> category= new HashMap();
		String major = pi.getMajorCategory();
		String sub = pi.getSubCategory();
		category.put("major", major);
		category.put("sub", sub);		
		
		List<PerformContent> pcList = (List) session.getAttribute("pcList");
		
		List<PerformDate> pdList = (List) session.getAttribute("pdList");
			
//		DB등록 			
		int result;		
	
		result = service.insertPerform(saveDir,category,pi,pcList, pdList,sigList,siList,session);
		
				
		String msg="";
		if(result>0)
		{
//			성공
			msg="공연 등록에 성공했습니다.";
			
		}
		else
		{
//			실패
			msg="공연 등록에 실패했습니다.";
		}
		
//		mv.setViewName("seller/sellerStatus");
//		return mv;
		
		mv.addObject("msg",msg);
		mv.addObject("loc", "/user/sellerMyPlayList");
		mv.setViewName("common/msg");
		return mv;
		
		
	}
	
	@RequestMapping("info/deletePerform")
	public ModelAndView deletePerform(int performNo,HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = service.deletePerform(performNo);
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		
		String loc="";
		if(m.getSeparator().equals("A"))
		{
			loc = "/user/adminPlayManage";
		}
		else
		{
			loc = "/user/sellerMyPlayList";
		}
		
		String msg="";
		
		if(result>0)
		{
//			성공
			msg="공연을 삭제했습니다.";
			
		}
		else
		{
//			실패
			msg="공연 삭제에 실패했습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("info/confirmChangeY")
	public ModelAndView confirmChangeY(int performNo) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = service.confirmChangeY(performNo);
		
		String msg="";
		if(result>0)
		{
			msg="공연 승인이 완료되었습니다.";			
		}
		else
		{
			msg="승인이 실패했습니다.";
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/user/adminPlayConfirm");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("info/confirmChangeE")
	public ModelAndView confirmChangeE(int performNo) {

		ModelAndView mv = new ModelAndView();
		
		int result = service.confirmChangeE(performNo);
		
		String msg="";
		if(result>0)
		{
			msg="수정 요청이 완료되었습니다.";			
		}
		else
		{
			msg="요청을 처리하지 못했습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/user/adminPlayConfirm");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	public void sessionRemove(HttpSession session) {			
		session.removeAttribute("pcList");
		session.removeAttribute("performInfo");
		session.removeAttribute("pdList");	
	}

	

}





