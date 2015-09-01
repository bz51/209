package com.nupt.service;

import java.util.List;

import com.nupt.entity.ProjectEntity;

public interface ProjectService {

	/**
	 * 获取所有项目信息
	 */
	List<ProjectEntity> getProjects();

	/**
	 * 根据id获取项目信息
	 */
	ProjectEntity getProjectById(String id);

	/**
	 * 创建一个项目
	 */
	boolean addProject(ProjectEntity projectEntity);

	/**
	 * 删除一个项目
	 */
	boolean deleteProject(String id);

}
