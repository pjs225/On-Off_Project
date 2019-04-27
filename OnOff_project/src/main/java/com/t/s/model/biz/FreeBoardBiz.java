package com.t.s.model.biz;

import java.util.List;

import com.t.s.model.dto.FreeBoardDto;

public interface FreeBoardBiz {
	
	// 자유게시판 리스트 출력
	public List<FreeBoardDto> selectFreeBoardList(int groupno, int pagenum);
	public int selectFreeBoardListCnt(int groupno);
	
	// 자유게시판 글 디테일
	public FreeBoardDto selectFreeBoardDetail(int boardno);

	// 자유게시판 글 생성
	public int insertFreeBoard(FreeBoardDto freeboarddto);
	public int updateFreeBoard(FreeBoardDto freeboarddto);
	public int deleteFreeBoard(int boardno);
	
	public int deleteUserFreeBoard(String userid);
}
