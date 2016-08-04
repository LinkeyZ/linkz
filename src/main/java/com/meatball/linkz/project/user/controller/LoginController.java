package com.meatball.linkz.project.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meatball.linkz.project.user.model.Role;
import com.meatball.linkz.project.user.model.User;
import com.meatball.linkz.project.user.service.UserService;

@Controller
@RequestMapping(value="/user")
public class LoginController {

	@Resource
	UserService userService;

	
	@RequestMapping(value="/doLogin",method={RequestMethod.GET,RequestMethod.POST})
	public String dologin(Model model , HttpServletRequest request, HttpServletResponse response){
		
		return null;
	}
	
	@RequestMapping(value="/getUserRole",method=RequestMethod.GET)
	public void getUserRole(){
		User user = userService.get(1);
		
		for(Role r : user.getRoleSet()){
			System.out.println(user.getName()+"有  " + r.getName() + "的角色。");
		}
		
	}
}
