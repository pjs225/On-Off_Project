package com.t.s.model.biz;

import java.util.List;

import com.t.s.model.dto.ImgBoardAnsDto;

public interface ImgBoardAnsBiz {

	public int ImgBoardAnsInsert(ImgBoardAnsDto imgboardansdto);
	public int ImgBoardAnsDelete(int imgansno);
	public List<ImgBoardAnsDto> ImgBoardAnsList(int imgboardno);
	
	public int ImgBoardUserAnsDelete(String userid);
}
