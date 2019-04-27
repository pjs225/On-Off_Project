package com.t.s.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.t.s.domain.Criteria;
import com.t.s.model.dao.MoimDao;
import com.t.s.model.dto.MoimDto;

@Service
public class MoimBizImpl implements MoimBiz {
	
	@Autowired
	private MoimDao dao;

	@Override
	public int insertMoim(MoimDto moimdto) {
		System.out.println("비즈옴옴");
		return dao.insertMoim(moimdto);
	}

	@Override
	public MoimDto selectMoim(int num) {
		// TODO Auto-generated method stub
		return dao.selectMoim(num);
	}

	@Override
	public List<MoimDto> selectMoimList(int groupno) {
		return dao.selectMoimList(groupno);
	}

	@Override
	public List<MoimDto> listPage(Criteria cri) {

		return dao.listPage(cri);
	}

	@Override
	public int listCount(int groupno) {
		return dao.listCount(groupno);
	}
	
	@Override
	public int moimdelete(int moimno) {
		return dao.moimdelete(moimno);
	}

	@Override
	public int updateMoim(MoimDto moimdto) {
		return dao.updateMoim(moimdto);
	}
	
	@Override
	public List<MoimDto> selectmyMoimList(String userid) {
		return dao.selectmyMoimList(userid);
	}
	
}
