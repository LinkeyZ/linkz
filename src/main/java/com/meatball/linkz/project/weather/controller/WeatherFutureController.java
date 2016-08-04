package com.meatball.linkz.project.weather.controller;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meatball.linkz.common.exception.UserException;
import com.meatball.linkz.common.genaral.JsonResult;
import com.meatball.linkz.project.city.model.City;
import com.meatball.linkz.project.city.service.CityService;
import com.meatball.linkz.project.weather.controller.vo.MyTask;

/**
 * @author xuedong.zhu
 * 使用Future实现多线程
 */

@Controller
@RequestMapping("/weatherFuture")
public class WeatherFutureController {
	
	@Resource
	CityService cityService;
	
	@ResponseBody
	@RequestMapping("/getWeather")
	public JsonResult getWeather(){
		JsonResult ret = new JsonResult();
		ret.setData("ok");
		
		List<City> cityList = cityService.listAll();
		if(cityList == null){
			throw new UserException("1");
		}
		
		ExecutorService service = Executors.newCachedThreadPool();
		MyTask task = new MyTask(cityList);
		FutureTask<String> futureTask= new FutureTask<String>(task);
		service.submit(futureTask);
		
		System.out.println(" main is done! ");
		try {
			//设置线程超时时间
			System.out.println(futureTask.get(5000,TimeUnit.MILLISECONDS));
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TimeoutException e) {
			System.out.println("超时了");
			//这个会起作用，不会继续执行线程任务。
			futureTask.cancel(true);
			service.shutdown();
			e.printStackTrace();
		}
		
//		MyTask task = new MyTask(cityList);
//		FutureTask<String> futureTask= new FutureTask<String>(task);
//		new Thread(futureTask).start();
		System.out.println("all is done !");
		
		return ret;
	}

}
