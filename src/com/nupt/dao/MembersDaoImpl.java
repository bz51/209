package com.nupt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.nupt.action.Pro_memServiceImpl;
import com.nupt.core.HibernateSessionFactory;
import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;
import com.nupt.service.Pro_memService;

public class MembersDaoImpl implements MembersDao {

	/**
	 * 获取所有成员信息
	 */
	@Override
	public List<MembersEntity> getMembers() {
		List<MembersEntity> list = new ArrayList<MembersEntity>();
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "select m from MembersEntity as m";
			list = session.createQuery(hql).list();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			list = null;
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return list;
	}

	/**
	 * 根据成员id获取成员信息
	 */
	@Override
	public MembersEntity getMemberById(String id) {
		MembersEntity entity = new MembersEntity();
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "select m from MembersEntity as m where id=:idString";
			entity = (MembersEntity) session.createQuery(hql)
					.setString("idString", id)
					.uniqueResult();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			entity = null;
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		System.out.println("1="+entity.getAge());
		System.out.println("2="+entity.getDegree());
		System.out.println("3="+entity.getDreams());
		System.out.println("4="+entity.getGrade());
		System.out.println("5="+entity.getId());
		System.out.println("6="+entity.getMail());
		System.out.println("7="+entity.getModule());
		System.out.println("8="+entity.getMotto());
		System.out.println("9="+entity.getName());
		System.out.println("10="+entity.getPic());
		System.out.println("11="+entity.getProject());
		System.out.println("12="+entity.getRole());
		System.out.println("13="+entity.getSchool());
		System.out.println("14="+entity.getSkills());
		System.out.println("15="+entity.getState());
		return entity;
	}

	
	/**
	 * 创建/修改一个成员
	 */
	@Override
	public boolean addMember(MembersEntity memberEntity,String in_project) {
		long id;
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			id = (long) session.save(memberEntity);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			return false;
		}finally{
			HibernateSessionFactory.closeSession();
		}
		
		//该成员至少选择了一个项目，需要将这些项目记录到表pro_mem中去
		if(in_project!=null && !"".equals(in_project)){
			Pro_memService service = new Pro_memServiceImpl();
			String[] arr = in_project.split(",");
			service.save(arr,id+"");
		}
		return true;
	}

	/**
	 * 删除一个成员
	 */
	@Override
	public boolean deleteMember(String id) {
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "update ProjectEntity set state=0 where id=:idString";
			session.createQuery(hql)
				.setString("idString", id)
				.executeUpdate();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			return false;
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return true;
	}

	/**
	 * 获取该成员参与过的项目
	 */
	@Override
	public List<ProjectEntity> getProjectsOfMember(String id) {
		List<Object[]> list = new ArrayList<Object[]>();
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "select b.id,b.name,b.pic,a.module,b.background,b.start_time from Pro_memEntity as a,ProjectEntity as b where a.pro_id=b.id and a.mem_id="+id;
			System.out.println(hql);
			list =  session.createQuery(hql).list();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			list = null;
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		
		//解析查询结果
		List<ProjectEntity> list_project = new ArrayList<ProjectEntity>();
		for(Object[] arr : list){
			ProjectEntity entity = new ProjectEntity();
			entity.setId((Long)arr[0]);
			entity.setName(arr[1].toString());
			entity.setPic(arr[2].toString());
			entity.setModule(arr[3].toString());
			entity.setBackground(arr[4].toString());
			entity.setStart_time(arr[5].toString());
			list_project.add(entity);
		}
		
		return list_project;
	}

}
