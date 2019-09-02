package com.kh.ticketsky.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface PaymentDao 
{

	List<Map<String, String>> performSelectOne(SqlSessionTemplate sqlSession, int performNo);

}
