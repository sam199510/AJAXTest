package com.ajax.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ajax.entity.User;
import com.ajax.model.TabNum;
import com.ajax.service.UserService;

@Controller
@RequestMapping("/")
public class AjaxController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@InitBinder
	public void InitBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("index")
	public ModelAndView indexPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ajax");
		return mav;
	}
	
	@RequestMapping(value = "showAllUsers",method=RequestMethod.GET)
	@ResponseBody
	public String showAllUsers(){
		String users=this.userService.showAllUsers();
//		System.out.println(users);
		return users;
	}
	
	@RequestMapping("register")
	public ModelAndView registerPage(){
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
	@RequestMapping(value="isFindExistUser" , method = RequestMethod.GET)
	@ResponseBody
	public int isFindExistuser(String username){
		List<User> users = this.userService.findByUserName(username);
		if (users.size()==0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public ModelAndView loginPage(){
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value="isLoginRight", method = RequestMethod.GET)
	@ResponseBody
	public int isLoginRight(String userName, String password){
		List<User> loginUsers = this.userService.isLoginRight(userName, password);
		if (loginUsers.size() == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public ModelAndView login(String userName,String password,HttpSession session){
		ModelAndView mav = new ModelAndView();
		List<User> loginUsers = this.userService.isLogin(userName, password);
		session.setAttribute("loginUser", loginUsers.get(0));
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "logout",method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView("login");
		session.invalidate();
		return mav;
	}
	
	@RequestMapping(value = "paging",method = RequestMethod.GET)
	public ModelAndView pagingPage(){
		ModelAndView mav = new ModelAndView("paging");
		return mav;
	}
	
	@RequestMapping(value = "getPagingUsers",method = RequestMethod.GET)
	@ResponseBody
	public String getPagingUsers(int pageNum){
		String pageUsers = this.userService.showPagingUsers(pageNum);
		System.out.println(pageUsers);
		return pageUsers;
		
	}
	
	@RequestMapping(value = "paging2",method = RequestMethod.GET)
	public ModelAndView pagingPage2(){
		ModelAndView mav = new ModelAndView("paging2");
		
		List<User> allUserNums = this.userService.showAllUsersNum();
		
		int pageNumSize = allUserNums.size();
		int pageNums;
		if (pageNumSize%5 == 0) {
			pageNums = pageNumSize/5;
		} else {
			pageNums = pageNumSize/5+1;
		}
		
		List<TabNum> tabNums = new ArrayList<TabNum>();
		for (int i = 0; i < pageNums; i++) {
			TabNum tabNum = new TabNum();
			if (i == 0) {
				tabNum.setState(1);
			} else {
				tabNum.setState(0);
			}
			tabNum.setTabPageNum(i+1);
			tabNums.add(tabNum);
		}
		mav.addObject("tabNums", tabNums);
		return mav;
	}
	
	@RequestMapping(value = "paging3" , method = RequestMethod.GET)
	public ModelAndView paging3(){
		ModelAndView mav = new ModelAndView("paging3");
		
		List<User> allUserNums = this.userService.showAllUsersNum();
		
		int pageNumSize = allUserNums.size();
		int pageNums;
		if (pageNumSize%5 == 0) {
			pageNums = pageNumSize/5;
		} else {
			pageNums = pageNumSize/5+1;
		}
		
		List<TabNum> tabNums = new ArrayList<TabNum>();
		for (int i = 0; i < pageNums; i++) {
			TabNum tabNum = new TabNum();
			if (i == 0) {
				tabNum.setState(1);
			} else {
				tabNum.setState(0);
			}
			tabNum.setTabPageNum(i+1);
			tabNums.add(tabNum);
		}
		mav.addObject("tabNums", tabNums);
		
		return mav;
	}
}
