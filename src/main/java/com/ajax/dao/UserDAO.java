package com.ajax.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ajax.entity.User;

@Repository
@Transactional
public class UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List showAllUsers(){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List findByUserName(String username){
		String hql = "from User u where u.userName = '"+username+"'";
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.list();
	}
	
	@SuppressWarnings("unchecked")
	public List isLoginRight(String username, String password){
		String hql = "from User u where u.userName = '"+username+"' and u.password = '"+password+"'";
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.list();
	}
	
	@SuppressWarnings("unchecked")
	public List isLogin(String userName, String password){
		String hql = "from User u where u.userName = '"+userName+"' and u.password = '"+password+"'";
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.list();
	}
	
	@SuppressWarnings("unchecked")
	public List getPageingUsers(int pageNum){
		String hql = "from User u";
		Query q = sessionFactory.getCurrentSession().createQuery(hql).setFirstResult(pageNum).setMaxResults(5);
		return q.list();
	}

}
