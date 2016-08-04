package com.meatball.linkz.common.exception;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.meatball.linkz.common.genaral.JsonResult;

@Aspect
@Component
public class ExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(ExceptionAdvice.class);
	
	@Around("@annotation(com.meatball.linkz.common.exception.DealException)")
	public JsonResult dealException(ProceedingJoinPoint pjp){
		System.out.println(" am in .....");
		try {
			JsonResult result = (JsonResult) pjp.proceed();
			return new JsonResult(0,"200001","Service错误","");
		} catch (RuntimeException e ) {
			System.out.println("falal error" + e);
			e.printStackTrace();
			return new JsonResult(0,"200001","Service错误","");
		}catch(Throwable e ){
			System.out.println("falal error" + e);
			e.printStackTrace();
			return new JsonResult(0,"200001","Service错误","");
		}
		
	}
}
