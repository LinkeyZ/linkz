package com.meatball.linkz.common.debugger;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;


public class BeanAware implements BeanPostProcessor{
	  // simply return the instantiated bean as-is  
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {  
        return bean; // we could potentially return any object reference here...  
    }  
    //在创建bean后输出bean的信息  
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {  
        System.out.println("Bean '" + beanName + "' created : " + bean.toString());  
//        if (bean instanceof Servletdespa){  
//            ServletDispatcherResult result = (ServletDispatcherResult) bean;  
//        }  
        return bean;  
    }  
}
	