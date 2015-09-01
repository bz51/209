package com.nupt.service;

import java.util.List;

import com.nupt.entity.MembersEntity;

public interface MembersService {
	/**
	 * 获取所有成员信息
	 */
	List<MembersEntity> getMembers();

	/**
	 * 根据成员id获取成员信息
	 */
	MembersEntity getMemberById(String id);

	/**
	 * 创建/修改一个成员
	 * @param memberEntity
	 * @param in_project 
	 * @return
	 */
	boolean addMember(MembersEntity memberEntity, String in_project);

	/**
	 * 删除一个成员
	 * @param string
	 * @return
	 */
	boolean deleteMember(String string);

}
