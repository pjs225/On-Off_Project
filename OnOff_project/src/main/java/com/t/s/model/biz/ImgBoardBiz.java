package com.t.s.model.biz;

import java.util.List;

import com.t.s.model.dto.ImgBoardDto;


public interface ImgBoardBiz {

	public List<ImgBoardDto> selectImgBoardList(int groupno, int pagenum);
	public int selectImgBoardListCnt(int groupno);
	public ImgBoardDto selectImgBoardDetail(int imgboardno);
	public int insertImgBoard(ImgBoardDto imgboarddto);
	public int updateImgBoard(ImgBoardDto imgboarddto);
	public int deleteImgBoard(int imgboardno);
}
