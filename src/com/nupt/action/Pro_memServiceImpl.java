package com.nupt.action;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.nupt.core.HibernateSessionFactory;
import com.nupt.entity.Pro_memEntity;
import com.nupt.service.Pro_memService;

public class Pro_memServiceImpl implements Pro_memService {

	/**
	 * 往pro_mem表中存一条记录
	 */
	@Override
	public void save(String[] arr,String mem_id) {
		for(String s : arr){
			s = s.trim();
			Pro_memEntity entity = new Pro_memEntity();
			entity.setMem_id(Long.parseLong(mem_id));
			entity.setPro_id(Long.parseLong(s));
			entity.setModule("");
			try {
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();
				session.save(entity);
				session.getTransaction().commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			}finally{
				HibernateSessionFactory.closeSession();
			}
		}
	}

}
