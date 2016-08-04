package com.meatball.linkz.staticRun.spider;
import java.util.ArrayList;
import java.util.List;



public class HtmlParser implements Runnable {
	private String html;
	private int page;
	public HtmlParser(String html,int page) {
		this.html = html;
		this.page = page;
	}
	
	public void run() {
		System.out.println("==========第"+page+"页============");
		
		List<String> list = new ArrayList<String>();
		html = html.substring(html.indexOf("thumbnails"));
		String[] images = html.split("span3");
		for (String image : images) {
			String[] ss = image.split("height_min");
			for (String s : ss) {
				if (s.indexOf("src=") > 0) {
					try{
						int i = s.indexOf("src=\"") + "<img src=\"".length();
						list.add(s.substring(i-5, s.indexOf("\"", i + 1)));
					}catch (Exception e) {
						System.out.println(s);
					}
					
				}
			}
		}
		for(String imageUrl : list){
			//if(imageUrl.indexOf("sina")>0){
				new Thread(new ImageCreator(imageUrl,page)).start();
			//}
		}
	}
}
