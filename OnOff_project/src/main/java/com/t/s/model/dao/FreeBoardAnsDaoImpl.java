package com.t.s.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.model.dto.FreeBoardAnsDto;

@Repository
public class FreeBoardAnsDaoImpl implements FreeBoardAnsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int FreeBoardAnsInsert(FreeBoardAnsDto freeboardansdto) {
		
		int res = 0;
		
		res  = sqlSession.insert(NAMESPACE+"freeBoardAnsInsert",freeboardansdto);
		
		return res;
	}

	@Override
	public List<FreeBoardAnsDto> FreeBoardAnsList(int boardno) {
		
		List<FreeBoardAnsDto> list = new ArrayList<>();
		
		list = sqlSession.selectList(NAMESPACE+"freeBoardAnsList",boardno);
		
		return list;
	}

	@Override
	public int FreeBoardAnsDelete(int boardansno) {

		int res = 0;
		
		res  = sqlSession.insert(NAMESPACE+"freeBoardAnsDelete",boardansno);
		
		return res;
	}

	@Override
	public int deleteUserAns(String userid) {
		
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"freeBoardUserAnsDelete",userid);
		
		return res;
	}

}
