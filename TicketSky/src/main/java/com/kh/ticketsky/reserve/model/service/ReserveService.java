package com.kh.ticketsky.reserve.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ticketsky.info.model.vo.PerformDate;
import com.kh.ticketsky.info.model.vo.PerformInfo;
import com.kh.ticketsky.info.model.vo.SeatData;
import com.kh.ticketsky.info.model.vo.SeatImg;
import com.kh.ticketsky.info.model.vo.SeatInfo;
import com.kh.ticketsky.reserve.model.vo.Purchase;


public interface ReserveService {

	List<PerformDate> getTime(Map<String, Object> dateMap);

	List<PerformDate> selectAllDate();

	List<SeatInfo> getSeatInfo(int performDateNo);

	PerformInfo selectPerformInfo(int performNo);

	List<PerformDate> getAvailableDates(int performNo);

	List<SeatImg> getSeatImg(int performNo);

	SeatInfo selectSeat(int seatInfoNo);

	List<SeatData> selectSeatData(int seatInfoNo);

	int getSeatCount(int seatInfoNo);

	int insertPurchase(Purchase p);

	int updateSeatData(int seatDataNo);



	

	

}
