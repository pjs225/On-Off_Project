package com.t.s.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.MoimUserDao;
import com.t.s.model.dto.MoimUserDto;

@Service
public class MoimUserBizImpl implements MoimUserBiz {
	
	@Autowired
	private MoimUserDao dao;

	@Override
	public int survey(MoimUserDto dto) {
		return dao.survey(dto);
	}

	@Override
	public double avgQ1(MoimUserDto dto) {
		return dao.avgQ1(dto);
	}

	@Override
	public double avgQ2(MoimUserDto dto) {
		return dao.avgQ2(dto);
	}

	@Override
	public double avgQ3(MoimUserDto dto) {
		return dao.avgQ3(dto);
	}

	@Override
	public double avgQ4(MoimUserDto dto) {
		return dao.avgQ4(dto);
	}

	@Override
	public double avgQ5(MoimUserDto dto) {
		return dao.avgQ5(dto);
	}

	@Override
	public double avgAll(double avgQ1, double avgQ2, double avgQ3, double avgQ4, double avgQ5) {
		double sum = avgQ1+avgQ2+avgQ3+avgQ4+avgQ5;
		double res = Double.parseDouble(String.format("%.2f",sum/5));
		return res;
	}

	
	@Override
	public int moimjoin(MoimUserDto dto) {
		// TODO Auto-generated method stub
		return dao.moimjoin(dto);
	}

	@Override
	public int moimout(MoimUserDto dto) {
		// TODO Auto-generated method stub
		return dao.moimout(dto);
	}

	@Override
	public MoimUserDto moimres(MoimUserDto dto) {
		// TODO Auto-generated method stub
		return dao.moimres(dto);
	}

	@Override
	public int findMoimNo(MoimUserDto moimuserdto) {
		// TODO Auto-generated method stub
		return dao.findMoimNo(moimuserdto);
	}
}
