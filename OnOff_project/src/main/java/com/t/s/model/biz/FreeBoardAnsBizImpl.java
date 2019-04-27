package com.t.s.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.FreeBoardAnsDao;
import com.t.s.model.dto.FreeBoardAnsDto;

@Service
public class FreeBoardAnsBizImpl implements FreeBoardAnsBiz {
	
	@Autowired
	private FreeBoardAnsDao dao;

	@Override
	public int FreeBoardAnsInsert(FreeBoardAnsDto freeboardansdto) {
		// TODO Auto-generated method stub
		return dao.FreeBoardAnsInsert(freeboardansdto);
	}

	@Override
	public List<FreeBoardAnsDto> FreeBoardAnsList(int boardno) {
		// TODO Auto-generated method stub
		return dao.FreeBoardAnsList(boardno);
	}

	@Override
	public int FreeBoardAnsDelete(int boardansno) {
		// TODO Auto-generated method stub
		return dao.FreeBoardAnsDelete(boardansno);
	}

	@Override
	public int deleteUserAns(String userid) {
		// TODO Auto-generated method stub
		return dao.deleteUserAns(userid);
	}

}
