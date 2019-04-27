package com.t.s.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.model.dto.ImgBoardAnsDto;

@Repository
public class ImgBoardAnsDaoImpl implements ImgBoardAnsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int ImgBoardAnsInsert(ImgBoardAnsDto imgboardansdto) {
		int res = 0;
		
		res = sqlSession.insert(NAMESPACE+"imgBoardAnsInsert",imgboardansdto);
		
		return res;
	}

	@Override
	public int ImgBoardAnsDelete(int imgansno) {
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"imgBoardAnsDelete",imgansno);
		
		return res;
	}

	@Override
	public List<ImgBoardAnsDto> ImgBoardAnsList(int imgboardno) {
		List<ImgBoardAnsDto> list = new ArrayList<>();
		
		list = sqlSession.selectList(NAMESPACE+"imgBoardAnsList",imgboardno);
		
		return list;
	}

	@Override
	public int ImgBoardUserAnsDelete(String userid) {
		
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"imgBoardUserAnsDelete",userid);
		
		return res;
	}

}
