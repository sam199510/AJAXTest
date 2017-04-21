package com.ajax.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ajax.dao.UserDAO;
import com.ajax.entity.User;
import com.alibaba.fastjson.JSON;

@Repository
@Transactional
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO){
		this.userDAO = userDAO;
	}
	
	public String showAllUsers(){
		List<User> users = this.userDAO.showAllUsers();
		return JSON.toJSONString(users);
	}
	
	public List<User> findByUserName(String username){
		List<User> users = this.userDAO.findByUserName(username);
		return users;
	}
	
	public List<User> isLoginRight(String userName, String password){
		List<User> loginUsers = this.userDAO.isLoginRight(userName, password);
		return loginUsers;
	}
	
	public List<User> isLogin(String usernaem, String password){
		List<User> users = this.userDAO.isLogin(usernaem, password);
		return users;
	}
	
	public String showPagingUsers(int pageNum){
		List<User> pageUsers  = this.userDAO.getPageingUsers(pageNum);
		return JSON.toJSONString(pageUsers);
	}
	
	public List<User> showAllUsersNum(){
		List<User> allUsersNums = this.userDAO.showAllUsers();
		return allUsersNums;
	}
}
