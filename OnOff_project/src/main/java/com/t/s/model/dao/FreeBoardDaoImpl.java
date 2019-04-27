package com.t.s.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.model.dto.FreeBoardDto;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FreeBoardDto> selectFreeBoardList(int groupno, int pagenum) {
		
		List<FreeBoardDto> list = new ArrayList<FreeBoardDto>();
		Map<String, Integer> map = new HashMap<>();
		map.put("groupno", groupno);
		map.put("pagenum", pagenum);
		
		list = sqlSession.selectList(NAMESPACE+"freeboardlist",map);
		
		return list;
	}
	
	@Override
	public int selectFreeBoardListCnt(int groupno) {
		
		int res = 0;
		
		res = sqlSession.selectOne(NAMESPACE+"freeboardlistCnt",groupno);
		
		return res;
	}

	@Override
	public FreeBoardDto selectFreeBoardDetail(int boardno) {
		
		FreeBoardDto res = new FreeBoardDto();
		
		res = sqlSession.selectOne(NAMESPACE+"freeboarddetail", boardno);
		
		return res;
	}

	@Override
	public int insertFreeBoard(FreeBoardDto freeboarddto) {
		
		int res = 0;
		
		res = sqlSession.insert(NAMESPACE+"freeBoardInsert",freeboarddto);
		
		return res;
	}

	@Override
	public int updateFreeBoard(FreeBoardDto freeboarddto) {
		
		int res = 0;
		
		res = sqlSession.update(NAMESPACE+"freeBoardUpdate", freeboarddto);
		
		return res;
	}

	@Override
	public int deleteFreeBoard(int boardno) {
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"freeBoardDelete", boardno);
		
		return res;
	}

	@Override
	public int deleteUserFreeBoard(String userid) {
		
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"freeBoardUserDelete",userid);
		return 0;
	}

	

}
