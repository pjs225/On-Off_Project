package com.t.s.model.dao;

import java.util.List;

import com.t.s.model.dto.ImgBoardAnsDto;

public interface ImgBoardAnsDao {
	
	String NAMESPACE = "onoff.";

	// 아래에는 기능만
	// public List<CustomerDto> selectList(); 이런식으로만
	public int ImgBoardAnsInsert(ImgBoardAnsDto imgboardansdto);
	public int ImgBoardAnsDelete(int imgansno);
	public List<ImgBoardAnsDto> ImgBoardAnsList(int imgboardno);
	
	public int ImgBoardUserAnsDelete(String userid);

}
