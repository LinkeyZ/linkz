package com.meatball.linkz.project.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.service.BaseService;
import com.meatball.linkz.project.user.dao.UserDao;
import com.meatball.linkz.project.user.model.User;

@Service
public class UserService extends BaseService<User, Integer> {
	
	UserDao userDao;

	@Resource
	@Override
	public void setBaseDao(BaseDao<User, Integer> userDao) {
		this.userDao = (UserDao) userDao;
		this.baseDao = userDao;
	}

	public User getUserByTel() {
		StringBuffer hql = new StringBuffer(" from User ") ;
		hql.append(" where telephoneNumber = ");
		
		
		return null;
	}
	
	

}
