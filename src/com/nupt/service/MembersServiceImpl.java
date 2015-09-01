package com.nupt.service;

import java.util.List;

import com.nupt.dao.MembersDao;
import com.nupt.dao.MembersDaoImpl;
import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;

public class MembersServiceImpl implements MembersService {
	private MembersDao dao = new MembersDaoImpl();
	
	/**
	 * 获取所有成员信息
	 */
	@Override
	public List<MembersEntity> getMembers() {
		return dao.getMembers();
	}

	/**
	 * 根据成员id获取成员信息
	 */
	@Override
	public MembersEntity getMemberById(String id) {
		MembersEntity entity = dao.getMemberById(id);
		//再去获取该成员参与过的所有项目
		List<ProjectEntity> list = dao.getProjectsOfMember(id);
		entity.setList(list);
		return entity;
	}

	/**
	 * 创建/修改一个成员
	 */
	@Override
	public boolean addMember(MembersEntity memberEntity,String in_project) {
		return dao.addMember(memberEntity,in_project);
	}

	/**
	 * 删除一个成员
	 * @param string
	 * @return
	 */
	@Override
	public boolean deleteMember(String id) {
		return dao.deleteMember(id);
	}
	
	

}
