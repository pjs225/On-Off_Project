package com.t.s.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.model.dto.MoimUserDto;

@Repository
public class MoimUserDaoImpl implements MoimUserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int survey(MoimUserDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"survey",dto);
		}catch (Exception e) {
			System.out.println("survey insert error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public double avgQ1(MoimUserDto dto) {
		double avg = 0;
		try {
			avg = sqlSession.selectOne(NAMESPACE+"avgQ1",dto);
		}catch (Exception e) { 
			e.printStackTrace();
		}
		return avg;
	}

	@Override
	public double avgQ2(MoimUserDto dto) {
		double avg = 0;
		try {
			avg = sqlSession.selectOne(NAMESPACE+"avgQ2",dto);
		}catch (Exception e) { 
			e.printStackTrace();
		}
		return avg;
	}

	@Override
	public double avgQ3(MoimUserDto dto) {
		double avg = 0;
		try {
			avg = sqlSession.selectOne(NAMESPACE+"avgQ3",dto);
		}catch (Exception e) { 
			e.printStackTrace();
		}
		return avg;
	}

	@Override
	public double avgQ4(MoimUserDto dto) {
		double avg = 0;
		try {
			avg = sqlSession.selectOne(NAMESPACE+"avgQ4",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return avg;
	}

	@Override
	public double avgQ5(MoimUserDto dto) {
		double avg = 0;
		try {
			avg = sqlSession.selectOne(NAMESPACE+"avgQ5",dto);
		}catch (Exception e) { 
			e.printStackTrace();
		}
		return avg;
	}

	@Override
	public int moimjoin(MoimUserDto dto) {
		
		int res = sqlSession.insert(NAMESPACE+"moimjoin",dto);
		
		
		return res;
	}

	@Override
	public int moimout(MoimUserDto dto) {

		int res = sqlSession.delete(NAMESPACE+"moimout",dto);
		
		return res;
	}

	@Override
	public MoimUserDto moimres(MoimUserDto dto) {
		
		MoimUserDto res = sqlSession.selectOne(NAMESPACE+"moimres",dto);
		
		return res;
	}

	@Override
	public int findMoimNo(MoimUserDto moimuserdto) {
		
		int res = 0;
		
		res = sqlSession.selectOne(NAMESPACE+"findMoimNo",moimuserdto);
		
		return res;
	}
	
}
