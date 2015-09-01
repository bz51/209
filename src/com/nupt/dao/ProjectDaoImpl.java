package com.nupt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.nupt.core.HibernateSessionFactory;
import com.nupt.entity.MembersEntity;
import com.nupt.entity.ProjectEntity;


public class ProjectDaoImpl implements ProjectDao {
	/**
	 * 获取所有项目信息
	 */
	@Override
	public List<ProjectEntity> getProjects() {
		List<ProjectEntity> list = new ArrayList<ProjectEntity>();
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "select p from ProjectEntity as p";
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
	 * 根据id获取项目信息
	 */
	@Override
	public ProjectEntity getProjectById(long iD) {
		ProjectEntity entity = new ProjectEntity();
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "select p from ProjectEntity as p where id=:idString";
			entity = (ProjectEntity) session.createQuery(hql)
					.setString("idString", iD+"")
					.uniqueResult();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			entity = null;
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return entity;
	}

	
	/**
	 * 创建一个项目
	 */
	@Override
	public boolean addProject(ProjectEntity projectEntity) {
		long id;
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			id = (long) session.save(projectEntity);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			return false;
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return true;
	}

	/**
	 * 删除一个项目
	 */
	@Override
	public boolean deleteProject(String id) {
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
	 * 获取该项目的所有参与者
	 * @param id 
	 */
	@Override
	public List<MembersEntity> getMembersOfProject(String id) {
		List<Object[]> list = new ArrayList<Object[]>();
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "select b.id,b.name,b.pic,a.module from Pro_memEntity as a,MembersEntity as b where a.mem_id=b.id and a.pro_id="+id;
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
		List<MembersEntity> list_member = new ArrayList<MembersEntity>();
		for(Object[] arr : list){
			MembersEntity entity = new MembersEntity();
			entity.setId((Long)arr[0]);
			entity.setName(arr[1].toString());
			entity.setPic(arr[2].toString());
			entity.setModule(arr[3].toString());
			list_member.add(entity);
			System.out.println("id:"+arr[0]);
			System.out.println("name:"+arr[1]);
			System.out.println("pic:"+arr[2]);
			System.out.println("module:"+arr[3]);
		}
		
		System.out.println("list size:"+list_member.size());
		return list_member;
	}

}
