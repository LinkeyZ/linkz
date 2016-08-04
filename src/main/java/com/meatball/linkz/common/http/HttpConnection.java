package com.meatball.linkz.common.http;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;

public abstract class HttpConnection {
	
	/**
	 * <p>
	 * 模板方法，GET/POST方法需要重写beforeDoConnection
	 * </p>
	 * 
	 * @author Link.Z
	 * @date 2015-12-11 上午9:33:13
	 * @param doctorId
	 * @return
	 */
	public final String doHttpConnection(String doctorId){
		String[] retArr = beforeDoConnection(doctorId);
		String retStr = doConnection(retArr[0], retArr[1], retArr[2]);
		return retStr;
	}
	
	public abstract String[] beforeDoConnection(String doctorId);

	/**
	 * <p>
	 * 公共算法
	 * </p>
	 * 
	 * @author Link.Z
	 * @date 2015-12-11 上午9:34:12
	 * @param method
	 * @param address
	 * @param json
	 * @return
	 */
	public final String doConnection(String method,String address,String json){
		String result = "";
		
		URL url;
		DataOutputStream out = null;
		BufferedReader in =null;
		try {
			url = new URL(address);
			try {
				// 打开和URL之间的连接

				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				// 设置通用的请求属性

				connection.setDoOutput(true);
				connection.setDoInput(true);
				connection.setRequestMethod(method);
				connection.setUseCaches(false);
				connection.setInstanceFollowRedirects(true);
				connection.setRequestProperty("Content-Type", "application/json");
//				try {
//					out = new DataOutputStream(connection.getOutputStream());
//					out.write(json.getBytes());
//					out.flush();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}finally{
//					if(out!=null){
//						out.close();
//					}
//				}
				 // 建立实际的连接
				connection.connect();
				 // 获取所有响应头字段
	            Map<String, List<String>> map = connection.getHeaderFields();
	            // 遍历所有的响应头字段
//	            for (String key : map.keySet()) {
//	                System.out.println(key + "--->" + map.get(key));
//	            }
	            try {
	            	 // 定义 BufferedReader输入流来读取URL的响应

		            in = new BufferedReader(new InputStreamReader(
		                    connection.getInputStream(),"utf-8"));
		            String line;
		            while ((line = in.readLine()) != null) {
		            	result += line;
		            }
		            
				} catch (IOException e) {
					e.printStackTrace();
				}finally{
					if(in!=null){
						in.close();
					}
				}
				connection.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
