package com.nupt.service;

import java.util.List;

import com.nupt.dao.ProjectDao;
import com.nupt.dao.ProjectDaoImpl;
import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;

public class ProjectServiceImpl implements ProjectService {
	private ProjectDao dao = new ProjectDaoImpl();
	
	/**
	 * 获取所有项目信息
	 */
	@Override
	public List<ProjectEntity> getProjects() {
		return dao.getProjects();
	}

	/**
	 * 根据id获取项目信息
	 */
	@Override
	public ProjectEntity getProjectById(String id) {
		long ID = Long.parseLong(id);
		ProjectEntity entity = dao.getProjectById(ID);
		//获取该项目的所有参与者
		List<MembersEntity> list = dao.getMembersOfProject(id);
		entity.setList(list);
		return entity;
	}

	/**
	 * 创建一个项目
	 */
	@Override
	public boolean addProject(ProjectEntity projectEntity) {
		return dao.addProject(projectEntity);
	}

	/**
	 * 删除一个项目
	 */
	@Override
	public boolean deleteProject(String id) {
		return dao.deleteProject(id);
	}

}
