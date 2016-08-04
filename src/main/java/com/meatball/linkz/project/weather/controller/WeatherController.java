package com.meatball.linkz.project.weather.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meatball.linkz.common.SimpleConfigurationParser;
import com.meatball.linkz.common.http.HttpConnection;
import com.meatball.linkz.common.http.HttpGetConnection;
import com.meatball.linkz.project.weather.model.Weather;
import com.meatball.linkz.project.weather.service.WeatherService;

@Controller
@RequestMapping("/weather")
public class WeatherController {
	
	private final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Resource
	WeatherService weatherService;
	
	@RequestMapping("/queryCityIsSaved")
	public void queryCityIsSaved(HttpServletRequest request,HttpServletResponse response){
		System.out.println(weatherService.queryCityIsSaved("2015-12-22","101060101"));
		PrintWriter out;
		try {
			out = response.getWriter();
			out.append("123123");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping("/saveWeather")
	public void saveWeather(){
		
		final ConcurrentMap<String, String> map = new ConcurrentHashMap<String, String>();
		
		ExecutorService service = Executors.newCachedThreadPool();
		final CyclicBarrier cb = new CyclicBarrier(6, new Runnable() {
			
//pool-4-thread-2 : {"weatherinfo":{"city":"天津","cityid":"101030100","temp1":"15℃","temp2":"6℃","weather":"多云","img1":"d1.gif","img2":"n1.gif","ptime":"08:00"}}
			public void run() {
				for(Map.Entry<String, String > entry : map.entrySet()){
					System.out.println(Thread.currentThread().getName() + " : "+ entry.getKey());
					
					JSONObject json = JSONObject.fromObject(entry.getValue());
					JSONObject jsonInner = JSONObject.fromObject(json.get("weatherinfo"));
					Weather model = new Weather();
					model.setCity(jsonInner.get("city").toString());
					model.setCityId(jsonInner.get("cityid").toString());
					model.setContent(json.toString());
					model.setQueryDate(new Date());
					model.setTempurature(jsonInner.get("temp1").toString() + "到 " + jsonInner.get("temp2").toString());
					model.setWeather(jsonInner.get("weather").toString());
					
					weatherService.save(model);
					
//					if(!weatherService.queryCityIsSaved(sdf.format(model.getQueryDate()),model.getCityId())){
//						weatherService.save(model);
//					}
					
				}
				System.out.println("执行完成");
				System.out.println(weatherService.queryCityIsSaved("2015-12-22","101060101"));
			}
		}); 
		
		service.execute(new Runnable() {
			
			public void run() {
				String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101010100.html";
				HttpConnection connection = new HttpGetConnection();
				String ret = connection.doConnection("GET", address, "");
				System.out.println(Thread.currentThread().getName() +" : "+ret);
				
				map.put("101010100", ret);
				
				try {
					cb.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (BrokenBarrierException e) {
					e.printStackTrace();
				}
			}
		});
		
		service.execute(new Runnable() {
			
			public void run() {
				String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101030100.html";
				HttpConnection connection = new HttpGetConnection();
				String ret = connection.doConnection("GET", address, "");
				System.out.println(Thread.currentThread().getName() +" : "+ ret);
				map.put("101030100", ret);
				try {
					cb.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (BrokenBarrierException e) {
					e.printStackTrace();
				}
			}
		});
		
		
		service.execute(new Runnable() {
			
			public void run() {
				String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101190401.html";
				HttpConnection connection = new HttpGetConnection();
				String ret = connection.doConnection("GET", address, "");
				System.out.println(Thread.currentThread().getName() +" : "+ ret);
				map.put("101190401", ret);
				try {
					cb.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (BrokenBarrierException e) {
					e.printStackTrace();
				}
			}
		});
		
		service.execute(new Runnable() {
			
			public void run() {
				String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101190101.html";
				HttpConnection connection = new HttpGetConnection();
				String ret = connection.doConnection("GET", address, "");
				System.out.println(Thread.currentThread().getName() +" : "+ ret);
				map.put("101190101", ret);
				try {
					cb.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (BrokenBarrierException e) {
					e.printStackTrace();
				}
			}
		});
		
		service.execute(new Runnable() {
			
			public void run() {
				String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101060101.html";
				HttpConnection connection = new HttpGetConnection();
				String ret = connection.doConnection("GET", address, "");
				System.out.println(Thread.currentThread().getName() +" : "+ ret);
				map.put("101060101", ret);
				try {
					cb.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (BrokenBarrierException e) {
					e.printStackTrace();
				}
			}
		});
		
		service.execute(new Runnable() {
			
			public void run() {
				String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101090501.html";
				HttpConnection connection = new HttpGetConnection();
				String ret = connection.doConnection("GET", address, "");
				System.out.println(Thread.currentThread().getName() +" : "+ ret);
				map.put("101090501", ret);
				try {
					cb.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (BrokenBarrierException e) {
					e.printStackTrace();
				}
			}
		});
		
	}

}
