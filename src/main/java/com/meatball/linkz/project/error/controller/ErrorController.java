package com.meatball.linkz.project.error.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ErrorController {

	@ExceptionHandler
	public String toErrorPage(){
		
		return "/error/403";
	}
}
