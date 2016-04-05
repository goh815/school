package com.movie.web.jquery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movie.web.global.Command;
import com.movie.web.global.CommandFactory;
import com.movie.web.global.DispatcherServlet;
import com.movie.web.global.Seperator;

/**
 * Servlet implementation class JqueryController
 */
@WebServlet({ "/jquery/attr.do","/jquery/coer.do","/jquery/dom.do",
	"/jquery/event.do","/jquery/selector.do","/jquery/traversing.do"})
public class JqueryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DispatcherServlet.go(request, response, CommandFactory.createCommand(Seperator.extract(request)[0], Seperator.extract(request)[1]).getView());
	}

}
