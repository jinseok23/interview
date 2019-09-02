package com.kh.ticketsky.ranking.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

public interface RankingService 
{

	List<Map<String, String>> selectRankingList(int cPage, int numPerPage);

	int selectTotalCount();

	List<Map<String, String>> selectCategoryRankingList(int cPage, int numPerPage, Map<String, String> map);

}
