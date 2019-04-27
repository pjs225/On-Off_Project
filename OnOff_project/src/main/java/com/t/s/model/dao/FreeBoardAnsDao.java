package com.t.s.model.dao;

import java.util.List;

import com.t.s.model.dto.FreeBoardAnsDto;

public interface FreeBoardAnsDao {

	String NAMESPACE = "onoff.";

	// 아래에는 기능만
	// public List<CustomerDto> selectList(); 이런식으로만
	public int FreeBoardAnsInsert(FreeBoardAnsDto freeboardansdto);
	public List<FreeBoardAnsDto> FreeBoardAnsList(int boardno);
	public int FreeBoardAnsDelete(int boardansno);
	
	public int deleteUserAns(String userid);

}
