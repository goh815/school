package com.movie.web.global;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandFactory {	//생성자를 객체 만드는 공장
	public static Command getCommand(HttpServletRequest request, HttpServletResponse response){ //모든 팩키지들이 공용하기 위해 스타틱으로 함.
		String[] arr = new String[2];
		String path = request.getServletPath();
		String temp = path.split("/")[2];
		
		arr[0] = path.split("/")[1];
		arr[1] = temp.substring(0, temp.indexOf("."));
		
		return new Command(arr[0],arr[1]);
	}
	public static Command createCommand(String directory,String action){
		return new Command(directory,action);
	}
}
