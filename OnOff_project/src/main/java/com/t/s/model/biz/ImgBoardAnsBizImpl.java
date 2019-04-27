package com.t.s.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.ImgBoardAnsDao;
import com.t.s.model.dto.ImgBoardAnsDto;

@Service
public class ImgBoardAnsBizImpl implements ImgBoardAnsBiz {
	
	@Autowired
	private ImgBoardAnsDao dao;

	@Override
	public int ImgBoardAnsInsert(ImgBoardAnsDto imgboardansdto) {
		// TODO Auto-generated method stub
		return dao.ImgBoardAnsInsert(imgboardansdto);
	}

	@Override
	public int ImgBoardAnsDelete(int imgansno) {
		// TODO Auto-generated method stub
		return dao.ImgBoardAnsDelete(imgansno);
	}

	@Override
	public List<ImgBoardAnsDto> ImgBoardAnsList(int imgboardno) {
		// TODO Auto-generated method stub
		return dao.ImgBoardAnsList(imgboardno);
	}

	@Override
	public int ImgBoardUserAnsDelete(String userid) {
		// TODO Auto-generated method stub
		return dao.ImgBoardUserAnsDelete(userid);
	}

}
