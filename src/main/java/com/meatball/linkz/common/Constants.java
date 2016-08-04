package com.meatball.linkz.common;

public final class Constants {
	public static final int DEFAULT_PAGE_SIZE = 100;

	// TOMCAT服务器路径
	public static final String TomcatPath = System.getProperty("user.dir").replace("\\bin", "\\webapps");

	public static final String fileUploadRoot = "/upload/";


	public interface Sex {

		/** 男 **/
		int man = 1;

		/** 女 **/
		int woman = 2;
	}

	public static final String constitution_paper = "233";
}
