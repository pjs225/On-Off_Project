package com.t.s.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.domain.Criteria;
import com.t.s.model.dto.MoimDto;

@Repository
public class MoimDaoImpl implements MoimDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMoim(MoimDto moimdto) {
		
		System.out.println("다오옴");
		int res = 0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertMoim",moimdto);
		} catch (Exception e) {
			System.out.println("insertmoim 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public MoimDto selectMoim(int num) {
		
		MoimDto res = new MoimDto();
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOneMoim",num);
		} catch (Exception e) {
			System.out.println("selectOneMoim 에러");
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public List<MoimDto> selectMoimList(int groupno) {

		List<MoimDto> list = new ArrayList<MoimDto>();
		
		list = sqlSession.selectList(NAMESPACE+"selectAllMoim",groupno);
		
		return list;
	}

	@Override
	public List<MoimDto> listPage(Criteria cri) {
		

		
		List<MoimDto> listPage = new ArrayList<MoimDto>();
		
		listPage = sqlSession.selectList(NAMESPACE+"selectPaging",cri);
		
		return listPage;
	}

	@Override
	public int listCount(int groupno) {
		

		
		int res = sqlSession.selectOne(NAMESPACE+"listCount", groupno);
		
		return res;
	}
	
	@Override
	public int moimdelete(int moimno) {

		int res = sqlSession.delete(NAMESPACE+"moimdelete",moimno);
		
		return res;
	}

	@Override
	public int updateMoim(MoimDto moimdto) {

		int res = sqlSession.update(NAMESPACE+"updateMoim",moimdto);
		
		return res;
	}
	
	@Override
	public List<MoimDto> selectmyMoimList(String userid) {
		System.out.println("왔냐" + userid);
		List<MoimDto> mylistPage = new ArrayList<MoimDto>();
		
		mylistPage = sqlSession.selectList(NAMESPACE+"selectmyMoimList",userid.replace("'", ""));
		
		System.out.println(mylistPage);
		return mylistPage;
	}
}
