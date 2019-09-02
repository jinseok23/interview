package com.kh.ticketsky.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;
import com.kh.ticketsky.reserve.model.vo.Purchase;

public interface ReserveDao {

	List<PerformDate> getTime(SqlSessionTemplate session, Map<String, Object> dateMap);

	List<PerformDate> selectAllDate(SqlSessionTemplate session);

	List<SeatInfo> getSeatInfo(SqlSessionTemplate session, int performDateNo);

	PerformInfo selectPerformInfo(SqlSessionTemplate session, int performNo);

	List<PerformDate> getAvailableDates(SqlSessionTemplate session, int performNo);

	List<SeatImg> getSeatImg(SqlSessionTemplate session, int performNo);

	SeatInfo selectSeat(SqlSessionTemplate session, int seatInfoNo);

	List<SeatData> selectSeatData(SqlSessionTemplate session, int seatInfoNo);
	
	int getSeatCount(SqlSessionTemplate session, int seatInfoNo);

	int insertPurchase(SqlSessionTemplate session, Purchase p);

	int updateSeatData(SqlSessionTemplate session, int seatDataNo);

}
