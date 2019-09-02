package com.kh.ticketsky.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;
import com.kh.ticketsky.reserve.model.vo.Purchase;

@Repository
public class ReserveDaoImpl implements ReserveDao {

	@Override
	public List<PerformDate> getTime(SqlSessionTemplate session, Map<String, Object> dateMap) {
		
		return session.selectList("reserve.getTime", dateMap);
	}

	@Override
	public List<PerformDate> selectAllDate(SqlSessionTemplate session) {
		
		return session.selectList("reserve.selectAllDate");
	}

	@Override
	public List<SeatInfo> getSeatInfo(SqlSessionTemplate session, int performDateNo) {
		
		return session.selectList("reserve.getSeatInfo",performDateNo);
	}

	@Override
	public PerformInfo selectPerformInfo(SqlSessionTemplate session, int performNo) {
		
		return session.selectOne("reserve.selectPerformInfo",performNo);
	}

	@Override
	public List<PerformDate> getAvailableDates(SqlSessionTemplate session, int performNo) {
		
		return session.selectList("reserve.getAvailableDates",performNo);
	}

	@Override
	public List<SeatImg> getSeatImg(SqlSessionTemplate session, int performNo) {
		
		return session.selectList("reserve.getSeatImg",performNo);
	}

	@Override
	public SeatInfo selectSeat(SqlSessionTemplate session, int seatInfoNo) {
		
		return session.selectOne("reserve.selectSeat",seatInfoNo);
	}

	@Override
	public List<SeatData> selectSeatData(SqlSessionTemplate session, int seatInfoNo) {
		
		return session.selectList("reserve.selectSeatData",seatInfoNo);
	}

	

	@Override
	public int getSeatCount(SqlSessionTemplate session, int seatInfoNo) {
		
		return session.selectOne("reserve.getSeatCount",seatInfoNo);
	}

	@Override
	public int insertPurchase(SqlSessionTemplate session, Purchase p) {
		
		return session.insert("reserve.insertPurchase",p);
		
	}

	@Override
	public int updateSeatData(SqlSessionTemplate session, int seatDataNo) {
		
		return session.update("reserve.updateSeatData",seatDataNo);
	}
	
	
	
	
	
}
