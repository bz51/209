package com.nupt.dao;

import java.util.List;

import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;

public interface MembersDao {
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
	 * @param in_project 
	 */
	boolean addMember(MembersEntity memberEntity, String in_project);

	/**
	 * 删除一个成员
	 */
	boolean deleteMember(String id);

	/**
	 * 获取该成员参与过的项目
	 * @param id
	 * @return
	 */
	List<ProjectEntity> getProjectsOfMember(String id);

}
