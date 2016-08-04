/**
 * 
 */
package com.meatball.linkz.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
	
	
	public static int getAge(Date birthDate){
		if(birthDate == null)
			throw new RuntimeException("出生日期不能为null");
		
		int age = 0;
		
		Date now = new Date();
		
		SimpleDateFormat format_y = new SimpleDateFormat("yyyy");
		SimpleDateFormat format_M = new SimpleDateFormat("MM");
		
		String birth_year = format_y.format(birthDate);
		String this_year = format_y.format(now);
		
		String birth_month = format_M.format(birthDate);
		String this_month = format_M.format(now);
		//初步，估算
		age = Integer.parseInt(this_year) - Integer.parseInt(birth_year);
		//如果味道出生月份，则－1
		if(this_month.compareTo(birth_month)<0)
			age -=1;
		if(age<0)
			age = 0;
		
		return age;
		
		
	}
	
	
	
	
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
	}

}
