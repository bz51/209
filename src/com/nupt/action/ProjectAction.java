package com.nupt.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.nupt.core.Config;
import com.nupt.core.UploadTools;
import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;
import com.nupt.service.ProjectService;
import com.nupt.service.ProjectServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport {
	private List<ProjectEntity> list;
	private String id;//项目ID
	private ProjectEntity projectEntity;
	private File[] file; //上传的文件
    private String[] fileFileName; //文件名称
    private String[] fileContentType; //文件类型
	private ProjectService service = new ProjectServiceImpl();
	
	/**
	 * 获取所有项目信息
	 */
	public String getProjects(){
		this.list = service.getProjects();
		if(list==null)
			return "error";
		else
			return "getProjects";
	}
	
	/**
	 * 根据id获取项目信息
	 */
	public String getProjectById(){
		if(this.id==null || "".equals(id))
			return "error";
		
		this.projectEntity = service.getProjectById(id);
		if(projectEntity==null)
			return "error";
		
		System.out.println("id="+projectEntity.getId());
		System.out.println("name="+projectEntity.getName());
		System.out.println("background="+projectEntity.getBackground());
		for(MembersEntity e : projectEntity.getList()){
			System.out.println("member_id="+e.getId());
			System.out.println("member_name="+e.getName());
			System.out.println("member_pic="+e.getPic());
			System.out.println("member_module="+e.getModule());
		}
		
		return "getProjectById";
	}

	/**
	 * 创建/修改一个项目
	 */
	public String addProject() throws IOException{

		//若id不为空，则为修改项目，需要将该id的记录删除
		if(projectEntity.getId()>0){
			System.out.println("修改项目信息……");
			System.out.println("project_id="+projectEntity.getId());
			boolean result = service.deleteProject(projectEntity.getId()+"");
			if(!result)
				return "error";
		}
		
		//上传图片
		String pic_path = null;//系统缩略图在服务器中的路径
	    String structure_path = null;//系统架构图在服务器中的路径
	    String logo_path = null;//合作方logo在服务器中的路径
		for(int i=0;i<file.length;i++){
			//上传项目缩略图
			if(i==0){
				pic_path = Config.URL+UploadTools.upload(file[i], fileFileName[i], fileContentType[i]);
			}
			//上传系统架构图
			else if(i==1){
				structure_path = Config.URL+UploadTools.upload(file[i], fileFileName[i], fileContentType[i]);
			}
			//上传合作方logo
			else{
				
				logo_path = Config.URL+UploadTools.upload(file[i], fileFileName[i], fileContentType[i]);
			}
		}
		//将所有数据存入数据库
		projectEntity.setLogo(logo_path);
		projectEntity.setPic(pic_path);
		projectEntity.setStructure(structure_path);
		boolean result = service.addProject(projectEntity);
		if(!result)
			return "error";
		
		return "addProject";
	}
	
	/**
	 * 删除一个项目
	 */
	public String deleteProject(){
		if(id==null || "".equals(id))
			return "error";
		
		boolean result = service.deleteProject(id);
		if(!result)
			return "error";
		
		return "deleteProject";
	}
	
	public List<ProjectEntity> getList() {
		return list;
	}

	public void setList(List<ProjectEntity> list) {
		this.list = list;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ProjectEntity getProjectEntity() {
		return projectEntity;
	}

	public void setProjectEntity(ProjectEntity projectEntity) {
		this.projectEntity = projectEntity;
	}

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String[] getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
	}

	public ProjectService getService() {
		return service;
	}

	public void setService(ProjectService service) {
		this.service = service;
	}
	
}
