package com.nupt.dao;

import java.util.List;

import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;

public interface ProjectDao {

	/**
	 * 获取所有项目信息
	 */
	List<ProjectEntity> getProjects();

	/**
	 * 根据id获取项目信息
	 */
	ProjectEntity getProjectById(long iD);

	/**
	 * 创建一个项目
	 */
	boolean addProject(ProjectEntity projectEntity);

	/**
	 * 删除一个项目
	 * @param id
	 * @return
	 */
	boolean deleteProject(String id);

	/**
	 * 获取该项目的所有参与者
	 * @param id 
	 */
	List<MembersEntity> getMembersOfProject(String id);

}
