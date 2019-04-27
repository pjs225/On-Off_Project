package com.t.s.model.dao;

import java.util.List;

import com.t.s.model.dto.ImgBoardDto;

public interface ImgBoardDao {
	
	String NAMESPACE = "onoff.";

	// 아래에는 기능만
	// public List<CustomerDto> selectList(); 이런식으로만
	
	public List<ImgBoardDto> selectImgBoardList(int groupno, int pagenum);
	public int selectImgBoardListCnt(int groupno);
	public ImgBoardDto selectImgBoardDetail(int imgboardno);
	public int insertImgBoard(ImgBoardDto imgboarddto);
	public int updateImgBoard(ImgBoardDto imgboarddto);
	public int deleteImgBoard(int imgboardno);

}
