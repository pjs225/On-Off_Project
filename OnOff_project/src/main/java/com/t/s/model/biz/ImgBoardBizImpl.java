package com.t.s.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.ImgBoardDao;
import com.t.s.model.dto.ImgBoardDto;

@Service
public class ImgBoardBizImpl implements ImgBoardBiz {
	
	@Autowired
	private ImgBoardDao dao;

	@Override
	public List<ImgBoardDto> selectImgBoardList(int groupno, int pagenum) {
		// TODO Auto-generated method stub
		return dao.selectImgBoardList(groupno,pagenum);
	}

	@Override
	public ImgBoardDto selectImgBoardDetail(int imgboardno) {
		// TODO Auto-generated method stub
		return dao.selectImgBoardDetail(imgboardno);
	}

	@Override
	public int insertImgBoard(ImgBoardDto imgboarddto) {
		// TODO Auto-generated method stub
		return dao.insertImgBoard(imgboarddto);
	}

	@Override
	public int updateImgBoard(ImgBoardDto imgboarddto) {
		// TODO Auto-generated method stub
		return dao.updateImgBoard(imgboarddto);
	}

	@Override
	public int deleteImgBoard(int imgboardno) {
		// TODO Auto-generated method stub
		return dao.deleteImgBoard(imgboardno);
	}

	@Override
	public int selectImgBoardListCnt(int groupno) {
		// TODO Auto-generated method stub
		return dao.selectImgBoardListCnt(groupno);
	}

}
