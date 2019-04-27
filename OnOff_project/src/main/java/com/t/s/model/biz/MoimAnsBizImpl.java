package com.t.s.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.MoimAnsDao;

@Service
public class MoimAnsBizImpl implements MoimAnsBiz{
	
	@Autowired
	private MoimAnsDao dao;

}
