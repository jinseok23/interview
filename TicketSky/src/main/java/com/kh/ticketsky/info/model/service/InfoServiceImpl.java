package com.kh.ticketsky.info.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.kh.ticketsky.info.controller.InfoFileDelete;
import com.kh.ticketsky.info.controller.InfoInsertController;
import com.kh.ticketsky.info.model.dao.InfoDao;
import com.kh.ticketsky.info.model.vo.Category;
import com.kh.ticketsky.info.model.vo.PerformContent;
import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	InfoDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public List<Category> selectCategory() {	
		
		return dao.selectCategory(session);
	}
	
	


	@Override
	public List<Category> selectSubCategory(String majorCategory) {
		return dao.selectSubCategory(session, majorCategory);
	}




	@Override
	public int selectCategoryNo(Map<String, String> category) {
		
		return dao.selectCategoryNo(session, category);
	}

	
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public int insertPerform(String saveDir,Map<String,String> category, PerformInfo pi, List<PerformContent> pcList,
		List<PerformDate> pdList, List<SeatImg> sigList, List<SeatInfo> siList,HttpSession httpSession){
	
			
		int result=0;
		int performNo=0;		
		int categoryNo=0;
		
		
		try {
//		공연정보 insert
		categoryNo= dao.selectCategoryNo(session, category);
		pi.setCategoryNo(categoryNo);
		
		result = dao.insertPerformInfo(pi,session);
		
//		공연번호
		performNo = pi.getPerformNo();
		
//		System.out.println(pi.getPerformName());
//		System.out.println(pi.getPlaceName());
//		System.out.println(pi.getPlaceAddress());
//		System.out.println(pi.getTicketOpenDate());
//		System.out.println(pi.getPerformDuration());
//		System.out.println(pi.getCategoryNo());
//		System.out.println(pi.getUserId());
//		System.out.println(pi.getCompanyName());
//		System.out.println(pi.getCompanyPhoneNum());
//		System.out.println(pi.getPerformTime());
//		System.out.println(pi.getPerformGrade());
//		System.out.println(pi.getOriPosterImg());
//		System.out.println(pi.getRePosterImg());
		
//		상세정보 insert
		for(int i=0; i<pcList.size(); i++)
		{
			PerformContent pc = new PerformContent();
			pc.setPerformNo(performNo);
			pc.setPerformContent(pcList.get(i).getPerformContent());
			pc.setOriContentImg(pcList.get(i).getOriContentImg());
			pc.setReContentImg(pcList.get(i).getReContentImg());
						
			result= dao.insertPerformContent(pc, session);
			
			if(result<0)
			{
				return result;
			}
			else
			{
				System.out.println("상세정보 insert 성공");
			}
		}
		
		
//		좌석이미지 insert
		for(int i=0; i<sigList.size(); i++)
		{
			SeatImg si = new SeatImg();
			si.setPerformNo(performNo);
			si.setOriSeatImg(sigList.get(i).getOriSeatImg());
			si.setReSeatImg(sigList.get(i).getReSeatImg());
			si.setSeatContent(sigList.get(i).getSeatContent());
			
			result = dao.insertSeatImg(si,session);
			if(result<0)
			{
				return result;
			}
			else
			{
				System.out.println("좌석 이미지 insert 성공");
			}
		}
		
//		공연일정 insert
		for(int i=0; i<pdList.size(); i++)
		{
			PerformDate pd = new PerformDate();
			pd.setPerformNo(performNo);
			pd.setPerformDate(pdList.get(i).getPerformDate());
			
			result= dao.insertPerformDate(pd,session);

			int performDateNo = pd.getPerformDateNo();
							
			if(result<0)
			{
				return result;
			}
			else
			{
				System.out.println(i+"번 공연 일정 등록 성공");
//				좌석정보 insert
				for(int j=0; j<siList.size(); j++)
				{
/*					System.out.println("좌석정보 리스트 사이즈"+siList.size());
					System.out.println("층 "+siList.get(j).getSeatFloor());
					System.out.println("등급"+siList.get(j).getSeatLevel());
					System.out.println("좌석명"+siList.get(j).getSeatName());
					System.out.println("좌석시작"+siList.get(j).getSeatStartNum());
					System.out.println("끝 "+siList.get(j).getSeatEndNum());
					System.out.println("가격 "+siList.get(j).getSeatPrice());
					System.out.println("비지정석 "+siList.get(j).getNotReserved());
					System.out.println("공연일정 번호"+performDateNo);
					System.out.println("총좌석수"+siList.get(j).getSeatCount());
					System.out.println("--------------------------");*/
					SeatInfo sif = new SeatInfo();
					sif.setSeatFloor(siList.get(j).getSeatFloor());
					sif.setSeatLevel(siList.get(j).getSeatLevel());
					sif.setSeatName(siList.get(j).getSeatName());
					sif.setSeatStartNum(siList.get(j).getSeatStartNum());
					sif.setSeatEndNum(siList.get(j).getSeatEndNum());
					sif.setSeatPrice(siList.get(j).getSeatPrice());
					sif.setNotReserved(siList.get(j).getNotReserved());
					sif.setPerformDateNo(performDateNo);
					sif.setSeatCount(siList.get(j).getSeatCount());					
					
					result= dao.insertSeatInfo(sif,session);
					
					int seatInfoNo = sif.getSeatInfoNo();
					int start = siList.get(j).getSeatStartNum();
					int end = siList.get(j).getSeatEndNum();
					
					if(result<0)
					{
						return result;
					}
					else {
						System.out.println(j+"번 좌석정보 입력 성공");
						for(int k=start; k<=end; k++)
						{
							SeatData sd = new SeatData();
							sd.setSeatInfoNo(seatInfoNo);
							sd.setSeatNum(k);
							
							result = dao.insertSeatData(sd, session);
							
							if(result<0)
							{
								return result;
							}
							else
							{
								System.out.println(k+"번 좌석데이터 입력 성공");
							}
							
						}
					}
				}
			}
		}
		
		
		}
		catch(Exception e)
		{			
			
			System.out.println(new InfoFileDelete().FileDelete(saveDir));
			new InfoInsertController().sessionRemove(httpSession);
			System.out.println(e.getMessage());
			throw new RuntimeException();
//			강제 rollback
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		}		
		
		
		return result;
	}




	@Override
	public int deletePerform(int performNo) {
		
		return dao.deletePerform(session, performNo);
	}




	@Override
	public int confirmChangeY(int performNo) {
		
		return dao.confirmChangeY(performNo,session);
	}




	@Override
	public int confirmChangeE(int performNo) {
		
		return dao.confirmChangeE(performNo,session);
	}


	

	
	
	
	

	
}
