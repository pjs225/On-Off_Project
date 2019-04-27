package com.t.s.model.dao;

import java.util.List;

import com.t.s.model.dto.GroupUserDto;

public interface GroupUserDao {
	
	String NAMESPACE = "onoff.";

	// 아래에는 기능만
	// public List<CustomerDto> selectList(); 이런식으로만
	public GroupUserDto selGroupnoGroupuser(GroupUserDto dto);
	
	public int groupInUser(GroupUserDto groupuserdto);
	public int groupOutUser(GroupUserDto groupuserdto);
	public List<GroupUserDto> selectAllGroupUser(int groupno);
}
