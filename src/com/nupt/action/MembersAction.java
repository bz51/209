package com.nupt.action;

import java.io.File;
import java.util.List;

import com.nupt.core.Config;
import com.nupt.core.UploadTools;
import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;
import com.nupt.service.MembersService;
import com.nupt.service.MembersServiceImpl;
import com.nupt.service.Pro_memService;
import com.nupt.service.ProjectServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class MembersAction extends ActionSupport {
	private List<MembersEntity> list;
	private String id;
	private MembersEntity memberEntity;
	private File file; //上传的文件
    private String fileFileName; //文件名称
    private String fileContentType; //文件类型
    private String in_project;//这个成员参与的本实验室项目id
    private List<ProjectEntity> list_project;//该成员参与的所有项目
	private MembersService service = new MembersServiceImpl();
	
	/**
	 * 获取所有成员信息
	 */
	public String getMembers(){
		this.list = service.getMembers();
		if(this.list == null)
			return "error";
		else
			return "getMembers";
	}
	
	/**
	 * 根据成员id获取成员信息
	 */
	public String getMemberById(){
		if(this.id==null || "".equals(id))
			return "error";
		
		this.memberEntity = service.getMemberById(id);
		if(memberEntity==null)
			return "error";
		
		return "getMemberById";
	}
	
	/**
	 * 创建/修改一个成员 
	 */
	public String addMember(){
		System.out.println("in_project:"+in_project);
		//若id不为空，则为修改项目，需要将该id的记录删除
		if(memberEntity.getId()>0){
			System.out.println("修改成员信息……");
			System.out.println("member_id="+memberEntity.getId());
			boolean result = service.deleteMember(memberEntity.getId()+"");
			if(!result)
				return "error";
		}
		
		//上传图片
		String pic = Config.URL+UploadTools.upload(file, fileFileName, fileContentType);
		//将所有数据存入数据库
		memberEntity.setPic(pic);
		memberEntity.setState(1);
		boolean result = service.addMember(memberEntity,in_project);
		if(!result)
			return "error";
		return "addMember";
	}
	
	/**
	 * 删除一个成员
	 */
	public String deleteMember(){
		if(this.id==null || "".equals(id))
			return "error";
		
		boolean result = service.deleteMember(id);
		if(!result)
			return "error";
		
		return "deleteMember";
	}
	
	/**
	 * 获取本实验室的所有项目(本接口用于在打开创建页面时加载所有的项目) 
	 */
	public String getAllProjects(){
		this.list_project = new ProjectServiceImpl().getProjects();
		return "getAllProjects";
	}

	public List<MembersEntity> getList() {
		return list;
	}

	public void setList(List<MembersEntity> list) {
		this.list = list;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MembersEntity getMemberEntity() {
		return memberEntity;
	}

	public void setMemberEntity(MembersEntity memberEntity) {
		this.memberEntity = memberEntity;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getIn_project() {
		return in_project;
	}

	public void setIn_project(String in_project) {
		this.in_project = in_project;
	}

	public List<ProjectEntity> getList_project() {
		return list_project;
	}

	public void setList_project(List<ProjectEntity> list_project) {
		this.list_project = list_project;
	}
	
	
}
