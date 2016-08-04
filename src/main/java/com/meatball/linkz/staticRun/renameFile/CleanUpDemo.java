package com.meatball.linkz.staticRun.renameFile;

import java.io.File;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class CleanUpDemo {
	
	

	public static void main(String[] args) {
		
//		String path = "E://jiandan123/50--8    154ee06gw1em6r9   e3b5pj20dw0iimzf.jpg";
//		File file = new File(path);
//		File nFile = new File("E://jiandan123/50.jpg");
//		file.renameTo(nFile);
		int i = 1;
		
		String path = "E://jiandan123";
		File file = new File(path);
		if(file.isDirectory()){
			
			File[] files = file.listFiles();
			for(File f : files){
				String page = f.getName().substring(0, f.getName().indexOf("--"));
				System.out.println(page);
			//	File fNew = new File(path+"/"+i+".jpg");
				
			}
			
		};			
		
		
		
	}

}
