package com.t.s.model.biz;

import com.t.s.model.dto.MoimUserDto;

public interface MoimUserBiz {

	public int survey(MoimUserDto dto);
	public double avgQ1(MoimUserDto dto);
	public double avgQ2(MoimUserDto dto);
	public double avgQ3(MoimUserDto dto);
	public double avgQ4(MoimUserDto dto);
	public double avgQ5(MoimUserDto dto);
	// 모임에 대한 평균 소수점 2째짜리까지
	public double avgAll(double avgQ1,double avgQ2,double avgQ3,double avgQ4,double avgQ5);
	
	//모임가입
	public int moimjoin(MoimUserDto dto);
	
	//모임탈퇴
	public int moimout(MoimUserDto dto);
	
	//참가확인
	public MoimUserDto moimres(MoimUserDto dto);
	
	//작성자 moimno찾기
	public int findMoimNo(MoimUserDto moimuserdto);
	
	
}
