package com.kh.ticketsky.reserve.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;
import com.kh.ticketsky.reserve.model.dao.ReserveDao;
import com.kh.ticketsky.reserve.model.vo.Purchase;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	SqlSessionTemplate session;

	@Autowired
	ReserveDao dao;

	@Override
	public List<PerformDate> getTime(Map<String, Object> dateMap) {
				
		return dao.getTime(session, dateMap);
	}

	@Override
	public List<PerformDate> selectAllDate() {
		
		return dao.selectAllDate(session);
	}

	@Override
	public List<SeatInfo> getSeatInfo(int performDateNo) {
		
		return dao.getSeatInfo(session, performDateNo);
	}

	@Override
	public PerformInfo selectPerformInfo(int performNo) {
		
		return dao.selectPerformInfo(session, performNo);
	}

	@Override
	public List<PerformDate> getAvailableDates(int performNo) {
		
		return dao.getAvailableDates(session,performNo);
	}

	@Override
	public List<SeatImg> getSeatImg(int performNo) {
		
		return dao.getSeatImg(session,performNo);
	}

	@Override
	public SeatInfo selectSeat(int seatInfoNo) {
		
		return dao.selectSeat(session,seatInfoNo);
	}

	@Override
	public List<SeatData> selectSeatData(int seatInfoNo) {
		
		return dao.selectSeatData(session, seatInfoNo);
	}

	@Override
	public int getSeatCount(int seatInfoNo) {
		
		return dao.getSeatCount(session, seatInfoNo);
	}

	@Override
	public int insertPurchase(Purchase p) {
		
		return dao.insertPurchase(session, p);
	}

	@Override
	public int updateSeatData(int seatDataNo) {
		
		return dao.updateSeatData(session,seatDataNo);
	}

	
	
	
	

	
}
