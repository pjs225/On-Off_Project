package com.t.s.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.model.dto.ImgBoardDto;

@Repository
public class ImgBoardDaoImpl implements ImgBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ImgBoardDto> selectImgBoardList(int groupno, int pagenum) {
		
		List<ImgBoardDto> list = new ArrayList<ImgBoardDto>();
		Map<String, Integer> map = new HashMap<>();
		map.put("groupno", groupno);
		map.put("pagenum", pagenum);
		
		list = sqlSession.selectList(NAMESPACE+"imgboardlist", map);
		
		return list;
	}

	@Override
	public ImgBoardDto selectImgBoardDetail(int imgboardno) {
		
		ImgBoardDto res = new ImgBoardDto();
		
		res = sqlSession.selectOne(NAMESPACE+"imgboarddetail", imgboardno);
		
		return res;
	}

	@Override
	public int insertImgBoard(ImgBoardDto imgboarddto) {
		
		int res = 0;
		
		res = sqlSession.insert(NAMESPACE+"imgBoardInsert",imgboarddto);
		
		return res;
	}

	@Override
	public int updateImgBoard(ImgBoardDto imgboarddto) {


		int res = 0;
		
		res = sqlSession.update(NAMESPACE+"imgBoardUpdate",imgboarddto);
		
		return res;
	}

	@Override
	public int deleteImgBoard(int imgboardno) {
		
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"imgBoardDelete",imgboardno);
		
		return res;
	}

	@Override
	public int selectImgBoardListCnt(int groupno) {
		int res = 0;
		
		res = sqlSession.selectOne(NAMESPACE+"imgboardlistCnt",groupno);
		
		return res;
	}

}
