package com.t.s.model.biz;

import java.util.List;

import com.t.s.model.dto.FreeBoardAnsDto;

public interface FreeBoardAnsBiz {

	public int FreeBoardAnsInsert(FreeBoardAnsDto freeboardansdto);
	public int FreeBoardAnsDelete(int boardansno);
	public List<FreeBoardAnsDto> FreeBoardAnsList(int boardno);
	
	public int deleteUserAns(String userid);
}
