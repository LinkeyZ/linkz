package com.meatball.linkz.project.weather.controller.vo;

import java.util.List;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.Callable;

import com.meatball.linkz.common.SimpleConfigurationParser;
import com.meatball.linkz.common.http.HttpConnection;
import com.meatball.linkz.common.http.HttpGetConnection;
import com.meatball.linkz.project.city.model.City;

public class MyTask implements Callable<String>{
	
	private List<City> cityList;
	

	public MyTask(final List<City> cityList) {
		super();
		this.cityList = cityList;
	}


	public String call() throws Exception {
		
	
		for(City city : cityList){
			Thread.sleep(2000);
			//String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress") + "/101030100.html";
			String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress")
			+"/"+ city.getCityId() + ".html";
			HttpConnection connection = new HttpGetConnection();
			String ret = connection.doConnection("GET", address, "");
			System.out.println(Thread.currentThread().getName()  + "时间： "+ System.currentTimeMillis()+" : "+ ret);
		}
		return Thread.currentThread().getName();
	}

}
