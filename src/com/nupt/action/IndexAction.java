package com.nupt.action;

import java.util.List;

import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;
import com.nupt.service.MembersService;
import com.nupt.service.MembersServiceImpl;
import com.nupt.service.ProjectService;
import com.nupt.service.ProjectServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	private List<MembersEntity> list_member;
	private List<ProjectEntity> list_project;
	
	/**
	 * 获取首页信息
	 */
	public String getIndex(){
		//获取所有成员
		MembersService memberService = new MembersServiceImpl();
		list_member = memberService.getMembers();
		//获取所有项目
		ProjectService projectService = new ProjectServiceImpl();
		list_project = projectService.getProjects();
		return "getIndex";
	}

	public List<MembersEntity> getList_member() {
		return list_member;
	}

	public void setList_member(List<MembersEntity> list_member) {
		this.list_member = list_member;
	}

	public List<ProjectEntity> getList_project() {
		return list_project;
	}

	public void setList_project(List<ProjectEntity> list_project) {
		this.list_project = list_project;
	}
	
}
