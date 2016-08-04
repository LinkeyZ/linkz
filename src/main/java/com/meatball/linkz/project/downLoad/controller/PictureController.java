package com.meatball.linkz.project.downLoad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meatball.linkz.project.downLoad.service.PictureService;

/**
 * <p>
 * 
 * </p>
 * 
 * @author Link.Z
 * @date 2016-1-9 
 * @since JDK 1.7
 * @copyright Copyright 2015 BeiJing MMEDNET. All rights reserved.
 */
@Controller
@RequestMapping("/picture")
public class PictureController {
	
	@Resource
	PictureService pictureService;
	
	@RequestMapping(value="/queryPictureList",method=RequestMethod.GET)
	public String queryPictureList(){
		
		
		return "";
	}

	
	
}
