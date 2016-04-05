package com.movie.web.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.web.global.Command;
import com.movie.web.global.CommandFactory;
import com.movie.web.global.DispatcherServlet;
import com.movie.web.global.Seperator;

@WebServlet({"/member/login_form.do",
	"/member/join_form.do",
	"/member/update_form.do",
	"/member/join.do",
	"/member/update.do",
	"/member/delete.do",
	"/member/login.do",
	"/member/list.do"})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = MemberServiceImpl.getInstance();
	
	// 페이지 이동시에는 doGet  
    protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MemberBean member = new MemberBean();
    	Command command = new Command();
    	HttpSession session = request.getSession();
    	String[] str = Seperator.extract(request);
    	List<MemberBean> list = new ArrayList<MemberBean>();
    	String directory = str[0], action = str[1];
    	int result = 0;
    	
		switch (action) {
			case "login" :
			System.out.println("====  로그인 ===========");
			if (service.isMember(request.getParameter("id"))==true) {
				System.out.println("아이디가 존재함.");
				member = service.login(request.getParameter("id"), request.getParameter("password"));
				if (member == null) {
						command = CommandFactory.createCommand(directory, "login_form");
				} else {
					System.out.println("==로그인 성공");//리게스트 영역
					session.setAttribute("user", member);//dom영역
					command = CommandFactory.createCommand(directory,"detail");
				}
			}else {
				System.out.println("===로그인 실패===");
				command = CommandFactory.createCommand(directory, "login_form");
			}
			
			break;
			
		case "update_form":
			System.out.println("수정폼으로 집입");
			command = CommandFactory.createCommand(directory, action);
			break;
			
		case "delete":
			if(service.remove(request.getParameter("id"))==1){
				command = CommandFactory.createCommand(directory, "login_form");
			} else {	
				command = CommandFactory.createCommand(directory, "detail");
			}
			break;
			
		case "join":
			Map<String, String[]> map = new HashMap<String,String[]>();
			map = request.getParameterMap();
			String[] arr = map.get("subject");
			StringBuffer buff = new StringBuffer();
			for (int i = 0; i < arr.length; i++) {
				buff.append(arr[i]+"/");
				//System.out.println(arr[i]+"/");
			}
			System.out.println("버퍼링 내의 값:"+buff.toString());
			member.setId(map.get("id")[0]);
			member.setPassword(map.get("password")[0]);
			member.setName(map.get("name")[0]);
			member.setAddr(map.get("addr")[0]);
			member.setBirth(Integer.parseInt(map.get("birth")[0]));
			member.setMajor(map.get("major")[0]);
			member.setSubject(request.getParameter("subject"));
			if (service.join(member)==1) {
				command = CommandFactory.createCommand(directory, "login_form");
			} else {
				command = CommandFactory.createCommand(directory, "join_form");		
				break;
			}
		case "update":
			member.setId(request.getParameter("id"));
			member.setName(request.getParameter("name"));
			member.setPassword(request.getParameter("password"));
			member.setAddr(request.getParameter("addr"));
			member.setBirth(Integer.parseInt(request.getParameter("birth")));
			if (service.update(member) == 1) {
				request.setAttribute("member", service.detail(request.getParameter("id")));
				command = CommandFactory.createCommand(directory, "detail");
			} else {
				request.setAttribute("member", service.detail(request.getParameter("id")));
				command = CommandFactory.createCommand(directory, "updata_form");
			}
			break;
		case "list" :
			request.setAttribute("list", service.getList());
			command = CommandFactory.createCommand(directory, "login_form");
			break;
		case "logout":
			session.invalidate();
			command = CommandFactory.createCommand(directory, "login_form");
			break;
		default:
			command = CommandFactory.createCommand(directory,action);
			break;
			
		}
		DispatcherServlet.go(request, response, command.getView());
	}

}
