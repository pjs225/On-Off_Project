package com.t.s.model.dao;

import java.util.List;

import com.t.s.domain.Criteria;
import com.t.s.model.dto.MoimDto;

public interface MoimDao {
	
	String NAMESPACE = "onoff.";

	// 아래에는 기능만
	// public List<CustomerDto> selectList(); 이런식으로만

	public int insertMoim(MoimDto moimdto);
	
	public MoimDto selectMoim(int num);
	
	public List<MoimDto> selectMoimList(int groupno);
	
	public List<MoimDto> listPage(Criteria cri);
	
	public int listCount(int groupno);

	public int moimdelete(int moimno);
	
	public int updateMoim(MoimDto moimdto);
	
	public List<MoimDto> selectmyMoimList(String userid);

}
