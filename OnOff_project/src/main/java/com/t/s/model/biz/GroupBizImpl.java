package com.t.s.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.domain.SearchCriteria;
import com.t.s.model.dao.GroupDao;
import com.t.s.model.dto.GroupDto;

@Service
public class GroupBizImpl implements GroupBiz {
	
	@Autowired
	private GroupDao dao;

	@Override
	public GroupDto selectGroupDetail(int groupno) {
		return dao.selectGroupDetail(groupno);
	}

	@Override
	public int insertGroup(GroupDto groupdto) {
		return dao.insertGroup(groupdto);
	}

	@Override
	public int findGroupNo(String fineImg) {
		return dao.findGroupNo(fineImg);
	}
	
	@Override
	public List<GroupDto> groupSearch_search(SearchCriteria sc) {
		return dao.groupSearch_search(sc);
	}

	@Override
	public int groupSearch_searchCount(SearchCriteria sc) {
		return dao.groupSearch_searchCount(sc);
	}

	@Override
	public int groupSearch_listCount() {
		return dao.groupSearch_listCount();
	}

	@Override
	public List<GroupDto> selGroupinfoManager(String userId) {
		return dao.selGroupinfoManager(userId);
	}

	@Override
	public List<GroupDto> selGroupinfoUser(String userId) {
		return dao.selGroupinfoUser(userId);
	}
	
	@Override
	public int updateGroupinfo(GroupDto groupdto) {
		return dao.updateGroupinfo(groupdto);
	}

	@Override
	public int delGroupinfo(int groupno) {
		return dao.delGroupinfo(groupno);
	}

}
