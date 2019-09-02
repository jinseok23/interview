package com.kh.ticketsky.payment.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.payment.model.dao.PaymentDao;
@Service
public class PaymentServiceImpl implements PaymentService 
{

	@Autowired
	private PaymentDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> performSelectOne(int performNo) 
	{
		return dao.performSelectOne(sqlSession,performNo);
	}

}