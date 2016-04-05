package com.movie.web.global;

import javax.servlet.http.HttpServletRequest;

public class Seperator {
	 public static String[] extract(HttpServletRequest request){
		  
		 String [] arr = new String[2];
		 String path = request.getServletPath();
		 String temp = path.split("/")[2];
		 arr[0] = path.split("/")[1];
		 arr[1] = temp.substring(0, temp.indexOf("."));
		 		 
		 return arr;
	 }
}
